/*************/
/* INSERTING */
/*************/

/* Insert a new user in the users table */
INSERT INTO users (id, age, gender_id, occupation_id, zipcode) 
VALUES (1, 25, 1, 8, 28029);

/* Find the maximum id in the users table */
SELECT MAX(id) FROM users;

/* Insert a new user in the users table (with a correct id) */
INSERT INTO users (id, age, gender_id, occupation_id, zipcode) 
VALUES (944, 25, 1, 8, 28029);

/* Check that the user is successfully added */
SELECT * 
FROM users
WHERE id = 944;

/* Find the ids of Return of the Jedi and Star Wars movies */
SELECT * 
FROM movies 
WHERE title LIKE '%return of the jedi%'
  OR title LIKE '%star wars%';

/* Insert the rating of new user for both movies */
INSERT INTO ratings (user_id, movie_id, rating) 
VALUES (944, 181, 3);

INSERT INTO ratings (user_id, movie_id, rating)
VALUES (944, 50, 3);

/* Check that the ratings of the new user have been successfully added */
SELECT * 
FROM ratings
WHERE user_id = 944;



/************/
/* UPDATING */
/************/

/* Correct the age and occupation of the new user */
UPDATE users SET 
	age = 35, 
	occupation_id = 32 
WHERE id = 944;

/* Correct the age and occupation of the new user (with a correct occupation now) */
UPDATE users SET 
	age = 35, 
	occupation_id = 15 
WHERE id = 944;

/* Check that now the infomation is correct */
SELECT *
FROM users
WHERE id = 944;

/* Correct the (obviously) incorrect ratings given to "Return of the Jedi" and "Star Wars" movies */
UPDATE ratings SET 
	rating = 5 
WHERE user_id = 944
  AND movie_id IN (50, 181);
  
/* Check that the ratings are now the correct ones */
SELECT *
FROM ratings
WHERE user_id = 944;
  
  

/************/
/* DELETING */
/************/

/* Delete the new user */
DELETE FROM users
WHERE id = 944;

/* Delete the ratings associated to new user */
DELETE FROM ratings
WHERE user_id = 944;

/* Retry the delete of the new user */
DELETE FROM users
WHERE id = 944;



