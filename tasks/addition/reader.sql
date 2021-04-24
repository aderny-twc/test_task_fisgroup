SELECT reader_id, CONCAT(first_name, ' ', last_name), COUNT(*)
FROM readers
JOIN library_queue USING(reader_id)
GROUP BY reader_id
ORDER BY COUNT(*) DESC
LIMIT 1
