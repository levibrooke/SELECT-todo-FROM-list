DROP DATABASE IF EXISTS todo_app

DROP USER IF EXISTS michael

CREATE USER michael WITH ENCRYPTED PASSWORD `stonebreaker`

CREATE DATABASE todo_app

/c todo_app;

CREATE TABLE tasks (
  id  SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NULL,
  created_at  timestamp DEFAULT now() NOT NULL,
  updated_at  timestamp NULL,
  completed boolean NOT NULL DEFAULT false
);

ALTER TABLE tasks
ADD PRIMARY KEY (id)