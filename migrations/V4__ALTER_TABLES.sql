USE IMDBean
GO


ALTER TABLE Actor
ALTER COLUMN bio VARCHAR(MAX)
GO

ALTER TABLE Actor
ADD CONSTRAINT CHK_date_of_birth CHECK (date_of_birth <= DATEADD(YEAR, -18, GETDATE()))
GO

ALTER TABLE Dialog
ALTER COLUMN line_text VARCHAR(MAX) NOT NULL

--ALTER TABLE Genre
--ALTER COLUMN [name] VARCHAR(80) NOT NULL

ALTER TABLE Permissions
ALTER COLUMN description VARCHAR(MAX) NOT NULL

ALTER TABLE Rating
ADD CONSTRAINT DF_rating_timestamp DEFAULT CURRENT_TIMESTAMP FOR timestamp

ALTER TABLE Reel
ALTER COLUMN description VARCHAR(MAX) NULL

--ALTER TABLE Roles
--ALTER COLUMN [name] VARCHAR(50) NOT NULL

ALTER TABLE Scene
ALTER COLUMN plot_description VARCHAR(MAX) NOT NULL

ALTER TABLE Series
ALTER COLUMN title VARCHAR(255) NOT NULL

ALTER TABLE Series
ALTER COLUMN description VARCHAR(MAX) NULL

ALTER TABLE Series
ADD CONSTRAINT CHK_end_date CHECK(end_date >= start_date)

ALTER TABLE Thumbnail
ALTER COLUMN thumbnail_url VARCHAR(512) NOT NULL 
 

-- Make composite key from user_id and scene_id
-- Enforces uniqueness s.t. a user can rate a scene at most one time
ALTER TABLE Rating
ADD CONSTRAINT PK_rating PRIMARY KEY (user_id, scene_id);
