# Задача 3
> Определите понятие «злостный читатель».  Предложите алгоритм для поиска самого злостного читателя библиотеки. На любом языке программирования опишите алгоритм поиска такого читателя. Алгоритм должен основываться на модели данных, которую вы описали в задании 1.
>

1. Берет много книг (по количеству взятых книг)

```mysql
SELECT reader_id, CONCAT(first_name, ' ', last_name), COUNT(*)
FROM readers
JOIN library_queue USING(reader_id)
GROUP BY reader_id
ORDER BY COUNT(*) DESC
LIMIT 1
```

2. Долго не возвращает книги (по среднему времени задержки книги)

```mysql
SELECT reader_id, CONCAT(first_name, ' ', last_name), COUNT(*) as books_quantity, AVG(taken - given) AS reading_time
FROM readers
JOIN library_queue USING(reader_id)
GROUP BY reader_id
ORDER BY reading_time DESC
LIMIT 1;
```

