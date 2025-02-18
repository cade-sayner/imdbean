CREATE PROCEDURE GetAverageRating
    @scene_id INT
AS
BEGIN
    SELECT AVG(rating) AS AverageRating
    FROM rating
    WHERE scene_id = @scene_id;
END
GO

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