CREATE TABLE [scene] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [reel_id] int NOT NULL,
  [timestamp] int NOT NULL,
  [duration] int NOT NULL,
  [title] nvarchar(255),
  [plot_description] varchar(200) NOT NULL,
  [filming_date] date NOT NULL,
  [location_id] int NOT NULL
)
GO

CREATE TABLE [reel_type] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [type_name] nvarchar(20) NOT NULL
)
GO

CREATE TABLE [reel] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [reel_type_id] int,
  [series_id] int,
  [title] nvarchar(255) NOT NULL,
  [description] nvarchar(255),
  [release_date] date NOT NULL
)
GO

CREATE TABLE [series] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [title] nvarchar(255) NOT NULL,
  [description] nvarchar(255),
  [start_date] date,
  [end_date] date
)
GO

CREATE TABLE [location] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) NOT NULL,
  [address] nvarchar(255),
  [country] nvarchar(100) NOT NULL
)
GO

CREATE TABLE [actor] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) NOT NULL,
  [bio] varchar(255),
  [date_of_birth] date
)
GO

CREATE TABLE [scene_actor] (
  [scene_id] int NOT NULL,
  [actor_id] int NOT NULL,
  PRIMARY KEY ([scene_id], [actor_id])
)
GO

CREATE TABLE [dialog] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [scene_id] int NOT NULL,
  [actor_id] int NOT NULL,
  [line_text] varchar(255) NOT NULL,
  [line_order] int NOT NULL
)
GO

CREATE TABLE [users] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [username] nvarchar(50) UNIQUE NOT NULL,
  [email] nvarchar(255) UNIQUE NOT NULL,
  [password_hash] nvarchar(255) NOT NULL,
  [join_date] datetime NOT NULL
)
GO

CREATE TABLE [rating] (
  [user_id] int NOT NULL,
  [scene_id] int NOT NULL,
  [rating] int NOT NULL,
  [timestamp] datetime NOT NULL
)
GO

CREATE TABLE [comment] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [user_id] int NOT NULL,
  [scene_id] int NOT NULL,
  [comment_text] varchar(255) NOT NULL,
  [timestamp] datetime NOT NULL
)
GO

CREATE TABLE [thumbnail] (
  [scene_id] int NOT NULL,
  [thumbnail_url] nvarchar(512) NOT NULL
)
GO

CREATE TABLE [genre] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(80) UNIQUE NOT NULL
)
GO

CREATE TABLE [reel_genre] (
  [reel_id] int NOT NULL,
  [genre_id] int NOT NULL
)
GO

CREATE TABLE [roles] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(50) UNIQUE NOT NULL
)
GO

CREATE TABLE [user_roles] (
  [user_id] int NOT NULL,
  [role_id] int NOT NULL,
  PRIMARY KEY ([user_id], [role_id])
)
GO

CREATE TABLE [permissions] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(100) UNIQUE NOT NULL,
  [description] varchar(255)
)
GO

CREATE TABLE [role_permissions] (
  [role_id] int NOT NULL,
  [permission_id] int NOT NULL,
  PRIMARY KEY ([role_id], [permission_id])
)
GO

ALTER TABLE [scene] ADD FOREIGN KEY ([reel_id]) REFERENCES [reel] ([id]) ON DELETE CASCADE
GO

ALTER TABLE [scene] ADD FOREIGN KEY ([location_id]) REFERENCES [location] ([id])
GO

ALTER TABLE [reel] ADD FOREIGN KEY ([reel_type_id]) REFERENCES [reel_type] ([id])
GO

ALTER TABLE [reel] ADD FOREIGN KEY ([series_id]) REFERENCES [series] ([id])
GO

ALTER TABLE [scene_actor] ADD FOREIGN KEY ([scene_id]) REFERENCES [scene] ([id]) ON DELETE CASCADE
GO

ALTER TABLE [scene_actor] ADD FOREIGN KEY ([actor_id]) REFERENCES [actor] ([id])
GO

ALTER TABLE [dialog] ADD FOREIGN KEY ([scene_id]) REFERENCES [scene] ([id]) ON DELETE CASCADE
GO

ALTER TABLE [dialog] ADD FOREIGN KEY ([actor_id]) REFERENCES [actor] ([id])
GO

ALTER TABLE [rating] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [rating] ADD FOREIGN KEY ([scene_id]) REFERENCES [scene] ([id]) ON DELETE CASCADE
GO

ALTER TABLE [comment] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [comment] ADD FOREIGN KEY ([scene_id]) REFERENCES [scene] ([id]) ON DELETE CASCADE
GO

ALTER TABLE [thumbnail] ADD FOREIGN KEY ([scene_id]) REFERENCES [scene] ([id]) ON DELETE CASCADE
GO

ALTER TABLE [thumbnail] ADD FOREIGN KEY ([scene_id]) REFERENCES [reel] ([id])
GO

ALTER TABLE [reel_genre] ADD FOREIGN KEY ([reel_id]) REFERENCES [reel] ([id])
GO

ALTER TABLE [reel_genre] ADD FOREIGN KEY ([genre_id]) REFERENCES [genre] ([id])
GO

ALTER TABLE [user_roles] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [user_roles] ADD FOREIGN KEY ([role_id]) REFERENCES [roles] ([id])
GO

ALTER TABLE [role_permissions] ADD FOREIGN KEY ([role_id]) REFERENCES [roles] ([id])
GO

ALTER TABLE [role_permissions] ADD FOREIGN KEY ([permission_id]) REFERENCES [permissions] ([id])
GO


-- Constraints for data integrity

-- Ensure Ratings Are Between 1 and 10
ALTER TABLE rating ADD CONSTRAINT CHK_Rating_Value CHECK (rating BETWEEN 1 AND 5);

-- Ensure Comments Are Not Empty
ALTER TABLE comment ADD CONSTRAINT CHK_Comment_Text CHECK (LEN(comment_text) > 0);

-- Ensure Release Date Is Not in the Future
ALTER TABLE reel ADD CONSTRAINT CHK_Release_Date CHECK (release_date <= GETDATE());

-- Ensure Scene Timestamps Are Non-Negative
ALTER TABLE scene ADD CONSTRAINT CHK_Scene_Timestamp CHECK (timestamp >= 0);

-- Ensure Unique Role Names
ALTER TABLE roles ADD CONSTRAINT UQ_Role_Name UNIQUE (name);

-- Triggers for Enforcing Business Rules


-- Automatically Assign Default Role to New Users
-- Whenever a new user is added, they are automatically assigned the "Viewer" role.
GO
CREATE TRIGGER trg_AssignDefaultRole
ON users
AFTER INSERT
AS
BEGIN
    DECLARE @DefaultRoleID INT;
    SELECT @DefaultRoleID = id FROM roles WHERE name = 'Viewer';

    IF @DefaultRoleID IS NOT NULL
    BEGIN
        INSERT INTO user_roles (user_id, role_id)
        SELECT id, @DefaultRoleID FROM inserted;
    END
END;
GO

-- Prevent Deleting a Series If It Has Associated Reels
CREATE TRIGGER trg_PreventSeriesDelete
ON series
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM reel WHERE series_id IN (SELECT id FROM deleted))
    BEGIN
        RAISERROR ('Cannot delete a series that has associated reels.', 16, 1);
        RETURN;
    END
    DELETE FROM series WHERE id IN (SELECT id FROM deleted);
END;
GO
-- Prevent Rating a Scene More Than Once Per User
CREATE TRIGGER trg_PreventDuplicateRating
ON rating
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM rating r
        INNER JOIN inserted i ON r.user_id = i.user_id AND r.scene_id = i.scene_id
    )
    BEGIN
        RAISERROR ('User has already rated this scene.', 16, 1);
        RETURN;
    END
    INSERT INTO rating (user_id, scene_id, rating, timestamp)
    SELECT user_id, scene_id, rating, timestamp FROM inserted;
END;
GO

-- Trigger: Prevent Overlapping Scenes in the Same Reel on INSERT
CREATE TRIGGER trg_PreventOverlappingScenes
ON scene
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN scene s ON i.reel_id = s.reel_id 
        AND i.id <> s.id  
        AND ABS((i.timestamp + i.duration/2) - (s.timestamp + s.duration/2)) < i.duration/2 + s.duration/2
    )
    BEGIN
        RAISERROR ('Scene timestamps cannot overlap within the same reel.', 16, 1);
        RETURN;
    END
    -- If no conflicts, proceed with insert/update
    INSERT INTO scene (reel_id, timestamp, duration, title, plot_description, filming_date, location_id)
    SELECT reel_id, timestamp, duration, title, plot_description, filming_date, location_id FROM inserted;
END;
GO

-- Trigger: Prevent Overlapping Scenes in the Same Reel on UPDATE
CREATE TRIGGER trg_PreventOverlappingScenes_Update
ON scene
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN scene s ON i.reel_id = s.reel_id 
        AND i.id <> s.id  
        AND ABS((i.timestamp + i.duration/2) - (s.timestamp + s.duration/2)) < i.duration/2 + s.duration/2
    )
    BEGIN
        RAISERROR ('Scene timestamps cannot overlap within the same reel.', 16, 1);
        RETURN;
    END

    -- If no conflicts, proceed with update
    UPDATE scene
    SET 
        reel_id = i.reel_id,
        timestamp = i.timestamp,
        duration = i.duration,
        title = i.title,
        plot_description = i.plot_description,
        filming_date = i.filming_date,
        location_id = i.location_id
    FROM inserted i
    WHERE scene.id = i.id;
END;
GO

-- Create the SceneRatings View that aggregates the Provides a summary of the average rating for each scene.
-- This is supposed to make it easy to fetch scene details along with their average rating.
CREATE VIEW SceneRatings AS
SELECT 
    s.id AS scene_id,
    s.title,
    s.plot_description,
    s.filming_date,
    s.location_id,
    COUNT(r.user_id) AS total_ratings,
    AVG(r.rating) AS avg_rating
FROM scene s
LEFT JOIN rating r ON s.id = r.scene_id
GROUP BY s.id, s.title, s.plot_description, s.filming_date, s.location_id;

GO
CREATE VIEW MyUsers AS 
SELECT * FROM Users WHERE username = 'beanfan99'
GO

CREATE VIEW MyComment AS
SELECT * FROM comment WHERE user_id = 1
GO

CREATE VIEW MyRatings AS
SELECT * FROM rating WHERE user_id = 1
GO









