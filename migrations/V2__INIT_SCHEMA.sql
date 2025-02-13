CREATE TABLE [scene] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [reel_id] int NOT NULL,
  [timestamp] int NOT NULL,
  [title] nvarchar(255),
  [plot_description] text NOT NULL,
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
  [description] text,
  [release_date] date NOT NULL
)
GO

CREATE TABLE [series] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [title] nvarchar(255) NOT NULL,
  [description] text,
  [start_date] date,
  [end_date] date
)
GO

CREATE TABLE [location] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) NOT NULL,
  [address] text,
  [country] nvarchar(100) NOT NULL
)
GO

CREATE TABLE [actor] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) NOT NULL,
  [bio] text,
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
  [line_text] text NOT NULL,
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
  [comment_text] text NOT NULL,
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
  [description] text
)
GO

CREATE TABLE [role_permissions] (
  [role_id] int NOT NULL,
  [permission_id] int NOT NULL,
  PRIMARY KEY ([role_id], [permission_id])
)
GO

ALTER TABLE [scene] ADD FOREIGN KEY ([reel_id]) REFERENCES [reel] ([id])
GO

ALTER TABLE [scene] ADD FOREIGN KEY ([location_id]) REFERENCES [location] ([id])
GO

ALTER TABLE [reel] ADD FOREIGN KEY ([reel_type_id]) REFERENCES [reel_type] ([id])
GO

ALTER TABLE [reel] ADD FOREIGN KEY ([series_id]) REFERENCES [series] ([id])
GO

ALTER TABLE [scene_actor] ADD FOREIGN KEY ([scene_id]) REFERENCES [scene] ([id])
GO

ALTER TABLE [scene_actor] ADD FOREIGN KEY ([actor_id]) REFERENCES [actor] ([id])
GO

ALTER TABLE [dialog] ADD FOREIGN KEY ([scene_id]) REFERENCES [scene] ([id])
GO

ALTER TABLE [dialog] ADD FOREIGN KEY ([actor_id]) REFERENCES [actor] ([id])
GO

ALTER TABLE [rating] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [rating] ADD FOREIGN KEY ([scene_id]) REFERENCES [scene] ([id])
GO

ALTER TABLE [comment] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [comment] ADD FOREIGN KEY ([scene_id]) REFERENCES [scene] ([id])
GO

ALTER TABLE [thumbnail] ADD FOREIGN KEY ([scene_id]) REFERENCES [scene] ([id])
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