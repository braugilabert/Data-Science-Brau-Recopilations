/***************************/
/* DATA LOADING FROM FILES */
/**************************/

/* Load the genders table */
BULK INSERT genders
FROM 'C:\\SQL\\db_sql_server\\tables\\genders.tsv'
WITH
(  
    FIELDTERMINATOR ='\t'
    , ROWTERMINATOR ='\n'
);

/* Load the genres table */
BULK INSERT genres
FROM 'C:\\SQL\\db_sql_server\\tables\\genres.tsv'
WITH
(  
    FIELDTERMINATOR ='\t'
    , ROWTERMINATOR ='\n'
);

/* Load the occupations table */
BULK INSERT occupations
FROM 'C:\\SQL\\db_sql_server\\tables\\occupations.tsv'
WITH
(  
    FIELDTERMINATOR ='\t'
    , ROWTERMINATOR ='\n'
);

/* Load the users table */
BULK INSERT users
FROM 'C:\\SQL\\db_sql_server\\tables\\users.tsv'
WITH
(  
    FIELDTERMINATOR ='\t'
    , ROWTERMINATOR ='\n'
);

/* Load the movies table */
BULK INSERT movies
FROM 'C:\\SQL\\db_sql_server\\tables\\movies.tsv'
WITH
(  
    FIELDTERMINATOR ='\t'
    , ROWTERMINATOR ='\n'
);

/* Load the movie genres table */
BULK INSERT movie_genres
FROM 'C:\\SQL\\db_sql_server\\tables\\movie-genres.tsv'
WITH
(  
    FIELDTERMINATOR ='\t'
    , ROWTERMINATOR ='\n'
);

/* Load the ratings table */
BULK INSERT ratings
FROM 'C:\\SQL\\db_sql_server\\tables\\ratings.tsv'
WITH
(  
    FIELDTERMINATOR ='\t'
    , ROWTERMINATOR ='\n'
);
