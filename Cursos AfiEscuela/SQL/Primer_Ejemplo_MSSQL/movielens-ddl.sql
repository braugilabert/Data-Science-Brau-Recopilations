/*********************/
/* DATABASE CREATION */
/*********************/

/* Create database */
CREATE DATABASE movielens;

/* Drop database */
DROP DATABASE movielens;

/* Create database with character set definition */
CREATE DATABASE movielens COLLATE Modern_Spanish_CI_AS;



/**********************/
/* DATABASE SELECTION */
/**********************/

/* Select database */
USE movielens;



/******************/
/* TABLE CREATION */
/******************/

/* Create genders table */
CREATE TABLE genders (
	id INT NOT NULL,
	description VARCHAR(100) NOT NULL,
	CONSTRAINT genders_pk PRIMARY KEY (id)
);

/* Create genres table */
CREATE TABLE genres (
	id INT NOT NULL,
	description VARCHAR(100) NOT NULL,
	CONSTRAINT genres_pk PRIMARY KEY(id)
);

/* Create occupations table */
CREATE TABLE occupations (
	id INT NOT NULL,
	description VARCHAR(100) NOT NULL,
	CONSTRAINT occupations_pk PRIMARY KEY(id)
);

/* Create movies table */
CREATE TABLE movies (
	id INT NOT NULL,
	title VARCHAR(200) NOT NULL,
	release_date DATE NULL,
	imdb_url VARCHAR(256) NULL,
	CONSTRAINT movies_pk PRIMARY KEY(id)
);

/* Create the users table */
CREATE TABLE users(
	id INT NOT NULL,
	age INT NULL,
	gender_id INT NULL,
	occupation_id INT NULL,
	zipcode VARCHAR(5) NULL,
	CONSTRAINT users_pk PRIMARY KEY(id),
	CONSTRAINT users_genders_fk FOREIGN KEY(gender_id) REFERENCES genders(id),
	CONSTRAINT users_occupations_fk FOREIGN KEY(occupation_id) REFERENCES occupations(id)
);

/* Create the movie genres table */
CREATE TABLE movie_genres(
	movie_id INT NOT NULL,
	genre_id INT NOT NULL,
	CONSTRAINT movie_genres_pk PRIMARY KEY(movie_id, genre_id),
	CONSTRAINT movie_genres_movies_fk FOREIGN KEY(movie_id) REFERENCES movies(id),
	CONSTRAINT movie_genres_genres_fk FOREIGN KEY(genre_id) REFERENCES genres(id)
);

/* Create the ratings table */
CREATE TABLE ratings(
	user_id INT NOT NULL,
	movie_id INT NOT NULL,
	rating INT NOT NULL,
	CONSTRAINT ratings_pk PRIMARY KEY(user_id, movie_id),
	CONSTRAINT ratings_users_fk FOREIGN KEY(user_id) REFERENCES users(id),
	CONSTRAINT ratings_movies_fk FOREIGN KEY(movie_id) REFERENCES movies(id)
);



/**********************/
/* TABLE MODIFICATION */
/**********************/

/* Add a column to the ratings table */
ALTER TABLE ratings ADD rating_date DATE NOT NULL;

/* Allow date and time information in the new column */
ALTER TABLE ratings ALTER COLUMN rating_date DATETIME NOT NULL;

/* Rename the new column to match the contents */
EXEC sp_rename 'ratings.rating_date', 'rating_timestamp', 'COLUMN';

/* Remove the constraints from the ratings table */
ALTER TABLE ratings DROP CONSTRAINT ratings_users_fk;
ALTER TABLE ratings DROP CONSTRAINT ratings_movies_fk;
ALTER TABLE ratings DROP CONSTRAINT ratings_pk;

/* Recreate the primary and foreign keys with the new column */
ALTER TABLE ratings ADD CONSTRAINT ratings_pk PRIMARY KEY(user_id, movie_id, rating_timestamp);
ALTER TABLE ratings ADD CONSTRAINT ratings_users_fk FOREIGN KEY(user_id) REFERENCES users(id);
ALTER TABLE ratings ADD CONSTRAINT ratings_movies_fk FOREIGN KEY(movie_id) REFERENCES movies(id);



/*****************/
/* TABLE REMOVAL */
/*****************/

/* Drop the modified ratings table */
DROP TABLE ratings;

/* Recreate the ratings table without changes */
CREATE TABLE ratings(
	user_id INT NOT NULL,
	movie_id INT NOT NULL,
	rating INT NOT NULL,
	CONSTRAINT ratings_pk PRIMARY KEY(user_id, movie_id),
	CONSTRAINT ratings_users_fk FOREIGN KEY(user_id) REFERENCES users(id),
	CONSTRAINT ratings_movies_fk FOREIGN KEY(movie_id) REFERENCES movies(id)
);




