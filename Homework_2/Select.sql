SELECT name, release_year FROM album
WHERE TO_CHAR(release_year , 'YYYY') = '2018';

SELECT track_name, duration FROM track
ORDER BY duration DESC LIMIT 1;

SELECT track_name, duration FROM track
WHERE duration > 330;

SELECT name, release_date FROM compilation
WHERE release_date BETWEEN '2018-01-01' AND '2019-12-31';

SELECT name FROM singer
WHERE name NOT LIKE '% %';

SELECT track_name FROM track
WHERE track_name LIKE '% my %';






