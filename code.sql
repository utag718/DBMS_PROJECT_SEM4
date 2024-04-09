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