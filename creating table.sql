CREATE TABLE IF NOT EXISTS genre(
	genre_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name_genre VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS singer(
	singer_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name_singer VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_singer(
	genre_singer_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	genre_id INT,
	singer_id INT,
	FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
	FOREIGN KEY (singer_id)	REFERENCES singer(singer_id) 
);

CREATE TABLE IF NOT EXISTS album(
	album_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	album_name VARCHAR(30) UNIQUE NOT NULL,
	album_year DATE
);

CREATE TABLE IF NOT EXISTS singer_in_album(
	singer_in_album_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	singer_id INT,
	album_id INT,
	FOREIGN KEY (singer_id) REFERENCES singer(singer_id),
	FOREIGN KEY (album_id) REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS track(
	track_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	track_name VARCHAR(30) UNIQUE NOT NULL,
	track_length INT NOT NULL CHECK(track_length > 120),
	album_id INT,
	FOREIGN KEY (album_id) REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS compilation(
	compilation_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	compilation_name VARCHAR(30) NOT NULL,
	compilation_year DATE CHECK(compilation_year >= '1995-01-01')
);

CREATE TABLE IF NOT EXISTS compilation_singer(
	compilation_singer_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	compilation_id INT,
	track_id INT,
	FOREIGN KEY (compilation_id) REFERENCES compilation(compilation_id),
	FOREIGN KEY (track_id) REFERENCES track(track_id)
);







