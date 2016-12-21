/* Exercise 1 */
SELECT name, COUNT(*) AS total FROM movies
	JOIN credits ON movies.id = credits.movie_id
	JOIN people ON credits.person_id = people.id
	JOIN genres ON movies.id = genres.movie_id
WHERE genre = 'Drama' AND type = 'writer'
GROUP BY name
ORDER BY total DESC, name
LIMIT 10;

/* Exercise 2 */
SELECT name, COUNT(*) AS total FROM movies
	JOIN credits ON movies.id = credits.movie_id
	JOIN people ON credits.person_id = people.id
	JOIN genres ON movies.id = genres.movie_id
WHERE genre = 'Drama' AND type = 'writer'
	AND person_id NOT IN (
		SELECT person_id FROM credits NATURAL JOIN genres
		WHERE genre != 'Drama' AND type = 'writer'
	)
	AND movie_id NOT IN (
		SELECT movie_id FROM genres
		WHERE genre != 'Drama'
	)
GROUP BY name
ORDER BY total DESC, name
LIMIT 10;

/* Exercise 3 */
SELECT P1.name AS name1, P2.name AS name2, title FROM movies
	JOIN credits AS C1 ON movies.id = C1.movie_id
	JOIN people AS P1 ON C1.person_id = P1.id
	JOIN credits AS C2 ON movies.id = C2.movie_id
	JOIN people AS P2 ON C2.person_id = P2.id
WHERE	C1.type = 'actor'
	AND C2.type = 'actor'
	AND C1.position = 1
	AND C2.position = 1
	AND P1.name < P2.name
ORDER BY name1, name2, title;