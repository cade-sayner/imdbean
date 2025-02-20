-- Retrieve and rank the genres a user engages with the most.
-- It takes a username as input and calculates a "genre score" for each genre the user has interacted with.
-- The genre score is computed as: 
--    70% weight from the user's average rating for scenes in that genre 
--    30% weight from the number of scenes the user has rated in that genre.
-- The procedure joins multiple tables: users, ratings, scenes, reels, reel-genre mappings, and genres.
-- Results are grouped by user ID, username, and genre name, then sorted in descending order of genre score.
-- This can be useful for features like personalized recommendations or "Your Favorite Genres" on a user profile.

CREATE PROCEDURE GetOrderedUserGenres
    @Username NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        U.id, 
        U.username, 
        AVG(R.rating) * 0.70 + COUNT(G.name) * 0.30 AS genre_score, 
        G.name 
    FROM users AS U
    INNER JOIN rating AS R ON U.id = R.user_id 
    INNER JOIN scene AS S ON R.scene_id = S.id
    INNER JOIN reel AS RL ON R.scene_id = S.id
    INNER JOIN reel_genre AS RG ON RG.reel_id = RL.id
	INNER JOIN genre AS G ON G.id = RG.genre_id
    WHERE U.username = @Username
    GROUP BY U.id, U.username, G.name
    ORDER BY genre_score DESC;
END;
GO

-- Allow users to search for a specific word or phrase within dialog lines.
-- It takes a search term as input and retrieves matching dialog entries along with contextual information.
-- The result includes:
--   - The dialog ID, text, and its order in the scene.
--   - The actor who delivered the line.
--   - The scene ID and title where the dialog appears.
--   - The reel ID and title (episode or movie) the scene belongs to.
-- The procedure uses a JOIN across dialog, scene, reel, and actor tables to provide detailed results.
-- The WHERE clause employs a wildcard search (LIKE '%@searchTerm%') to find partial matches within dialog lines.
-- This can be useful for searching quotes, generating transcripts, or building a "famous lines" feature.
CREATE PROCEDURE FindDialog
    @searchTerm NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        d.id AS dialog_id,
        d.line_text,
        d.line_order,
        a.name AS actor_name,
        s.id AS scene_id,
        s.title AS scene_title,
        r.id AS reel_id,
        r.title AS reel_title
    FROM [dialog] d
    JOIN [scene] s ON d.scene_id = s.id
    JOIN [reel] r ON s.reel_id = r.id
    JOIN [actor] a ON d.actor_id = a.id
    WHERE d.line_text LIKE '%' + @searchTerm + '%'
END;
GO


-- Create leaderboard of most active users
CREATE PROCEDURE GetLeaderboard
    @recency_cutoff INT = 30,    -- No. of days to consider 
    @comment_coeff FLOAT = 2.0,
    @rating_coeff FLOAT = 1.0
AS BEGIN
    SET NOCOUNT ON;
    SELECT
        u.id AS user_id,
        u.username,
        COALESCE(comment_count, 0) AS total_comments,
        COALESCE(rating_count, 0) AS total_ratings,
        (@comment_coeff * COALESCE(comment_count, 0) + @rating_coeff * COALESCE(rating_count, 0)) AS activity_score
    FROM users u
    LEFT JOIN (
        -- Get no. of comments per user in the last p_days
        SELECT user_id, COUNT(*) AS comment_count
        FROM comment
        WHERE DATEDIFF(day, timestamp, CURRENT_TIMESTAMP) <= @recency_cutoff
        GROUP BY user_id
    ) c ON u.id = c.user_id
    LEFT JOIN (
        -- Get no. of ratings per user in the last p_days
        SELECT user_id, COUNT(*) AS rating_count
        FROM rating
        WHERE DATEDIFF(day, timestamp, CURRENT_TIMESTAMP) <= @recency_cutoff
        GROUP BY user_id
    ) r ON u.id = r.user_id
    ORDER BY activity_score DESC, u.username;
END;


CREATE PROCEDURE FindHighestRatedSeriesByUser
    @username NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        s.id AS series_id,
        s.title AS series_title,
        AVG(rt.rating) AS average_rating
    FROM [users] u
    JOIN rating rt ON u.id = rt.user_id
    JOIN scene sc ON rt.scene_id = sc.id
    JOIN reel r ON sc.reel_id = r.id
    JOIN series s ON r.series_id = s.id
    WHERE u.username = @username
    GROUP BY s.id, s.title
    ORDER BY average_rating DESC
END;
GO
