DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE albums(
    id SERIAL4 PRIMARY KEY,
    -- REFERENCES artists_id,
    name VARCHAR(255),
    genre VARCHAR(255),
    artist_id VARCHAR(255) REFERENCES artists(id)
);
