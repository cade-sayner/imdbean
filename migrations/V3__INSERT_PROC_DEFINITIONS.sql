-- Insert into [scene]
CREATE PROCEDURE InsertScene
  @reel_id INT,
  @timestamp INT,
  @title NVARCHAR(255),
  @plot_description TEXT,
  @filming_date DATE,
  @location_id INT
AS
BEGIN
  INSERT INTO [scene] (reel_id, timestamp, title, plot_description, filming_date, location_id)
  VALUES (@reel_id, @timestamp, @title, @plot_description, @filming_date, @location_id);
END;
GO

-- Insert into [reel_type]
CREATE PROCEDURE InsertReelType
  @type_name NVARCHAR(20)
AS
BEGIN
  INSERT INTO [reel_type] (type_name) VALUES (@type_name);
END;
GO

-- Insert into [reel]
CREATE PROCEDURE InsertReel
  @reel_type_id INT,
  @series_id INT,
  @title NVARCHAR(255),
  @description TEXT,
  @release_date DATE
AS
BEGIN
  INSERT INTO [reel] (reel_type_id, series_id, title, description, release_date)
  VALUES (@reel_type_id, @series_id, @title, @description, @release_date);
END;
GO

-- Insert into [series]
CREATE PROCEDURE InsertSeries
  @title NVARCHAR(255),
  @description TEXT,
  @start_date DATE,
  @end_date DATE
AS
BEGIN
  INSERT INTO [series] (title, description, start_date, end_date)
  VALUES (@title, @description, @start_date, @end_date);
END;
GO

-- Insert into [location]
CREATE PROCEDURE InsertLocation
  @name NVARCHAR(255),
  @address TEXT,
  @country NVARCHAR(100)
AS
BEGIN
  INSERT INTO [location] (name, address, country) VALUES (@name, @address, @country);
END;
GO

-- Insert into [actor]
CREATE PROCEDURE InsertActor
  @name NVARCHAR(255),
  @bio TEXT,
  @date_of_birth DATE
AS
BEGIN
  INSERT INTO [actor] (name, bio, date_of_birth) VALUES (@name, @bio, @date_of_birth);
END;
GO

-- Insert into [scene_actor]
CREATE PROCEDURE InsertSceneActor
  @scene_id INT,
  @actor_id INT
AS
BEGIN
  INSERT INTO [scene_actor] (scene_id, actor_id) VALUES (@scene_id, @actor_id);
END;
GO

-- Insert into [dialog]
CREATE PROCEDURE InsertDialog
  @scene_id INT,
  @actor_id INT,
  @line_text TEXT,
  @line_order INT
AS
BEGIN
  INSERT INTO [dialog] (scene_id, actor_id, line_text, line_order)
  VALUES (@scene_id, @actor_id, @line_text, @line_order);
END;
GO

-- Insert into [users]
CREATE PROCEDURE InsertUser
  @username NVARCHAR(50),
  @email NVARCHAR(255),
  @password_hash NVARCHAR(255),
  @join_date DATETIME
AS
BEGIN
  INSERT INTO [users] (username, email, password_hash, join_date)
  VALUES (@username, @email, @password_hash, @join_date);
END;
GO

-- Insert into [rating]
CREATE PROCEDURE InsertRating
  @user_id INT,
  @scene_id INT,
  @rating INT,
  @timestamp DATETIME
AS
BEGIN
  INSERT INTO [rating] (user_id, scene_id, rating, timestamp)
  VALUES (@user_id, @scene_id, @rating, @timestamp);
END;
GO

-- Insert into [comment]
CREATE PROCEDURE InsertComment
  @user_id INT,
  @scene_id INT,
  @comment_text TEXT,
  @timestamp DATETIME
AS
BEGIN
  INSERT INTO [comment] (user_id, scene_id, comment_text, timestamp)
  VALUES (@user_id, @scene_id, @comment_text, @timestamp);
END;
GO

-- Insert into [thumbnail]
CREATE PROCEDURE InsertThumbnail
  @scene_id INT,
  @thumbnail_url NVARCHAR(512)
AS
BEGIN
  INSERT INTO [thumbnail] (scene_id, thumbnail_url) VALUES (@scene_id, @thumbnail_url);
END;
GO

-- Insert into [genre]
CREATE PROCEDURE InsertGenre
  @name NVARCHAR(80)
AS
BEGIN
  INSERT INTO [genre] (name) VALUES (@name);
END;
GO

-- Insert into [reel_genre]
CREATE PROCEDURE InsertReelGenre
  @reel_id INT,
  @genre_id INT
AS
BEGIN
  INSERT INTO [reel_genre] (reel_id, genre_id) VALUES (@reel_id, @genre_id);
END;
GO

-- Insert into [roles]
CREATE PROCEDURE InsertRole
  @name NVARCHAR(50)
AS
BEGIN
  INSERT INTO [roles] (name) VALUES (@name);
END;
GO

-- Insert into [user_roles]
CREATE PROCEDURE InsertUserRole
  @user_id INT,
  @role_id INT
AS
BEGIN
  INSERT INTO [user_roles] (user_id, role_id) VALUES (@user_id, @role_id);
END;
GO

-- Insert into [permissions]
CREATE PROCEDURE InsertPermission
  @name NVARCHAR(100),
  @description TEXT
AS
BEGIN
  INSERT INTO [permissions] (name, description) VALUES (@name, @description);
END;
GO

-- Insert into [role_permissions]
CREATE PROCEDURE InsertRolePermission
  @role_id INT,
  @permission_id INT
AS
BEGIN
  INSERT INTO [role_permissions] (role_id, permission_id) VALUES (@role_id, @permission_id);
END;
GO


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
       OR SOUNDEX(d.line_text) = SOUNDEX(@searchTerm);
END;
GO