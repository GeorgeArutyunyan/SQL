CREATE TABLE IF NOT EXISTS Gendre(
gendre_id INT PRIMARY KEY,
name_gendre VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer(
singer_id INT PRIMARY KEY,
name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Gendre_singer(
gendre_id INT NOT NULL REFERENCES Gendre(gendre_id),
singer_id INt NOT NULL REFERENCES Singer(singer_id),
CONSTRAINT pk PRIMARY KEY (gendre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Album(
album_id INT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
release_year DATE
);

CREATE TABLE IF NOT EXISTS Track(
track_id INT PRIMARY KEY,
duration DECIMAL(5, 2)
);

CREATE TABLE IF NOT EXISTS Singers_in_Albums(
singer_id INT NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (singer_id) REFERENCES Singer(singer_id),
FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Compilation(
compilation_id INT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
release_date DATE NOT NULL,
album_id INT NOT NULL,
track_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES Album(album_id),
FOREIGN KEY (track_id) REFERENCES Track(track_id)
);
