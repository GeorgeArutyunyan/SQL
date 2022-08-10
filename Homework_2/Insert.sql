INSERT INTO singer 
VALUES 
	(1, 'Rammstein'),
	(2, 'System of a down'),
	(3, 'Max Richter'),
	(4, 'Ramin Djawardi'),
	(5, 'Adele'),
	(6, 'Miyagi'),
	(7, 'Lera Lynn'),
	(8, 'Armin van Buuren')
;

INSERT INTO gendre
VALUES
	(1, 'Hip-hop'),
	(2, 'Classic'),
	(3, 'Pop'),
	(4, 'Rock'),
	(5, 'Trance')
;

INSERT INTO album
VALUES 
	(1, 'Touch the sky', '2020-11-11'),
	(2, 'Mutter', '2004-11-02'),
	(3, 'Deutschland', '2019-03-31'),
	(4, 'Chop Suey!', '2001-02-11'),
	(5, 'Toxity', '2001-09-09'),
	(6, '25', '2015-01-08'),
	(7, '30', '2021-03-19'),
	(8, 'Free again', '2022-03-19'),
	(9, 'Dream 3', '2020-12-02')
;

INSERT INTO track
	(track_name, duration, album_id)
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
	('Millions years ago', 412, 7)
;

INSERT INTO singers_in_albums 
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

INSERT INTO gendre_singer 
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
(name, release_date, album_id, track_id)
VALUES
	('Favorite', '2022-02-11', 2, 1),
	('Favorite', '2022-02-11', 2, 2),
	('Favorite', '2022-02-11', 4, 3),
	('Favorite', '2022-02-11', 4, 4),
	('Favorite', '2022-02-11', 4, 12),
	('pop_music', '2014-02-11', 6, 5),
	('pop_music', '2014-02-11', 7, 7),
	('pop_music', '2014-02-11', 8, 8),
	('pop_music', '2014-02-11', 8, 9)
;
	
