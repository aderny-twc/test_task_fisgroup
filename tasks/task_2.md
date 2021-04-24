# Задача 2
> Напишите SQL-запрос, который бы возвращал самого популярного автора за год. Запрос должен основываться на модели данных, которую вы описали в задании 1. 
>

Рассчитываем сколько раз книгу авторов брали для чтения, и выводим самого читаемого автора

```mysql
SELECT authors.author_id, CONCAT(authors.first_name, ' ', authors.last_name) as author_name, COUNT(*)
FROM authors
JOIN book_author USING(author_id)
JOIN books USING(book_id)
JOIN library_queue USING(book_id)
WHERE given BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY author_id
ORDER BY COUNT(*) DESC
LIMIT 1
```



​		Следующее задание [Задание 3](./tasks/task_3.md)