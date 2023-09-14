/************/
/* QUERYING */
/************/

/* Retrieve all the movies information */
SELECT * 
FROM movies;

/* Retrieve only title and release date for all the movies */
SELECT title, release_date 
FROM movies;

/* Retrieve only title and URL for all the movies, but rename the URL field to "movie_summary" */
SELECT title, imdb_url AS movie_summary 
FROM movies;



/*************/
/* FILTERING */
/*************/

/* Find title and release date for all the movies released during H1 of 1997 */
SELECT title, release_date 
FROM movies 
WHERE release_date >= '1997-01-01' AND release_date <= '1997-06-30';

/* Find the id for female */
SELECT * 
FROM genders;

/* Find the ids for technician, programmer and engineer occupations */
SELECT *
FROM occupations
WHERE description in ('technician', 'programmer', 'engineer');

/* Find all the users being female and having a technical occupation */
SELECT *
FROM users
WHERE gender_id = 1
  AND (occupation_id = 1 OR occupation_id = 11 OR occupation_id = 15);
  
/* More concise */
SELECT *
FROM users
WHERE gender_id = 1
  AND occupation_id IN (1, 11, 15);
  
/* Find all the movies having "story" in their titles */
SELECT * 
FROM movies
WHERE title LIKE '%story%';



/***********/
/* SORTING */
/***********/

/* Find the youngest users */
SELECT *
FROM users
ORDER BY age;

/* Find the most recent movies released */
SELECT * 
FROM movies
ORDER BY release_date DESC;




/***********************/
/* REMOVING DUPLICATES */
/***********************/

/* Find the list of unique ages for the users */
SELECT DISTINCT age
FROM users;

/* Find the list of unique ages and zipcodes for male users */
SELECT DISTINCT age, zipcode
FROM users
WHERE gender_id = 2;



/****************************/
/* GROUPING AND AGGREGATING */
/****************************/

/* Find the number of users in the users table */
SELECT COUNT(*)
FROM users;

/* Find the maximum release date during 1995 */
SELECT MAX(release_date)
FROM movies
WHERE release_date >= '1995-01-01' 
  AND release_date <= '1995-12-31';

/* Find the movie ids having the most number of genres assigned */
SELECT movie_id, COUNT(*) AS num_genres
FROM movie_genres
GROUP BY movie_id
ORDER BY num_genres DESC; 

/* Find the users given (at average) the lowest ratings to movies */
SELECT user_id, AVG(rating) AS avg_rating
FROM ratings 
GROUP BY user_id
ORDER BY avg_rating;

/* Find the genre ids having more than 100 movies assigned */
SELECT genre_id, COUNT(*) num_movies
FROM movie_genres
GROUP BY genre_id
HAVING COUNT(*) > 100;

/* Find the id of Toy Story movie */
SELECT *
FROM movies
WHERE title LIKE '%toy story%';

/* Count the number of genres of Toy Story */
SELECT COUNT(*) AS num_genres
FROM movie_genres
WHERE movie_id = 1;

/* Calculate the average rating of Toy Story */
SELECT AVG(rating)
FROM ratings
WHERE movie_id = 1;

/* In a single query (using subqueries) */
SELECT AVG(rating)
FROM ratings
WHERE movie_id = (SELECT id 
				  FROM movies 
				  WHERE title LIKE '%toy story%');
				  

  
/***********/
/* JOINING */
/***********/

/* Retrieve all users but display descriptions instead of ids for both gender and occupation */
SELECT u.id, u.age, g.description AS gender, o.description AS occupation, zipcode
FROM users AS u, genders AS g, occupations AS o
WHERE u.gender_id = g.id
  AND u.occupation_id = o.id;
  
SELECT u.id, u.age, g.description AS gender, o.description AS occupation, zipcode
FROM users AS u INNER JOIN genders AS g ON u.gender_id = g.id
				INNER JOIN occupations AS o ON u.occupation_id = o.id;
				
/* Calculate the average rating for each user in the users table */
SELECT u.id AS user_id, mg.genre_id AS genre_id, AVG(rating) AS avg_rating
FROM users AS u, ratings AS r, movie_genres AS mg
WHERE u.id = r.user_id
  AND r.movie_id = mg.movie_id
GROUP BY u.id, mg.genre_id;

/* Find the total number of users x genres we can have */
SELECT COUNT(*)
FROM users;

SELECT COUNT(*)
FROM genres;

/* Find the whole set of possible combinations between users and genres  */
SELECT u.id AS user_id, g.id AS gender_id
FROM users u, genres g;

/* Convert the rating table to a user, genre, rating table */
SELECT r.user_id AS user_id, mg.genre_id AS genre_id, rating
FROM ratings AS r, movie_genres AS mg
WHERE r.movie_id = mg.movie_id;

/* Calculate again the average rating for EVERY single combination (using previous queries) */
SELECT ug.user_id, ug.genre_id, AVG(ugr.rating)
FROM 
	(SELECT u.id AS user_id, g.id AS genre_id FROM users u, genres g) AS ug
	LEFT JOIN 
	(SELECT r.user_id AS user_id, mg.genre_id AS genre_id, rating
	 FROM ratings AS r, movie_genres AS mg
	 WHERE r.movie_id = mg.movie_id) AS ugr
	ON ug.user_id = ugr.user_id AND ug.genre_id = ugr.genre_id
GROUP BY ug.user_id, ug.genre_id;


/**************/
/* PAGINATION */
/**************/

/* Find ONLY the youngest user */
SELECT TOP 1 * 
FROM users 
ORDER BY age;

/* Find the top rated movies having at least 20 ratings */
SELECT TOP 10 m.title, AVG(rating) AS avg_rating
FROM ratings AS r, movies AS m
WHERE r.movie_id = m.id
GROUP BY m.title
HAVING COUNT(*) >= 20
ORDER BY avg_rating DESC;

