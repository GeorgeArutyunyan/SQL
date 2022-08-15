SELECT name_genre, COUNT(singer_id) FROM genre
	JOIN genre_singer USING(genre_id)
	GROUP BY name_genre;

SELECT album_name, album_year, COUNT(track_name) FROM album
	JOIN track USING(album_id)
	WHERE album_year BETWEEN '2019-01-01' AND '2020-12-31'
	GROUP BY album_name, album_year;

SELECT album_name, ROUND(AVG(track_length), 2) AS avg_duration FROM album
	JOIN track USING(album_id)
	GROUP BY album_name;

SELECT DISTINCT name_singer FROM singer
	JOIN singer_in_album USING(singer_id)
	JOIN album AS a USING(album_id)
	WHERE singer_id NOT IN (SELECT singer_id FROM singer_in_album
	JOIN album USING(album_id)
	WHERE TO_CHAR(album.album_year, 'YYYY') LIKE '%2020%');

SELECT name_singer, compilation_name FROM compilation
	JOIN compilation_singer USING(compilation_id)
	JOIN track USING(track_id)
	JOIN singer_in_album USING(album_id)
	JOIN singer USING(singer_id)
	WHERE name_singer LIKE 'System of a down';

SELECT album_name, name_singer, COUNT(genre_id) FROM album
	JOIN singer_in_album USING(album_id)
	JOIN genre_singer USING (singer_id)
	JOIN singer USING(singer_id)
	JOIN genre USING(genre_id)
	GROUP BY album_name, name_singer
	HAVING COUNT(genre_id) > 1;

SELECT track_name FROM track
	LEFT JOIN compilation_singer USING(track_id)
	WHERE compilation_singer.track_id IS NULL
	GROUP BY track_name;

SELECT name_singer, track_length FROM track
	JOIN singer_in_album USING(album_id)
	JOIN singer USING(singer_id)
 	WHERE track_length = (SELECT MIN(track_length) FROM track)
	GROUP BY name_singer, track_length;

SELECT album_name, COUNT(track_name) FROM album
	INNER JOIN track USING(album_id)
	GROUP BY album_name 
	HAVING COUNT(track_name) = (SELECT COUNT(track_name) FROM album
		INNER JOIN track USING(album_id)
		GROUP BY album_name
		ORDER by COUNT(track_name) LIMIT 1);

















