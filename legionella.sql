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
CREATE TABLE Stazione_meterologica (
    latitudine LATITUDINE NOT NULL,
    longitudine LONGITUDINE NOT NULL,
    via VARCHAR(25) NOT NULL,
    numero_civico INTEGER NOT NULL,
    CAP CAP NOT NULL,
    città VARCHAR(25) NOT NULL,

    PRIMARY KEY (latitudine, longitudine)
);

-- Dati meteorologici
CREATE TABLE Dati_meterologici (
    data_ora DATE,
    latitudine_stazione LATITUDINE NOT NULL,
    longitudine_stazione LONGITUDINE NOT NULL,
    temperatura FLOAT NOT NULL,
    umidità FLOAT_POS NOT NULL,
    pressione_atmosferica FLOAT NOT NULL,

    PRIMARY KEY (data_ora, latitudine_stazione, longitudine_stazione),

    FOREIGN KEY (latitudine_stazione, longitudine_stazione) REFERENCES Stazione_meterologica(latitudine, longitudine)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Sito
CREATE TABLE Sito (
    latitudine LATITUDINE NOT NULL,
    longitudine LONGITUDINE NOT NULL,
    latitudine_stazione LATITUDINE NOT NULL,
    longitudine_stazione LONGITUDINE NOT NULL,
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

    FOREIGN KEY (latitudine_stazione, longitudine_stazione) REFERENCES Stazione_meterologica(latitudine, longitudine)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
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
        ON UPDATE CASCADE
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
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (codice_Richiedente) REFERENCES Richiedente(codice)
        ON DELETE RESTRICT
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
        ON DELETE RESTRICT
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
        ON DELETE RESTRICT
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
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Analisi genomica
CREATE TABLE Analisi_genomica (
    codice CHAR(6) NOT NULL,
    codice_campione CHAR(6) NOT NULL,
    data_ora DATE NOT NULL,
    genoma VARCHAR(3800000) NOT NULL,

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
    query_cover FLOAT NOT NULL,
    percent_identity FLOAT NOT NULL,
    e_value FLOAT NOT NULL,

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


-- Vincoli di integrità

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
    ELSIF NEW.esito = TRUE AND NEW.sierotipo IS NULL THEN
        RAISE EXCEPTION 'Il sierotipo deve essere specificato quando l''esito è positivo.';
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