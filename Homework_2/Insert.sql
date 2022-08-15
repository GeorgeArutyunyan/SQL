INSERT INTO singer (name_singer)
VALUES 
	('Rammstein'),
	('System of a down'),
	('Max Richter'),
	('Ramin Djawardi'),
	('Adele'),
	('Miyagi'),
	('Lera Lynn'),
	('Armin van Buuren')
;

INSERT INTO genre (name_genre)
VALUES
	('Hip-hop'),
	('Classic'),
	('Pop'),
	('Rock'),
	('Trance')
;

INSERT INTO album (album_name, album_year)
VALUES 
	('Touch the sky', '2020-11-11'),
	('Mutter', '2004-11-02'),
	('Deutschland', '2019-03-31'),
	('Chop Suey!', '2001-02-11'),
	('Toxity', '2001-09-09'),
	('25', '2015-01-08'),
	('30', '2021-03-19'),
	('Free again', '2022-03-19'),
	('Dream 3', '2020-12-02')
;

INSERT INTO track
	(track_name, track_length , album_id)
VALUES 
	('Mutter', 231, 2),
	('Sonne', 121, 2),
	('Chop Suey', 144, 4),
	('ATWA', 190, 4),
	('Hello', 222, 6),
	('Someone like you', 215, 6),
	('Skyfall', 128, 7),
	('Free again', 198, 8),
	('Ring of fire', 200, 8),
	('Frozen Throne', 181, 9),
	('Lord of castomare', 233, 9),
	('Lonely day', 312, 4),
	('Aerials', 412, 5),
	('Easy on me', 322, 7),
	('Millions years ago', 412, 7),
	('Ohne dich', 310, 3)
;

INSERT INTO singer_in_album (singer_id, album_id)
VALUES
	(1, 2),
	(1, 3),
	(2, 4),
	(2, 5),
	(3, 1),
	(5, 6),
	(5, 7),
	(7, 8),
	(8, 9)
;

INSERT INTO genre_singer (genre_id, singer_id)
VALUES 
	(1, 6),
	(2, 3),
	(2, 4),
	(3, 5),
	(3, 7),
	(4, 1),
	(4, 2),
	(5, 8)
;

INSERT INTO compilation 
(compilation_name, compilation_year)
VALUES
	('Favorite', '2022-02-11'),
	('Favorite', '2022-02-11'),
	('Favorite', '2022-02-11'),
	('Favorite', '2022-02-11'),
	('Favorite', '2022-02-11'),
	('pop_music', '2014-02-11'),
	('pop_music', '2014-02-11'),
	('pop_music', '2014-02-11'),
	('pop_music', '2014-02-11')
;

INSERT INTO compilation_singer 
(compilation_id, track_id)
VALUES 
	(1, 1),
	(1, 2),
	(1, 4),
	(1, 5),
	(1, 6),
	(2, 3),
	(2, 9),
	(2, 10),
	(2, 11)
;
