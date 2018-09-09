DROP schema IF EXISTS moviesdb;

CREATE DATABASE IF NOT EXISTS moviesdb;

DROP TABLE IF EXISTS moviesdb.reviewer;
DROP TABLE IF EXISTS moviesdb.movie_table;
DROP TABLE IF EXISTS moviesdb.reviews;


/* 3 table */
CREATE TABLE moviesdb.reviewer
(
  reviewer_id int PRIMARY KEY,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL
);

CREATE TABLE moviesdb.movie_table
(
  movie_id int PRIMARY KEY,
  movie_name varchar(50) NOT NULL
);

CREATE TABLE moviesdb.reviews
(
	movie_id int NOT NULL,
    reviewer_id INT,
    ratings INT,
	FOREIGN KEY (reviewer_id) REFERENCES moviesdb.reviewer (reviewer_id) 
		ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES moviesdb.movie_table (movie_id) 
		ON UPDATE CASCADE
 );
 
 /* load data */
 INSERT INTO moviesdb.reviewer (reviewer_id, first_name, last_name)
 VALUES (1, 'Jovaria', 'Asif'),
		(2, 'Naimul', 'Islam'),
		(3, 'Mansi', 'Thakkar'),
        (4, 'Davinder', 'Singh'),
        (5, 'Lesile', 'Remirez');

INSERT INTO moviesdb.movie_table (movie_id, movie_name)
VALUES (1, "The Num"),
	   (2, "Mission Impossible – Fallout"),
       (3, "The Predator"),
       (4, "Avengers Infinity War"),
       (5, "The Meg"),
       (6, "Stree");

INSERT INTO moviesdb.reviews ( movie_id, reviewer_id, ratings )
VALUES (1, 1, 3),
	   (1, 2, 4),
       (1, 3, 3), 
       (1, 4, 4),
       (1, 5, 3),
       (2, 1, 4),
	   (2, 2, 4),
       (2, 3, 4), 
       (2, 4, 4),
       (2, 5, 4),
       (3, 1, 2),
	   (3, 2, 3),
       (3, 3, 2), 
       (3, 4, 3),
       (3, 5, 3),
       (4, 1, 5),
	   (4, 2, 4),
       (4, 3, 5), 
       (4, 4, 4),
       (4, 5, 4),
       (5, 1, 2),
	   (5, 2, 2),
       (5, 3, 2), 
       (5, 4, 2),
       (5, 5, 1),
       (6, 1, 3),
	   (6, 2, 4),
       (6, 3, 5), 
       (6, 4, 4),
       (6, 5, 4);
       
SELECT p.first_name, p.last_name, m.movie_name, r.ratings FROM moviesdb.reviewer p
	LEFT JOIN moviesdb.reviews r
		ON p.reviewer_id = r.reviewer_id
	LEFT JOIN moviesdb.movie_table m
		ON m.movie_id = r.movie_id
	ORDER BY m.movie_name;
