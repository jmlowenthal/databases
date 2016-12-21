match (p1:Person)-[:ACTS_IN*2]-(p2:Person)
where p1.name = 'Lawrence, Jennifer (III)'
  and p2.name <> p1.name
with p2.name as name, count(p2) as total
where total > 1
return name, total
order by name, total;

match path = allshortestpaths( (g1:Genre)-[:HAS_GENRE*]-(g2:Genre) )
where g1.genre < g2.genre
return distinct g1.genre as genre1, g2.genre as genre2, length(path) / 2 as length
order by length desc, genre1, genre2;

match
	(A:Movie)-[:HAS_GENRE*2]-(B:Movie),
	k = (A)-[:HAS_KEYWORD*2]-(B),
	a = (A)-[:ACTS_IN*2]-(B)
where A.title = 'Skyfall (2012)' and A.movie_id <> B.movie_id
return B.title as title, count(distinct k) + count(distinct a) * 10 as score
order by score desc;