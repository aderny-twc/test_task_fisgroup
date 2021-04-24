-- Таблица авторов
CREATE TABLE authors (
  author_id serial PRIMARY KEY,
  first_name varchar(100) NOT NULL,
  last_name varchar(100),
  middle_name varchar(100)
);

-- Таблица книг
CREATE TABLE books (
  book_id serial PRIMARY KEY,
  title varchar(200) NOT NULL,
  publisher_id int NOT NULL,
  pub_date date,
  quantity int DEFAULT NULL,

  CONSTRAINT FK_books_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id)
);

-- Таблица издателей
CREATE TABLE publisher (
  publisher_id serial PRIMARY KEY,
  title varchar(400) NOT NULL,
);

-- Таблица читателей (студентов)
CREATE TABLE readers (
  reader_id serial PRIMARY KEY,
  first_name varchar(100) NOT NULL,
  last_name varchar(100)
);

-- Таблица библиотеки
CREATE TABLE library_queue (
  queue_id serial PRIMARY KEY,
  book_id int NOT NULL,
  reader_id int NOT NULL,
  given date,
  taken date,

  CONSTRAINT FK_library_book FOREIGN KEY(book_id) REFERENCES books(book_id),
  CONSTRAINT FK_library_reader FOREIGN KEY(reader_id) REFERENCES readers(reader_id)
);

-- Таблица авторов и книг
CREATE TABLE book_author (
  book_id int NOT NULL,
  author_id int NOT NULL,

  CONSTRAINT FK_book_author_book FOREIGN KEY(book_id) REFERENCES books(book_id),
  CONSTRAINT FK_book_author_author FOREIGN KEY(author_id) REFERENCES authors(author_id)
);
