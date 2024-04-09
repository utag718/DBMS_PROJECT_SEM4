create database ott;
use ott;
CREATE TABLE Production_House (
    Production_id INT PRIMARY KEY,
    Production_house_name VARCHAR(255),
    Production_house_ratings DECIMAL(3,2)
    );
   
CREATE TABLE admin (
admin_id INT PRIMARY KEY,
    admin_name  VARCHAR(255),
    admin_password varchar(255)
    );
    insert into admin(admin_id,admin_name,admin_password)
    values(1,"utag","utag");
    insert into admin(admin_id,admin_name,admin_password)
    values(2,"abg","abg");

CREATE TABLE Shows (
    show_id INT PRIMARY KEY,
    show_name VARCHAR(255),
    production_house_id INT,
    FOREIGN KEY (production_house_id) REFERENCES Production_House(Production_id)
);
select* from Movies;
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(255),
    production_house_id INT,
    FOREIGN KEY (production_house_id) REFERENCES Production_House(Production_id)
);

CREATE TABLE Show_details (
    s_director VARCHAR(255),
    show_id INT,
    Release_Date DATE,
    s_supporting_cast VARCHAR(255),
    s_lead_cast VARCHAR(255),
    s_genre VARCHAR(255),
    No_of_Seasons INT,
    PRIMARY KEY (show_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
   
);

CREATE TABLE MOVIE_DETAILS (
    movie_id INT PRIMARY KEY,
    m_director VARCHAR(255),
    m_supporting_cast VARCHAR(255),
    m_lead_cast VARCHAR(255),
    m_genre VARCHAR(255),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);


ALTER TABLE MOVIE_DETAILS
ADD CONSTRAINT
FOREIGN KEY (movie_id)
REFERENCES movies(movie_id)
ON DELETE CASCADE;


CREATE TABLE Show_Ratings (
    Show_ID INT PRIMARY KEY,
    sUser_Ratings DECIMAL(3,2), -- Assuming ratings are on a scale of 0 to 10, adjust precision as needed
    sCritic_Ratings DECIMAL(3,2) -- Assuming ratings are on a scale of 0 to 10, adjust precision as needed
);

CREATE TABLE Movie_Ratings (
    Movie_id INT PRIMARY KEY,
    mUser_Ratings DECIMAL(3,2),
    mCritic_Ratings DECIMAL(3,2)
);

CREATE TABLE User (
    User_id INT PRIMARY KEY,
    User_Phone_number VARCHAR(15),
    User_region VARCHAR(255),
    User_name VARCHAR(255),
    User_email VARCHAR(255),
    User_age INT
);


CREATE TABLE Watchlist (
    Movie_ID INT,
    User_ID INT,
    PRIMARY KEY (Movie_ID, User_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movies(movie_id),
    FOREIGN KEY (User_ID) REFERENCES User(User_id)
);

CREATE TABLE Subscription_plan (
    User_ID INT,
    Subscribed_plan VARCHAR(255),
    Date_of_purchase DATE,
    Expiry DATE,
    PRIMARY KEY (User_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_id)
);


CREATE TABLE User_Plan (
    User_ID INT,
    Subscribed_plan VARCHAR(255),
    Date_of_purchase DATE,
    Expiry DATE,
    PRIMARY KEY (User_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_id)
);


CREATE TABLE User_Showlist (
    User_ID INT,
    Show_ID INT,
    PRIMARY KEY (User_ID, Show_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_id),
    FOREIGN KEY (Show_ID) REFERENCES Shows(show_id)
);

CREATE TABLE User_Movielist (
    User_ID INT,
    Movie_ID INT,
    PRIMARY KEY (User_ID, Movie_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_id),
    FOREIGN KEY (Movie_ID) REFERENCES Movies(movie_id)
);

select*from  User_Movielist;
desc table User_Showlist;
desc table Movies;
INSERT INTO Production_House (Production_id, Production_house_name, Production_house_ratings)
VALUES
    (101, 'Netflix', 8.9),
    (102, 'BBC', 8.7),
    (103, 'AMC', 8.8),
    (104, 'Warner Bros.', 9.1),
    (105, 'NBC', 8.5),
    (106, 'HBO', 9.3),
    (107, 'Disney', 8.6),
    (108, 'FX', 8.4),
    (109, 'HBO', 9.3),
    (110, 'HBO', 9.2),
    (111, 'Netflix', 8.8),
    (112, 'Netflix', 8.7),
    (113, 'Fox', 8.6),
    (114, 'Netflix', 8.9),
    (115, 'Amazon Studios', 8.7),
    (116, 'Paramount Pictures', 8.5),
    (117, 'DreamWorks Pictures', 8.8),
    (118, 'Disney', 9.0),
    (119, 'Warner Bros.', 8.9),
    (120, 'Warner Bros.', 8.8),
    (121, 'Paramount Pictures', 8.6),
    (122, 'Universal Pictures', 8.7),
    (123, 'Disney', 8.5),
    (124, 'Warner Bros.', 8.9),
    (125, 'Castle Rock Entertainment', 9.1);



INSERT INTO Shows (show_id, show_name, production_house_id)
VALUES
    (1, 'Stranger Things', 101),
    (2, 'The Crown', 102),
    (3, 'Breaking Bad', 103),
    (4, 'Friends', 104),
    (5, 'The Office', 105),
    (6, 'Game of Thrones', 106),
    (7, 'The Mandalorian', 107),
    (8, 'Sherlock', 108),
    (9, 'Chernobyl', 109),
    (10, 'Westworld', 110),
    (11, 'The Witcher', 111),
    (12, 'Black Mirror', 112),
    (13, 'The Simpsons', 113),
    (14, 'Stranger Things 2', 101),
    (15, 'Breaking Bad 2', 103),
    (16, 'The Crown 2', 102),
    (17, 'Friends 2', 104),
    (18, 'The Office 2', 105),
    (19, 'Sherlock 2', 108),
    (20, 'Chernobyl 2', 109),
    (21, 'Westworld 2', 110),
    (22, 'The Witcher 2', 111),
    (23, 'Black Mirror 2', 112),
    (24, 'The Simpsons 2', 113),
    (25, 'Game of Thrones 2', 106);
   
   

INSERT INTO Production_House (Production_id, Production_house_name, Production_house_ratings)
VALUES
    (201, 'Paramount Pictures', 8.9),
    (202, '20th Century Fox', 8.7),
    (203, 'Warner Bros.', 8.8),
    (204, 'Universal Pictures', 9.1),
    (205, 'Legendary Pictures', 8.5),
    (206, 'Miramax Films', 9.3),
    (207, 'Regency Enterprises', 8.6),
    (208, 'DreamWorks SKG', 8.4),
    (209, 'Columbia Pictures', 9.3),
    (210, 'New Line Cinema', 9.2),
    (211, 'Amblin Entertainment', 8.8),
    (212, 'Orion Pictures', 8.7),
    (213, 'Metro-Goldwyn-Mayer', 8.6),
    (214, 'Warner Bros.', 8.9),
    (215, 'Touchstone Pictures', 8.7),
    (216, 'Paramount Pictures', 8.5),
    (217, 'DreamWorks Pictures', 8.8),
    (218, 'Walt Disney Pictures', 9.0),
    (219, 'Syncopy', 8.9),
    (220, 'Castle Rock Entertainment', 8.8);


INSERT INTO Movies (movie_id, movie_name, production_house_id)
VALUES
    (1, 'The Godfather', 201),
    (2, 'Titanic', 202),
    (3, 'The Shawshank Redemption', 203),
    (4, 'The Dark Knight', 204),
    (5, 'Inception', 205),
    (6, 'Pulp Fiction', 206),
    (7, 'Fight Club', 207),
    (8, 'Forrest Gump', 208),
    (9, 'The Matrix', 209),
    (10, 'The Lord of the Rings: The Return of the King', 210),
    (11, 'The Godfather Part II', 201),
    (12, 'Schindler''s List', 211),
    (13, 'The Lord of the Rings: The Fellowship of the Ring', 210),
    (14, 'The Silence of the Lambs', 212),
    (15, 'Se7en', 213),
    (16, 'The Lord of the Rings: The Two Towers', 210),
    (17, 'Goodfellas', 201),
    (18, 'The Matrix Reloaded', 209),
    (19, 'The Shining', 214),
    (20, 'The Departed', 215),
    (21, 'Braveheart', 216),
    (22, 'Gladiator', 217),
    (23, 'The Lion King', 218),
    (24, 'The Prestige', 219),
    (25, 'The Green Mile', 220);
   
    INSERT INTO Show_Ratings (Show_ID, sUser_Ratings, sCritic_Ratings)
VALUES
    (1, 8.7, 9.1),
    (2, 8.6, 8.8),
    (3, 9.5, 9.7),
    (4, 8.9, 9.4),
    (5, 8.8, 8.5),
    (6, 9.3, 9.2),
    (7, 8.5, 8.7),
    (8, 9.1, 9.0),
    (9, 9.7, 9.5),
    (10, 8.9, 8.6),
    (11, 8.8, 9.0),
    (12, 9.6, 9.2),
    (13, 8.7, 8.9),
    (14, 8.6, 8.8),
    (15, 9.5, 9.7),
    (16, 8.9, 9.4),
    (17, 8.8, 8.5),
    (18, 9.3, 9.2),
    (19, 8.5, 8.7),
    (20, 9.1, 9.0),
    (21, 9.7, 9.5),
    (22, 8.9, 8.6),
    (23, 8.8, 9.0),
    (24, 9.6, 9.2),
    (25, 8.7, 8.9);
   
    INSERT INTO Movie_Ratings (Movie_id, mUser_Ratings, mCritic_Ratings)
VALUES
    (1, 9.2, 9.0),
    (2, 7.8, 7.9),
    (3, 9.3, 9.4),
    (4, 9.0, 9.2),
    (5, 8.8, 8.7),
    (6, 9.4, 9.1),
    (7, 8.9, 9.0),
    (8, 9.2, 9.1),
    (9, 8.7, 8.8),
    (10, 9.5, 9.3),
    (11, 9.2, 9.0),
    (12, 9.6, 9.4),
    (13, 8.9, 9.1),
    (14, 9.1, 9.0),
    (15, 9.3, 9.5),
    (16, 8.8, 8.9),
    (17, 9.5, 9.2),
    (18, 8.7, 8.8),
    (19, 9.0, 9.1),
    (20, 9.4, 9.3),
    (21, 9.2, 9.0),
    (22, 9.7, 9.6),
    (23, 9.3, 9.2),
    (24, 9.0, 9.1),
    (25, 9.6, 9.4);
   
    INSERT INTO MOVIE_DETAILS (movie_id, m_director, m_supporting_cast, m_lead_cast, m_genre)
VALUES
    (1, 'Francis Ford Coppola', 'Al Pacino, James Caan', 'Marlon Brando', 'Crime, Drama'),
    (2, 'James Cameron', 'Kate Winslet, Billy Zane', 'Leonardo DiCaprio', 'Drama, Romance'),
    (3, 'Frank Darabont', 'Morgan Freeman, Tim Robbins', 'Tim Robbins', 'Drama'),
    (4, 'Christopher Nolan', 'Heath Ledger, Aaron Eckhart', 'Christian Bale', 'Action, Crime, Drama'),
    (5, 'Christopher Nolan', 'Joseph Gordon-Levitt, Ellen Page', 'Leonardo DiCaprio', 'Action, Adventure, Sci-Fi'),
    (6, 'Quentin Tarantino', 'John Travolta, Uma Thurman', 'Uma Thurman', 'Crime, Drama'),
    (7, 'David Fincher', 'Brad Pitt, Edward Norton', 'Edward Norton', 'Drama'),
    (8, 'Robert Zemeckis', 'Tom Hanks, Robin Wright', 'Tom Hanks', 'Drama, Romance'),
    (9, 'The Wachowskis', 'Keanu Reeves, Laurence Fishburne', 'Keanu Reeves', 'Action, Sci-Fi'),
    (10, 'Peter Jackson', 'Elijah Wood, Viggo Mortensen', 'Elijah Wood', 'Action, Adventure, Drama'),
    (11, 'Francis Ford Coppola', 'Al Pacino, Robert Duvall', 'Al Pacino', 'Crime, Drama'),
    (12, 'Steven Spielberg', 'Liam Neeson, Ben Kingsley', 'Liam Neeson', 'Biography, Drama, History'),
    (13, 'Peter Jackson', 'Elijah Wood, Ian McKellen', 'Elijah Wood', 'Action, Adventure, Drama'),
    (14, 'Jonathan Demme', 'Jodie Foster, Anthony Hopkins', 'Jodie Foster', 'Crime, Drama, Thriller'),
    (15, 'David Fincher', 'Morgan Freeman, Brad Pitt', 'Brad Pitt', 'Crime, Drama, Mystery'),
    (16, 'Peter Jackson', 'Elijah Wood, Ian McKellen', 'Elijah Wood', 'Action, Adventure, Drama'),
    (17, 'Martin Scorsese', 'Robert De Niro, Ray Liotta', 'Robert De Niro', 'Biography, Crime, Drama'),
    (18, 'The Wachowskis', 'Keanu Reeves, Laurence Fishburne', 'Keanu Reeves', 'Action, Sci-Fi'),
    (19, 'Stanley Kubrick', 'Jack Nicholson, Shelley Duvall', 'Jack Nicholson', 'Drama, Horror'),
    (20, 'Martin Scorsese', 'Leonardo DiCaprio, Matt Damon', 'Leonardo DiCaprio', 'Crime, Drama, Thriller'),
    (21, 'Mel Gibson', 'Mel Gibson, Sophie Marceau', 'Mel Gibson', 'Biography, Drama, History'),
    (22, 'Ridley Scott', 'Russell Crowe, Joaquin Phoenix', 'Russell Crowe', 'Action, Adventure, Drama'),
    (23, 'Roger Allers, Rob Minkoff', 'Matthew Broderick, Jeremy Irons', 'Matthew Broderick', 'Animation, Adventure, Drama'),
    (24, 'Christopher Nolan', 'Christian Bale, Hugh Jackman', 'Christian Bale', 'Drama, Mystery, Sci-Fi'),
    (25, 'Frank Darabont', 'Tom Hanks, Michael Clarke Duncan', 'Tom Hanks', 'Crime, Drama, Fantasy');


INSERT INTO Show_details (s_director, show_id, Release_Date, s_supporting_cast, s_lead_cast, s_genre, No_of_Seasons)
VALUES
    ('Duffer Brothers', 1, '2016-07-15', 'Millie Bobby Brown, David Harbour', 'Winona Ryder', 'Sci-Fi, Horror', 4),
    ('Peter Morgan', 2, '2016-11-04', 'Olivia Colman, Helena Bonham Carter', 'Claire Foy', 'Drama, History', 5),
    ('Vince Gilligan', 3, '2008-01-20', 'Aaron Paul, Anna Gunn', 'Bryan Cranston', 'Crime, Drama', 5),
    ('David Crane, Marta Kauffman', 4, '1994-09-22', 'Lisa Kudrow, Matt LeBlanc', 'Jennifer Aniston', 'Comedy, Romance', 10),
    ('Greg Daniels', 5, '2005-03-24', 'Rainn Wilson, John Krasinski', 'Steve Carell', 'Comedy', 9),
    ('George R. R. Martin', 6, '2011-04-17', 'Emilia Clarke, Kit Harington', 'Peter Dinklage', 'Action, Adventure, Drama', 8),
    ('Jon Favreau', 7, '2019-11-12', 'Pedro Pascal, Gina Carano', 'Pedro Pascal', 'Action, Adventure, Fantasy', 2),
    ('Mark Gatiss, Steven Moffat', 8, '2010-07-25', 'Martin Freeman, Una Stubbs', 'Benedict Cumberbatch', 'Crime, Drama, Mystery', 4),
    ('Craig Mazin', 9, '2019-05-06', 'Jared Harris, Stellan Skarsgård', 'Jessie Buckley', 'Drama, History, Thriller', 1),
    ('Jonathan Nolan, Lisa Joy', 10, '2016-10-02', 'Thandie Newton, Jeffrey Wright', 'Evan Rachel Wood', 'Drama, Mystery, Sci-Fi', 3),
    ('Lauren Schmidt Hissrich', 11, '2019-12-20', 'Henry Cavill, Freya Allan', 'Henry Cavill', 'Action, Adventure, Drama', 2),
    ('Charlie Brooker', 12, '2011-12-04', 'Daniel Lapaine, Hannah John-Kamen', 'Daniel Lapaine', 'Drama, Sci-Fi, Thriller', 5),
    ('Matt Groening', 13, '1989-12-17', 'Nancy Cartwright, Harry Shearer', 'Dan Castellaneta', 'Animation, Comedy', 33),
    ('Duffer Brothers', 14, '2017-10-27', 'Millie Bobby Brown, David Harbour', 'Winona Ryder', 'Sci-Fi, Horror', 4),
    ('Vince Gilligan', 15, '2009-03-08', 'Aaron Paul, Anna Gunn', 'Bryan Cranston', 'Crime, Drama', 5),
    ('Peter Morgan', 16, '2017-12-08', 'Olivia Colman, Helena Bonham Carter', 'Claire Foy', 'Drama, History', 5),
    ('David Crane, Marta Kauffman', 17, '1994-09-22', 'Lisa Kudrow, Matt LeBlanc', 'Jennifer Aniston', 'Comedy, Romance', 10),
    ('Greg Daniels', 18, '2005-03-24', 'Rainn Wilson, John Krasinski', 'Steve Carell', 'Comedy', 9),
    ('George R. R. Martin', 19, '2011-04-17', 'Emilia Clarke, Kit Harington', 'Peter Dinklage', 'Action, Adventure, Drama', 8),
    ('Jon Favreau', 20, '2019-11-12', 'Pedro Pascal, Gina Carano', 'Pedro Pascal', 'Action, Adventure, Fantasy', 2),
    ('Mark Gatiss, Steven Moffat', 21, '2010-07-25', 'Martin Freeman, Una Stubbs', 'Benedict Cumberbatch', 'Crime, Drama, Mystery', 4),
    ('Craig Mazin', 22, '2019-05-06', 'Jared Harris, Stellan Skarsgård', 'Jessie Buckley', 'Drama, History, Thriller', 1),
    ('Jonathan Nolan, Lisa Joy', 23, '2016-10-02', 'Thandie Newton, Jeffrey Wright', 'Evan Rachel Wood', 'Drama, Mystery, Sci-Fi', 3),
    ('Lauren Schmidt Hissrich', 24, '2019-12-20', 'Henry Cavill, Freya Allan', 'Henry Cavill', 'Action, Adventure, Drama', 2),
    ('Charlie Brooker', 25, '2011-12-04', 'Daniel Lapaine, Hannah John-Kamen', 'Daniel Lapaine', 'Drama, Sci-Fi, Thriller', 5);
   
    INSERT INTO User (User_id, User_Phone_number, User_region, User_name, User_email, User_age)
VALUES
    (1, '123-456-7890', 'USA', 'John Doe', 'johndoe@example.com', 30),
    (2, '987-654-3210', 'UK', 'Jane Smith', 'janesmith@example.com', 25),
    (3, '555-123-4567', 'Canada', 'Michael Johnson', 'michael@example.com', 35),
    (4, '111-222-3333', 'Australia', 'Emily Brown', 'emily@example.com', 28),
    (5, '444-555-6666', 'Germany', 'Thomas Müller', 'thomas@example.com', 32),
    (6, '123-456-7890', 'USA', 'John Doe', 'johndoe@example.com', 30),
    (7, '987-654-3210', 'UK', 'Jane Smith', 'janesmith@example.com', 25),
    (8, '555-123-4567', 'Canada', 'Michael Johnson', 'michael@example.com', 35),
    (9, '111-222-3333', 'Australia', 'Emily Brown', 'emily@example.com', 28),
    (10, '444-555-6666', 'Germany', 'Thomas Müller', 'thomas@example.com', 32),
    (11, '123-456-7890', 'USA', 'John Doe', 'johndoe@example.com', 30),
    (12, '987-654-3210', 'UK', 'Jane Smith', 'janesmith@example.com', 25),
    (13, '555-123-4567', 'Canada', 'Michael Johnson', 'michael@example.com', 35),
    (14, '111-222-3333', 'Australia', 'Emily Brown', 'emily@example.com', 28),
    (15, '444-555-6666', 'Germany', 'Thomas Müller', 'thomas@example.com', 32),
    (16, '123-456-7890', 'USA', 'John Doe', 'johndoe@example.com', 30),
    (17, '987-654-3210', 'UK', 'Jane Smith', 'janesmith@example.com', 25),
    (18, '555-123-4567', 'Canada', 'Michael Johnson', 'michael@example.com', 35),
    (19, '111-222-3333', 'Australia', 'Emily Brown', 'emily@example.com', 28),
    (20, '444-555-6666', 'Germany', 'Thomas Müller', 'thomas@example.com', 32),
    (21, '123-456-7890', 'USA', 'John Doe', 'johndoe@example.com', 30),
    (22, '987-654-3210', 'UK', 'Jane Smith', 'janesmith@example.com', 25),
    (23, '555-123-4567', 'Canada', 'Michael Johnson', 'michael@example.com', 35),
    (24, '111-222-3333', 'Australia', 'Emily Brown', 'emily@example.com', 28),
    (25, '444-555-6666', 'Germany', 'Thomas Müller', 'thomas@example.com', 32);



INSERT INTO User_Showlist (User_ID, Show_ID)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (2, 6),
    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10),
    (3, 11),
    (3, 12),
    (3, 13),
    (3, 14),
    (3, 15),
    (4, 16),
    (4, 17),
    (4, 18),
    (4, 19),
    (4, 20),
    (5, 21),
    (5, 22),
    (5, 23),
    (5, 24),
    (5, 25);
   
   
    INSERT INTO User_Movielist (User_ID, Movie_ID)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (2, 6),
    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10),
    (3, 11),
    (3, 12),
    (3, 13),
    (3, 14),
    (3, 15),
    (4, 16),
    (4, 17),
    (4, 18),
    (4, 19),
    (4, 20),
    (5, 21),
    (5, 22),
    (5, 23),
    (5, 24),
    (5, 25);


INSERT INTO Subscription_plan (User_ID, Subscribed_plan, Date_of_purchase, Expiry)
VALUES
    (1, 'Basic', '2023-01-01', '2023-12-31'),
    (2, 'Premium', '2023-02-15', '2024-02-14'),
    (3, 'Standard', '2023-03-20', '2024-03-19'),
    (4, 'Premium', '2023-04-10', '2024-04-09'),
    (5, 'Basic', '2023-05-25', '2024-05-24'),
    (6, 'Standard', '2023-06-12', '2024-06-11'),
    (7, 'Basic', '2023-07-18', '2024-07-17'),
    (8, 'Premium', '2023-08-30', '2024-08-29'),
    (9, 'Standard', '2023-09-05', '2024-09-04'),
    (10, 'Basic', '2023-10-22', '2024-10-21'),
    (11, 'Premium', '2023-11-11', '2024-11-10'),
    (12, 'Basic', '2023-12-04', '2024-12-03'),
    (13, 'Standard', '2024-01-20', '2025-01-19'),
    (14, 'Basic', '2024-02-28', '2025-02-27'),
    (15, 'Premium', '2024-03-15', '2025-03-14'),
    (16, 'Standard', '2024-04-06', '2025-04-05'),
    (17, 'Basic', '2024-05-10', '2025-05-09'),
    (18, 'Premium', '2024-06-25', '2025-06-24'),
    (19, 'Basic', '2024-07-17', '2025-07-16'),
    (20, 'Standard', '2024-08-20', '2025-08-19'),
    (21, 'Premium', '2024-09-09', '2025-09-08'),
    (22, 'Basic', '2024-10-30', '2025-10-29'),
    (23, 'Standard', '2024-11-12', '2025-11-11'),
    (24, 'Premium', '2024-12-03', '2025-12-02'),
    (25, 'Basic', '2025-01-25', '2026-01-24');






SELECT m.movie_id, m.movie_name, md.m_director, ph.production_house_name
FROM Movies m
JOIN Movie_Details md ON m.movie_id = md.movie_id
JOIN Production_House ph ON m.production_house_id = ph.production_id;


SELECT u.*, sp.Subscribed_plan, sp.Date_of_purchase, sp.Expiry
FROM User u
JOIN Subscription_Plan sp ON u.user_id = sp.user_id
WHERE sp.Subscribed_plan = 'desired_plan_name';


SELECT sr.Show_ID, sr.sUser_Ratings, sr.sCritic_Ratings
FROM Show_Ratings sr
WHERE sr.Show_ID = desired_show_id;


SELECT mr.Movie_ID, mr.mUser_Ratings, mr.mCritic_Ratings
FROM Movie_Ratings mr
WHERE mr.Movie_ID = desired_movie_id;

SELECT User_region, User_name, User_email
FROM User
WHERE User_age > 30;

SELECT u.User_name, sp.Subscribed_plan, sp.Expiry
FROM User u
JOIN Subscription_plan sp ON u.User_id = sp.User_id;


SELECT Production_House.Production_id, Production_House.Production_house_name, Production_House.Production_house_ratings
FROM Production_House;

SELECT User.*
FROM User
WHERE User.User_id NOT IN (SELECT User_ID FROM Show_Ratings UNION SELECT User_ID FROM Movie_Ratings);


SELECT Production_House.production_house_name, AVG(Production_House.Production_house_ratings) AS Avg_Rating
FROM Production_House
GROUP BY Production_House.production_house_name
ORDER BY Avg_Rating DESC
LIMIT 1;


SELECT User.User_id, User.User_name, AVG((Show_Ratings.sUser_Ratings + Movie_Ratings.mUser_Ratings) / 2) AS Avg_Rating
FROM User
LEFT JOIN User_Showlist ON User.User_id = User_Showlist.User_ID
LEFT JOIN Show_Ratings ON User_Showlist.Show_ID = Show_Ratings.Show_ID
LEFT JOIN User_Movielist ON User.User_id = User_Movielist.User_ID
LEFT JOIN Movie_Ratings ON User_Movielist.Movie_ID = Movie_Ratings.Movie_ID
GROUP BY User.User_id, User.User_name
ORDER BY Avg_Rating DESC
LIMIT 5;


SELECT Production_House.production_house_name, SUM(Show_Details.No_of_Seasons) AS Total_Seasons
FROM Shows
JOIN Show_Details ON Shows.show_id = Show_Details.show_id
JOIN Production_House ON Shows.production_house_id = Production_House.production_id
GROUP BY Production_House.production_house_name
ORDER BY Total_Seasons DESC;


SELECT Movie_Details.m_genre, AVG(Movie_Ratings.mCritic_Ratings) AS Avg_Critic_Rating
FROM Movie_Details
JOIN Movie_Ratings ON Movie_Details.movie_id = Movie_Ratings.Movie_ID
GROUP BY Movie_Details.m_genre;


SELECT Shows.show_id, Shows.show_name, COUNT(User_Showlist.User_ID) AS Watch_Count
FROM Shows
JOIN User_Showlist ON Shows.show_id = User_Showlist.Show_ID
JOIN User ON User_Showlist.User_ID = User.User_id
WHERE User.User_region = 'desired_region'
GROUP BY Shows.show_id, Shows.show_name
ORDER BY Watch_Count DESC
LIMIT 3;


SELECT User.User_id, User.User_name
FROM User
JOIN User_Showlist ON User.User_id = User_Showlist.User_ID
JOIN Shows ON User_Showlist.Show_ID = Shows.show_id
GROUP BY User.User_id, User.User_name
HAVING COUNT(DISTINCT CASE WHEN Shows.s_genre = 'genre1' THEN Shows.show_id END) > 0
AND COUNT(DISTINCT CASE WHEN Shows.s_genre = 'genre2' THEN Shows.show_id END) > 0
AND COUNT(DISTINCT CASE WHEN Shows.s_genre = 'genre3' THEN Shows.show_id END) > 0;
