-- 1. Inserimento di una stazione meteorologica
CREATE OR REPLACE FUNCTION insert_stazione_meteorologica(
    latitudine FLOAT,
    longitudine FLOAT,
    via_piazza VARCHAR(25),
    numero_civico INTEGER,
    CAP INTEGER,
    città VARCHAR(25)
)
RETURNS VOID LANGUAGE plpgsql AS
$$
DECLARE
    point GEOMETRY;
BEGIN
    -- Crea un punto geometrico a partire da latitudine e longitudine
    point := ST_SetSRID(ST_MakePoint(longitudine, latitudine), 4326);

    -- Inserisci i valori nella tabella Sito
    INSERT INTO Sito (latitudine, longitudine, via_piazza, civico, CAP, città, geom)
    VALUES (latitudine, longitudine, via_piazza, numero_civico, CAP, città, point);

    RETURN;
END;
$$;

-- 2. Aggiornamento di una stazione meteorologica
CREATE OR REPLACE FUNCTION update_stazione_meteorologica(
    old_latitudine LATITUDINE,
    old_longitudine LONGITUDINE,
    new_latitudine LATITUDINE,
    new_longitudine LONGITUDINE,
    via_piazza VARCHAR(25),
    numero_civico INTEGER,
    CAP CAP,
    città VARCHAR(25)
)
RETURNS VOID LANGUAGE plpgsql AS
$$
DECLARE
    point GEOMETRY;
BEGIN
    point := ST_SetSRID(ST_MakePoint(new_longitudine, new_latitudine), 4326);

    UPDATE Sito
    SET latitudine = new_latitudine,
        longitudine = new_longitudine,
        via_piazza = via_piazza,
        civico = numero_civico,
        CAP = CAP,
        città = città,
        geom = point
    WHERE latitudine = old_latitudine
      AND longitudine = old_longitudine;

    RETURN;
END;

-- 3. Inserimento di un sito
CREATE OR REPLACE FUNCTION insert_sito(
    latitudine LATITUDINE,
    longitudine LONGITUDINE,
    via_piazza VARCHAR(25),
    numero_civico INTEGER,
    CAP CAP,
    città VARCHAR(25)
)
RETURNS VOID LANGUAGE plpgsql AS
$$
DECLARE
    point GEOMETRY;
    latitudine_stazione_meteorologica LATITUDINE;
    longitudine_stazione_meteorologica LONGITUDINE;
BEGIN
    -- Crea un punto geometrico per il sito
    point := ST_SetSRID(ST_MakePoint(longitudine, latitudine), 4326);

    SELECT stazione.latitudine, stazione.longitudine
    INTO latitudine_stazione_meteorologica, longitudine_stazione_meteorologica
    FROM Stazione_meteorologica stazione
    WHERE ST_DWithin(
        geography(point),
        geography(stazione.geom),
        100000 -- 100 km
    )
    ORDER BY ST_Distance(point, stazione.geom)
    LIMIT 1;

    -- Inserisci i valori nella tabella Sito
    INSERT INTO Sito (latitudine, longitudine, latitudine_stazione_meteorologica, longitudine_stazione_meteorologica, via_piazza, civico, CAP, città, geom, latitudine_stazione_meteorologica, longitudine_stazione_meteorologica)

    VALUES (latitudine, longitudine, latitudine_stazione_meteorologica, longitudine_stazione_meteorologica, via_piazza, numero_civico, CAP, città, point, latitudine_stazione_meteorologica, longitudine_stazione_meteorologica);

    RETURN NULL;
END;
$$;

-- 4. Aggiornamento di un sito
CREATE OR REPLACE FUNCTION update_sito(
    old_latitudine LATITUDINE,
    old_longitudine LONGITUDINE,
    new_latitudine LATITUDINE,
    new_longitudine LONGITUDINE,
    via_piazza VARCHAR(25),
    numero_civico INTEGER,
    CAP CAP,
    città VARCHAR(25)
)
RETURNS VOID LANGUAGE plpgsql AS
$$
DECLARE
    point GEOMETRY;
    latitudine_stazione_meteorologica LATITUDINE;
    longitudine_stazione_meteorologica LONGITUDINE;
BEGIN
    point := ST_SetSRID(ST_MakePoint(new_longitudine, new_latitudine), 4326);

    SELECT stazione.latitudine, stazione.longitudine
    INTO latitudine_stazione_meteorologica, longitudine_stazione_meteorologica
    FROM Stazione_meteorologica stazione
    WHERE ST_DWithin(
        geography(point),
        geography(stazione.geom),
        100000 -- 100 km
    )
    ORDER BY ST_Distance(point, stazione.geom)
    LIMIT 1;

    UPDATE Sito
    SET latitudine = new_latitudine,
        longitudine = new_longitudine,
        latitudine_stazione_meteorologica = latitudine_stazione_meteorologica,
        longitudine_stazione_meteorologica = longitudine_stazione_meteorologica,
        via_piazza = via_piazza,
        civico = numero_civico,
        CAP = CAP,
        città = città,
        geom = point
    WHERE latitudine = old_latitudine
      AND longitudine = old_longitudine;

    RETURN NULL;
END;