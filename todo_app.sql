DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id  SERIAL NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NULL,
  created_at  timestamp DEFAULT now() NOT NULL,
  updated_at  timestamp NULL,
  completed boolean NOT NULL DEFAULT false
);

ALTER TABLE tasks
ADD PRIMARY KEY (id);

ALTER TABLE tasks
DROP COLUMN completed;

ALTER TABLE tasks
ADD COLUMN completed_at timestamp DEFAULT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks (id, title, description, created_at, updated_at, completed_at)
VALUES (default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT *
FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;
