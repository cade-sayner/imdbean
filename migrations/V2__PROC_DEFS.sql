-- Retrieve and rank the genres a user engages with the most.

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

-- Allow users to search for a specific word or phrase within dialog lines..
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
    (@recency_cutoff INT = 30,    -- No. of days to consider 
    @comment_coeff FLOAT = 2.0,
    @rating_coeff FLOAT = 1.0)
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
GO

-- Find the highest rated series by user and sort
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

CREATE PROCEDURE GetPreferredActorsByUser
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        A.Name AS ActorName,
        A.Bio,
        A.date_of_birth,
        S.title AS SceneTitle,
        AVG(R.Rating) AS AvgRating
    FROM Rating R
    INNER JOIN [Scene] S ON R.scene_id = S.ID
    INNER JOIN Scene_Actor SA ON S.ID = SA.scene_id
    INNER JOIN Actor A ON SA.actor_id = A.ID
	INNER JOIN users U on R.user_id = U.id
    WHERE R.user_id = @UserID
    GROUP BY A.ID, A.Name, A.Bio, A.date_of_birth, S.title
    ORDER BY AvgRating DESC;
END;


CREATE PROCEDURE PopularScenes
	@ageInHours INT
AS
BEGIN
	SELECT 
		c.scene_id,
		AVG(CAST(r.rating as numeric(38,6))) *
		SUM(dbo.DiminishAge(c.[timestamp])) AS popularity 
	FROM [IMDBean].[dbo].comment c
	LEFT JOIN [IMDBean].[dbo].rating r ON c.scene_id = r.scene_id
	
	WHERE 
		-- Ensure both timestamps fall within the last @ageInHours
		c.[timestamp] >= DATEADD(HOUR, -@ageInHours, GETDATE()) AND 
		r.[timestamp] >= DATEADD(HOUR, -@ageInHours, GETDATE())

	GROUP BY c.scene_id
	ORDER BY popularity DESC;
END;

CREATE FUNCTION DiminishAge(@dateVar datetime)
RETURNS numeric(38,6) AS
BEGIN
	RETURN POWER(DATEDIFF_BIG(hour, @dateVar, GETDATE())/168.0,2)
END
-- Get Trending Reels based on some heiristic
CREATE PROCEDURE GetTrendingReels
    (@timeframe INT = 7
    @comment_score_coeff FLOAT = 2.0,
    @rating_score_coeff FLOAT = 1.0)
  AS 
BEGIN
	SET NOCOUNT ON;
	WITH ReelsByRatingScore (reel_id, reel_title, rating_score) AS
	(
		Select R.id, R.title, AVG(Coalesce(rating, 0)) from reel as R 
		left outer join scene as S on S.reel_id = R.id
		left outer join rating as RT on RT.scene_id = S.id
		Where DATEDIFF(DAY, RT.timestamp, CURRENT_TIMESTAMP) < 7
		Group by R.id, R.title
	),

	ReelsByCommentCount (reel_id, reel_title, comment_count) AS 
	(
		Select R.id, R.title, Count(*) from reel as R 
		left outer join scene as S on S.reel_id = R.id
		left outer join comment as C on C.scene_id = S.id
		Where DATEDIFF(DAY, C.timestamp, CURRENT_TIMESTAMP) < 7
		Group by R.id, R.title
	)

	Select RS.reel_id, RS.reel_title, @comment_score_coeff * RS.rating_score + @rating_score_coeff * RC.comment_count as trending_score from ReelsByRatingScore as RS
	inner join ReelsByCommentCount as RC on RC.reel_id = RS.reel_id
	order by trending_score desc
END