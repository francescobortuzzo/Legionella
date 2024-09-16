CREATE SCHEMA Legionella;

SET search_path TO Legionella;

-- Definizione dei tipi enum relativi a categoria e matrice

-- Tipo enum per la categoria di un sito
CREATE TYPE CATEGORIA AS
    ENUM ('ospedaliero', 'termale', 'alberghiero', 'pubblico', 'privato');

-- Tipo enum per la matrice di un campione
CREATE TYPE MATRICE AS 
    ENUM ('acqua',  'aria', 'biofilm', 'sedimento');

-- Definizione del dominio per le coordinate geografiche
-- Dominio per latitudine
CREATE DOMAIN LATITUDINE AS REAL
    CONSTRAINT latitudine_range CHECK (VALUE >= -90 AND VALUE <= 90);

-- Dominio per longitudine
CREATE DOMAIN LONGITUDINE AS REAL
    CONSTRAINT longitudine_range CHECK (VALUE >= -180 AND VALUE <= 180);

-- Dominio per il valore intero non negativo
CREATE DOMAIN INT_POS AS INTEGER
    CONSTRAINT valore_non_negativo CHECK (VALUE >= 0);

-- Dominio per il valore reale non negativo
CREATE DOMAIN FLOAT_POS AS FLOAT
    CONSTRAINT valore_non_negativo CHECK (VALUE >= 0);

-- Dominio per il pH: float tra 0 e 14
CREATE DOMAIN PH AS FLOAT
    CONSTRAINT ph_range CHECK (VALUE >= 0 AND VALUE <= 14);

-- Dominio per il CAP: intero a 5 cifre
CREATE DOMAIN CAP AS INTEGER
    CONSTRAINT cap_range CHECK (VALUE >= 10000 AND VALUE <= 99999);

-- Dominio per percent-identity e query-cover: float tra 0 e 100
CREATE DOMAIN PERCENT AS FLOAT
    CONSTRAINT percent_range CHECK (VALUE >= 0 AND VALUE <= 100);

-- DEFINIZIONE DELLE TABELLE

-- Stazione meteorologica
CREATE TABLE Stazione_meteorologica (
    latitudine LATITUDINE NOT NULL,
    longitudine LONGITUDINE NOT NULL,
    via VARCHAR(25) NOT NULL,
    numero_civico INTEGER NOT NULL,
    CAP CAP NOT NULL,
    città VARCHAR(25) NOT NULL,

    PRIMARY KEY (latitudine, longitudine)
);

-- Dati meteorologici
CREATE TABLE Dati_meteorologici (
    data_ora DATETIME,
    latitudine_stazione LATITUDINE NOT NULL,
    longitudine_stazione LONGITUDINE NOT NULL,
    temperatura FLOAT NOT NULL,
    umidità FLOAT_POS NOT NULL,
    pressione_atmosferica FLOAT NOT NULL,

    PRIMARY KEY (data_ora, latitudine_stazione, longitudine_stazione),

    FOREIGN KEY (latitudine_stazione, longitudine_stazione) REFERENCES Stazione_meterologica(latitudine, longitudine)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Sito
CREATE TABLE Sito (
    latitudine LATITUDINE NOT NULL,
    longitudine LONGITUDINE NOT NULL,
    latitudine_stazione_meteorologica LATITUDINE NOT NULL,
    longitudine_stazione_meteorologica LONGITUDINE NOT NULL,
    CAP CAP NOT NULL,
    via_piazza VARCHAR(25) NOT NULL,
    civico INTEGER NOT NULL,
    città VARCHAR(25) NOT NULL,
    nome VARCHAR(25),
    categoria CATEGORIA NOT NULL,
    materiale_tubature VARCHAR(25),
    cloro BOOLEAN NOT NULL,
    anno_ultima_ristrutturazione DATE,
    caldaia VARCHAR(25),

    PRIMARY KEY (latitudine, longitudine),

    FOREIGN KEY (latitudine_stazione_meteorologica, longitudine_stazione_meteorologica) REFERENCES Stazione_meterologica(latitudine, longitudine)
    -- gestito con trigger
);

-- Punto di prelievo
CREATE TABLE Punto_di_prelievo (
    piano INTEGER NOT NULL,
    stanza VARCHAR(15) NOT NULL,
    latitudine_sito LATITUDINE NOT NULL,
    longitudine_sito LONGITUDINE NOT NULL,
    descrizione VARCHAR(100),
    componente_idraulica VARCHAR(25) NOT NULL,

    PRIMARY KEY (latitudine_sito, longitudine_sito, piano, stanza),

    FOREIGN KEY (latitudine_sito, longitudine_sito) REFERENCES Sito(latitudine, longitudine)
        ON DELETE RESTRICT
        ON UPDATE UPDATE
);

-- FollowUp clinico
CREATE TABLE FollowUp_clinico (
    codice CHAR(6) NOT NULL,

    PRIMARY KEY (codice)
);

-- Richiedente
CREATE TABLE Richiedente (
    codice CHAR(6) NOT NULL,
    nome VARCHAR(25),

    PRIMARY KEY (codice)
);

-- Indagine ambientale
CREATE TABLE Indagine_ambientale (
    codice CHAR(6) NOT NULL,
    codice_FollowUp CHAR(6),
    codice_Richiedente CHAR(6),
    data DATE NOT NULL,

    PRIMARY KEY (codice),

    FOREIGN KEY (codice_FollowUp) REFERENCES FollowUp_clinico(codice)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (codice_Richiedente) REFERENCES Richiedente(codice)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Campione
CREATE TABLE Campione (
    codice CHAR(6) NOT NULL,
    longitudine_sito LONGITUDINE NOT NULL,
    latitudine_sito LATITUDINE NOT NULL,
    piano_punto_prelievo INTEGER NOT NULL,
    stanza_punto_prelievo VARCHAR(15) NOT NULL,
    codice_indagine CHAR(6) NOT NULL,
    temperatura FLOAT NOT NULL,
    matrice MATRICE NOT NULL,
    volume FLOAT_POS NOT NULL,

    PRIMARY KEY (codice),

    FOREIGN KEY (longitudine_sito, latitudine_sito, piano_punto_prelievo, stanza_punto_prelievo) REFERENCES Punto_di_prelievo(longitudine_sito, latitudine_sito, piano, stanza)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (codice_indagine) REFERENCES Indagine_ambientale(codice)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Analisi PCR
CREATE TABLE Analisi_PCR (
    codice CHAR(6) NOT NULL,
    codice_campione CHAR(6) NOT NULL,
    data_ora DATE NOT NULL,
    esito BOOLEAN NOT NULL,
    µg_l INT_POS NOT NULL,

    PRIMARY KEY (codice),

    FOREIGN KEY (codice_campione) REFERENCES Campione(codice)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Analisi colturale
CREATE TABLE Analisi_culturale (
    codice CHAR(6) NOT NULL,
    codice_campione CHAR(6) NOT NULL,
    data_ora DATE NOT NULL,
    esito BOOLEAN NOT NULL,
    ufc_l INT_POS NOT NULL,
    sierotipo VARCHAR(50),

    PRIMARY KEY (codice),

    FOREIGN KEY (codice_campione) REFERENCES Campione(codice)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Analisi del pH
CREATE TABLE Analisi_pH (
    codice CHAR(6) NOT NULL,
    codice_campione CHAR(6) NOT NULL,
    data_ora DATE NOT NULL,
    ph PH NOT NULL,

    PRIMARY KEY (codice),

    FOREIGN KEY (codice_campione) REFERENCES Campione(codice)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Analisi genomica
CREATE TABLE Analisi_genomica (
    codice CHAR(6) NOT NULL,
    codice_campione CHAR(6) NOT NULL,
    data_ora DATE NOT NULL,
    genoma TEXT NOT NULL,

    PRIMARY KEY (codice),

    FOREIGN KEY (codice_campione) REFERENCES Campione(codice)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Gene
CREATE TABLE Gene (
    protein_ID CHAR(6) NOT NULL,
    nome VARCHAR(75),

    PRIMARY KEY (protein_ID)
);

-- Gene del genoma
CREATE TABLE Gene_genoma (
    posizione INTEGER NOT NULL,
    codice_genoma CHAR(6) NOT NULL,
    protein_ID CHAR(6) NOT NULL,
    posizione_predecessore INTEGER,
    codice_genoma_predecessore CHAR(6),
    protein_ID_predecessore CHAR(6),
    query_cover PERCENT NOT NULL,
    percent_identity PERCENT NOT NULL,
    e_value FLOAT_POS NOT NULL,

    PRIMARY KEY (posizione, codice_genoma, protein_ID),

    FOREIGN KEY (codice_genoma) REFERENCES Analisi_genomica(codice)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (protein_ID) REFERENCES Gene(protein_ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (posizione_predecessore, codice_genoma_predecessore, protein_ID_predecessore) REFERENCES Gene_genoma(posizione, codice_genoma, protein_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


-- TRIGGER

-- TABELLA SITO

-- Funnzione di Haversine
CREATE OR REPLACE FUNCTION distance(lat1 LATITUDINE, lon1 LONGITUDINE, lat2 LATITUDINE, lon2 LONGITUDINE)
RETURNS FLOAT LANGUAGE plpgsql AS
$$
DECLARE
    R FLOAT := 6371; -- Raggio medio della Terra in km
    phi1 FLOAT := RADIANS(lat1);
    phi2 FLOAT := RADIANS(lat2);
    delta_phi FLOAT := RADIANS(lat2 - lat1);
    delta_lambda FLOAT := RADIANS(lon2 - lon1);
    a FLOAT;
    c FLOAT;
BEGIN
    a := SIN(delta_phi / 2) * SIN(delta_phi / 2) + COS(phi1) * COS(phi2) * SIN(delta_lambda / 2) * SIN(delta_lambda / 2);
    c := 2 * ATAN2(SQRT(a), SQRT(1 - a));
    RETURN R * c;
END;
$$;

-- Trigger insert/update on Stazione_meteorologica
CREATE OR REPLACE FUNCTION update_stazione_meteorologica()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
DECLARE
    lat_sito FLOAT;
    lon_sito FLOAT;
    lat_stazione FLOAT;
    lon_stazione FLOAT;
    current_distance FLOAT;
    min_distance FLOAT;
    lat_stazione_vicina FLOAT;
    lon_stazione_vicina FLOAT;
BEGIN
    -- Aggiorna i siti per riflettere la stazione meteorologica più vicina
    FOR lat_sito, lon_sito IN
        SELECT lat, lon
        FROM Sito
    LOOP
        min_distance := 'infinity'; -- Inizializzo la distanza minima a infinito
        FOR lat_stazione, lon_stazione IN
            SELECT lat, lon
            FROM Stazione_meteorologica
        LOOP
            current_distance := calculate_distance(lat_sito, lon_sito,
                                                   lat_stazione, lon_stazione);
            IF current_distance < min_distance THEN
                min_distance := current_distance;
                lat_stazione_vicina := lat_stazione;
                lon_stazione_vicina := lon_stazione;
            END IF;
        END LOOP;

        -- Aggiorna il sito con la stazione meteorologica più vicina
        UPDATE Sito
        SET latitudine_stazione_meteorologica = lat_stazione_vicina,
            longitudine_stazione_meteorologica = lon_stazione_vicina
        WHERE lat = lat_sito AND lon = lon_sito;
    END LOOP;

    RETURN NEW;
END;
$$;

CREATE TRIGGER update_stazione_meteorologica_trigger
AFTER INSERT OR UPDATE ON Stazione_meteorologica
FOR EACH ROW
EXECUTE FUNCTION update_stazione_meteorologica();

-- Trigger delete on Stazione_meteorologica
CREATE OR REPLACE FUNCTION delete_stazione_meteorologica()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
DECLARE
    lat_sito FLOAT;
    lon_sito FLOAT;
    lat_stazione FLOAT;
    lon_stazione FLOAT;
    current_distance FLOAT;
    min_distance FLOAT;
    lat_stazione_vicina FLOAT;
    lon_stazione_vicina FLOAT;
BEGIN

    -- Controllo che ci siano stazioni meteorologiche rimaste
    IF (SELECT COUNT(*) FROM Stazione_meteorologica) = 1 THEN
        RAISE EXCEPTION 'Non è possibile eliminare tutte le stazioni meteorologiche.';
        RETURN OLD;
    END IF;

    -- Aggiorna i siti per riflettere la stazione meteorologica più vicina rimasta
    FOR lat_sito, lon_sito IN
        SELECT lat, lon
        FROM Sito
        WHERE latitudine_stazione_meteorologica = OLD.lat AND
              longitudine_stazione_meteorologica = OLD.lon
    LOOP
        min_distance := 'infinity'; -- Inizializzo la distanza minima a infinito
        FOR lat_stazione, lon_stazione IN
            SELECT lat, lon
            FROM Stazione_meteorologica
        LOOP
            current_distance := calculate_distance(lat_sito, lon_sito,
                                                   lat_stazione, lon_stazione);
            IF current_distance < min_distance THEN
                min_distance := current_distance;
                lat_stazione_vicina := lat_stazione;
                lon_stazione_vicina := lon_stazione;
            END IF;
        END LOOP;

        -- Aggiorna il sito con la nuova stazione meteorologica più vicina
        UPDATE Sito
        SET latitudine_stazione_meteorologica = lat_stazione_vicina,
            longitudine_stazione_meteorologica = lon_stazione_vicina
        WHERE lat = lat_sito AND lon = lon_sito;
    END LOOP;

    RETURN OLD;
END;
$$;

CREATE TRIGGER delete_stazione_meteorologica_trigger
BEFORE DELETE ON Stazione_meteorologica
FOR EACH ROW
EXECUTE FUNCTION delete_stazione_meteorologica();


-- TRIGGER ANALISI PCR E COLTURALE
-- Analisi PCR
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


-- Analisi colturale
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


-- Campioni di una stessa indagine devono essere raccolti nello stesso sito
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


-- Vincoli geni del genoma

  posizione INTEGER NOT NULL,
    codice_genoma CHAR(6) NOT NULL,
    protein_ID CHAR(6) NOT NULL,
    posizione_predecessore INTEGER,
    codice_genoma_predecessore CHAR(6),
    protein_ID_predecessore CHAR(6),
    query_cover PERCENT NOT NULL,
    percent_identity PERCENT NOT NULL,
    e_value FLOAT_POS NOT NULL,

-- Non posso associare a un gene un gene di un genoma differente
--Non posso associare un gene a se stesso
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


-- Vincoli geni del genoma
-- Controllo che sia il corretto predecessore

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


