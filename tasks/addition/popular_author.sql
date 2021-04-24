SELECT authors.author_id, CONCAT(authors.first_name, ' ', authors.last_name) as author_name, COUNT(*)
FROM authors
JOIN book_author USING(author_id)
JOIN books USING(book_id)
JOIN library_queue USING(book_id)
WHERE given BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY author_id
ORDER BY COUNT(*) DESC
LIMIT 1
