-- Читатель по количеству
SELECT reader_id, CONCAT(first_name, ' ', last_name), COUNT(*)
FROM readers
JOIN library_queue USING(reader_id)
GROUP BY reader_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- По времени чтения
SELECT reader_id, CONCAT(first_name, ' ', last_name), COUNT(*) as books_quantity, AVG(taken - given) AS reading_time
FROM readers
JOIN library_queue USING(reader_id)
GROUP BY reader_id
ORDER BY reading_time DESC
LIMIT 1;
