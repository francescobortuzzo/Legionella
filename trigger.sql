-- TRIGGER

--1. Trigger per aggiornamento automatico della stazione meteorologica più vicina
-- 1.A : On Insert or Update
SET search_path TO legionella;

CREATE OR REPLACE FUNCTION update_stazione_meteorologica()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    UPDATE Sito
    SET latitudine_stazione_meteorologica = stazione.latitudine,
        longitudine_stazione_meteorologica = stazione.longitudine
    FROM (
        SELECT sito.latitudine AS sito_latitudine,
               sito.longitudine AS sito_longitudine,
               stazione.latitudine,
               stazione.longitudine,
               ST_Distance(sito.geom, stazione.geom) AS distance,
               ROW_NUMBER() OVER (PARTITION BY sito.latitudine, sito.longitudine ORDER BY ST_Distance(sito.geom, stazione.geom)) AS rn
        FROM Sito sito
        JOIN Stazione_meteorologica stazione
        ON ST_DWithin(
            geography(sito.geom), 
            geography(stazione.geom), 
            100000 -- 100 km
        )
    ) AS stazione
    WHERE Sito.latitudine = stazione.sito_latitudine
      AND Sito.longitudine = stazione.sito_longitudine
      AND rn = 1;
    RETURN NULL;
END;
$$;
-- si utilizza ROW_NUMBER per cercare la stazione meteorologica più vicina per ciascun sito
-- partition by per raggruppare i siti con la stessa latitudine e longitudine

CREATE TRIGGER update_stazione_meteorologica_trigger
AFTER INSERT OR UPDATE ON Stazione_meteorologica
FOR EACH ROW
EXECUTE FUNCTION update_stazione_meteorologica();

-- 1.B : On Delete
CREATE OR REPLACE FUNCTION update_stazione_meteorologica_on_delete()
RETURNS TRIGGER LANGUAGE plpgsql AS
$$
BEGIN
    -- Verifica se ci sono più di una stazione meteorologica
    IF (SELECT COUNT(*) FROM Stazione_meteorologica) = 1 THEN
        RAISE EXCEPTION 'Non è possibile eliminare tutte le stazioni meteorologiche.';
    END IF;

    -- Trova la stazione meteorologica più vicina per ciascun sito che aveva come più vicina la stazione cancellata
    UPDATE Sito
    SET latitudine_stazione_meteorologica = stazione.latitudine,
        longitudine_stazione_meteorologica = stazione.longitudine
    FROM (
        SELECT sito.latitudine AS sito_latitudine, sito.longitudine AS sito_longitudine,
               stazione.latitudine, stazione.longitudine,
               ST_Distance(sito.geom, stazione.geom) AS distance,
               ROW_NUMBER() OVER (PARTITION BY sito.latitudine, sito.longitudine ORDER BY ST_Distance(sito.geom, stazione.geom)) AS rn

        FROM Sito sito
        JOIN Stazione_meteorologica stazione
        ON ST_DWithin(
            geography(sito.geom), 
            geography(stazione.geom), 
            100000 -- 100 km
        )
        WHERE (stazione.latitudine != OLD.latitudine OR stazione.longitudine != OLD.longitudine)

    ) AS stazione
    WHERE Sito.latitudine = stazione.sito_latitudine
      AND Sito.longitudine = stazione.sito_longitudine
      AND rn = 1;
    
    RETURN NULL;
END;
$$;

CREATE TRIGGER update_stazione_meteorologica_on_delete_trigger
BEFORE DELETE ON Stazione_meteorologica
FOR EACH ROW
EXECUTE FUNCTION update_stazione_meteorologica_on_delete();


--2. Analisi PCR
CREATE OR REPLACE FUNCTION check_esito_PCR()
RETURNS TRIGGER LANGUAGE plpgsql AS
$$
BEGIN
    IF NEW.esito = TRUE AND NEW.µg_l = 0 THEN
        RAISE EXCEPTION 'Il valore µg/l deve essere maggiore di 0 quando l''esito è positivo.';
    ELSIF NEW.esito = FALSE AND NEW.µg_l > 0 THEN
        RAISE EXCEPTION 'Il valore µg/l deve essere 0 quando l''esito è negativo.';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER check_esito_PCR
BEFORE INSERT OR UPDATE ON Analisi_PCR
FOR EACH ROW
EXECUTE FUNCTION check_esito_PCR();


--3. Analisi colturale
CREATE OR REPLACE FUNCTION check_esito_Colturale()
RETURNS TRIGGER LANGUAGE plpgsql AS
$$
BEGIN
    IF NEW.esito = TRUE AND NEW.ufc_l = 0 THEN
        RAISE EXCEPTION 'Il valore ufc/l deve essere maggiore di 0 quando l''esito è positivo.';
    ELSIF NEW.esito = FALSE AND NEW.ufc_l > 0 THEN
        RAISE EXCEPTION 'Il valore ufc/l deve essere 0 quando l''esito è negativo.';
    ELSIF NEW.esito = FALSE AND NEW.sierotipo IS NOT NULL THEN
        RAISE EXCEPTION 'Il sierotipo non può essere specificato quando l''esito è negativo.';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER check_esito_Colturale
BEFORE INSERT OR UPDATE ON Analisi_culturale
FOR EACH ROW
EXECUTE FUNCTION check_esito_Colturale();


--4. Sito dei campioni di un'indagine
CREATE OR REPLACE FUNCTION check_campione_indagine()
RETURNS TRIGGER LANGUAGE plpgsql AS
$$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Indagine_ambientale JOIN Campione ON codice = codice_indagine
        WHERE codice = NEW.codice_indagine
        AND (latitudine_sito != NEW.latitudine_sito OR longitudine_sito != NEW.longitudine_sito)
    ) THEN
        RAISE EXCEPTION 'I campioni raccolti nell''ambito di una stessa indagine devono essere prelevati nel medesimo sito.';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER check_campione_indagine
BEFORE INSERT OR UPDATE ON Campione
FOR EACH ROW
EXECUTE FUNCTION check_campione_indagine();

-- 5. Sequenzialità geni del genoma

--5.A : Trigger per controllare che un gene non venga associato a se stesso o a un genoma diverso
CREATE OR REPLACE FUNCTION check_genoma()
RETURNS TRIGGER LANGUAGE plpgsql AS
$$
BEGIN
    IF NEW.codice_genoma != NEW.codice_genoma_predecessore THEN
        RAISE EXCEPTION 'Non è possibile associare un gene a un genoma differente.';
    END IF;
    IF NEW.posizione = NEW.posizione_predecessore AND NEW.codice_genoma = NEW.codice_genoma_predecessore AND NEW.protein_ID = NEW.protein_ID_predecessore THEN
        RAISE EXCEPTION 'Non è possibile associare un gene a se stesso.';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER check_genoma
BEFORE INSERT OR UPDATE ON Gene_genoma
FOR EACH ROW
EXECUTE FUNCTION check_genoma();

--5.B : Trigger per controllare che il gene predecessore sia corretto
CREATE OR REPLACE FUNCTION check_predecessore()
RETURNS TRIGGER LANGUAGE plpgsql AS
$$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Gene_genoma
        WHERE codice_genoma = NEW.codice_genoma_predecessore AND posizione > NEW.posizione_predecessore AND posizione < NEW.posizione
    ) THEN
        RAISE EXCEPTION 'Il gene predecessore non è corretto: esiste un gene con posizione compresa tra la posizione del gene e quella del gene predecessore.';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER check_predecessore
BEFORE INSERT OR UPDATE ON Gene_genoma
FOR EACH ROW
EXECUTE FUNCTION check_predecessore();

--6. Eliminazione di un'indagine se non ci sono più campioni associati
CREATE OR REPLACE FUNCTION delete_indagine()
RETURNS TRIGGER LANGUAGE plpgsql AS
$$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Campione
        WHERE codice_indagine = OLD.codice
    ) THEN
        DELETE FROM Indagine_ambientale
        WHERE codice = OLD.codice;
    END IF;
END;
$$;

CREATE TRIGGER delete_indagine
AFTER DELETE ON Campione
FOR EACH ROW
EXECUTE FUNCTION delete_indagine();

--7. Eliminazione di un richiedente o di un follow-up se non ci sono più indagini associate

CREATE OR REPLACE FUNCTION delete_richiedente_follow_up()
RETURNS TRIGGER LANGUAGE plpgsql AS
$$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Indagine_ambientale
        WHERE codice_richiedente = OLD.codice
    ) THEN
        DELETE FROM Richiedente
        WHERE codice = OLD.codice;
    END IF;
    IF NOT EXISTS (
        SELECT 1
        FROM Indagine_ambientale
        WHERE codice_follow_up = OLD.codice
    ) THEN
        DELETE FROM Follow_up
        WHERE codice = OLD.codice;
    END IF;
END;
$$;

CREATE TRIGGER delete_richiedente_follow_up
AFTER DELETE ON Indagine_ambientale
FOR EACH ROW
EXECUTE FUNCTION delete_richiedente_follow_up();