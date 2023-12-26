GO
USE YoutubeMusic;
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_Tables

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tables

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_TestRuns

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_TestRuns

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tests

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Tests

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_Views

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Views

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[Tables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Tables]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRunTables]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRunViews]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[TestRuns]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRuns]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[TestTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestTables]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[TestViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestViews]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[Tests]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Tests]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[Views]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Views]

GO



CREATE TABLE [Tables] (

	[TableID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [TestRunTables] (

	[TestRunID] [int] NOT NULL ,

	[TableID] [int] NOT NULL ,

	[StartAt] [datetime] NOT NULL ,

	[EndAt] [datetime] NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [TestRunViews] (

	[TestRunID] [int] NOT NULL ,

	[ViewID] [int] NOT NULL ,

	[StartAt] [datetime] NOT NULL ,

	[EndAt] [datetime] NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [TestRuns] (

	[TestRunID] [int] IDENTITY (1, 1) NOT NULL ,

	[Description] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,

	[StartAt] [datetime] NULL ,

	[EndAt] [datetime] NULL 

) ON [PRIMARY]

GO



CREATE TABLE [TestTables] (

	[TestID] [int] NOT NULL ,

	[TableID] [int] NOT NULL ,

	[NoOfRows] [int] NOT NULL ,

	[Position] [int] NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [TestViews] (

	[TestID] [int] NOT NULL ,

	[ViewID] [int] NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [Tests] (

	[TestID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [Views] (

	[ViewID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO



ALTER TABLE [Tables] WITH NOCHECK ADD 

	CONSTRAINT [PK_Tables] PRIMARY KEY  CLUSTERED 

	(

		[TableID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestRunTables] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRunTables] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID],

		[TableID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestRunViews] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRunViews] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID],

		[ViewID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestRuns] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRuns] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestTables] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestTables] PRIMARY KEY  CLUSTERED 

	(

		[TestID],

		[TableID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestViews] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestViews] PRIMARY KEY  CLUSTERED 

	(

		[TestID],

		[ViewID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [Tests] WITH NOCHECK ADD 

	CONSTRAINT [PK_Tests] PRIMARY KEY  CLUSTERED 

	(

		[TestID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [Views] WITH NOCHECK ADD 

	CONSTRAINT [PK_Views] PRIMARY KEY  CLUSTERED 

	(

		[ViewID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestRunTables] ADD 

	CONSTRAINT [FK_TestRunTables_Tables] FOREIGN KEY 

	(

		[TableID]

	) REFERENCES [Tables] (

		[TableID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestRunTables_TestRuns] FOREIGN KEY 

	(

		[TestRunID]

	) REFERENCES [TestRuns] (

		[TestRunID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO



ALTER TABLE [TestRunViews] ADD 

	CONSTRAINT [FK_TestRunViews_TestRuns] FOREIGN KEY 

	(

		[TestRunID]

	) REFERENCES [TestRuns] (

		[TestRunID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestRunViews_Views] FOREIGN KEY 

	(

		[ViewID]

	) REFERENCES [Views] (

		[ViewID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO



ALTER TABLE [TestTables] ADD 

	CONSTRAINT [FK_TestTables_Tables] FOREIGN KEY 

	(

		[TableID]

	) REFERENCES [Tables] (

		[TableID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestTables_Tests] FOREIGN KEY 

	(

		[TestID]

	) REFERENCES [Tests] (

		[TestID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO



ALTER TABLE [TestViews] ADD 

	CONSTRAINT [FK_TestViews_Tests] FOREIGN KEY 

	(

		[TestID]

	) REFERENCES [Tests] (

		[TestID]

	),

	CONSTRAINT [FK_TestViews_Views] FOREIGN KEY 

	(

		[ViewID]

	) REFERENCES [Views] (

		[ViewID]

	)

GO

--Tables:
--1 PK ,no FK: Users
--1 PK,1 FK: Playlist
--2 PK: Playlist_Songs
SELECT name
FROM sys.objects
WHERE parent_object_id = OBJECT_ID('Playlist_Songs') AND type_desc = 'FOREIGN_KEY_CONSTRAINT';

ALTER TABLE Playlist_Songs
DROP CONSTRAINT FK__Playlist___playl__5629CD9C; 

ALTER TABLE Playlist_Songs
DROP CONSTRAINT FK__Playlist___song___571DF1D5; 

ALTER TABLE Playlist_Songs
ALTER COLUMN playlist_id INT NOT NULL;
ALTER TABLE Playlist_Songs
ALTER COLUMN song_id INT NOT NULL;

ALTER TABLE Playlist_Songs
ADD CONSTRAINT PK_Playlist_Songs PRIMARY KEY (playlist_id, song_id);

Insert into Tables Values ('Users')
Insert into Tables Values ('Playlist')
Insert into Tables Values ('Playlist_Songs')

--Views:View_1,View_2,View_3

--SELECT/1 TABLE view_1
GO
CREATE VIEW View_1 AS
SELECT user_id, username
FROM Users
GO
--SELECT/JOIN on 2 tables
go
CREATE VIEW View_2 AS
SELECT S.song_id,title
FROM Songs S
JOIN Playlist_Songs P on S.song_id=P.song_id
go
--SELECT/GROUP BY/JOIN on 2 tables
GO
CREATE VIEW View_3 AS
SELECT P.playlist_id,COUNT(S.song_id) AS NR_songs
FROM Songs S
JOIN Playlist_Songs P on S.song_id=P.song_id
Group BY(P.playlist_id)
GO

Insert into Views Values ('View_1')
Insert into Views Values ('View_2')
Insert into Views Values ('View_3')

--Insert into tests
INSERT INTO Tests Values ('insert_table_10')
INSERT INTO Tests Values ('insert_table_100')
INSERT INTO Tests Values ('insert_table_1000')
INSERT INTO Tests Values ('delete_table_10')
INSERT INTO Tests Values ('delete_table_100')
INSERT INTO Tests Values ('delete_table_1000')
INSERT INTO Tests Values ('select_view')

Select *
From Tests
Select *
From Views

--Insert into test view
INSERT INTO TestViews Values(7,1)
INSERT INTO TestViews Values(7,2)
INSERT INTO TestViews Values(7,3)

--Insert into test table
Select *
FROM Tables
INSERT INTO TestTables Values(1,1,10,1)
INSERT INTO TestTables Values(2,1,100,1)
INSERT INTO TestTables Values(3,1,1000,1)
INSERT INTO TestTables Values(1,2,10,2)
INSERT INTO TestTables Values(2,2,100,2)
INSERT INTO TestTables Values(3,2,1000,2)
INSERT INTO TestTables Values(1,3,10,3)
INSERT INTO TestTables Values(2,3,100,3)
INSERT INTO TestTables Values(3,3,1000,3)

Select *
from TestTables

INSERT INTO TestTables Values(4,1,10,3)
INSERT INTO TestTables Values(5,1,100,3)
INSERT INTO TestTables Values(6,1,1000,3)
INSERT INTO TestTables Values(4,2,10,2)
INSERT INTO TestTables Values(5,2,100,2)
INSERT INTO TestTables Values(6,2,1000,2)
INSERT INTO TestTables Values(4,3,10,1)
INSERT INTO TestTables Values(5,3,100,1)
INSERT INTO TestTables Values(6,3,1000,1)

--create procedures insert

--insert into Users 10 rows--------------------
GO 
CREATE PROCEDURE insert_table_10(@TableID int)
AS
BEGIN
	DECLARE @n int
	if @TableID NOT IN (SELECT TableID FROM TestTables)
	BEGIN
		raiserror('bad table_id', 10, 1)
		RETURN
	END

	SET @n = 1
	IF @TableID = 1
	BEGIN
		WHILE @n < 11
		BEGIN 
			INSERT INTO Users VALUES (@n, 'User', 'user@gmail.com', '***', '2023-12-12');
			SET @n = @n + 1
		END;
	END;
	IF @TableID = 2
	BEGIN
		DECLARE @fk int
		SELECT @fk = MIN(user_id) FROM Users
		IF @fk IS NULL 
		BEGIN
			raiserror('couldn t find fk for user', 10, 1)
			RETURN
		END
		WHILE @n < 11
		BEGIN 
			INSERT INTO Playlist VALUES (@n, 'Playlist', @fk);
			SET @n = @n + 1
		END;
	END;
	IF @TableID = 3
	BEGIN
		DECLARE @song_id int
		DECLARE @playlist_id int
		DECLARE @maxtries int
		SET @maxtries = 100
		WHILE @n < 11 AND @maxtries >= 0
		BEGIN
			SET @song_id = (SELECT TOP 1 song_id FROM Songs ORDER BY NEWID()) -- Select a random song_id
			SET @playlist_id = (SELECT TOP 1 playlist_id FROM Playlist ORDER BY NEWID()) -- Select a random playlist_id
			BEGIN TRY
				INSERT INTO Playlist_Songs (playlist_id, song_id) VALUES (@playlist_id, @song_id)
				SET @n = @n + 1	
			END TRY
			BEGIN CATCH
				SET @maxtries = @maxtries - 1
			END CATCH;
		END;
		IF @maxtries = 0
			raiserror('couldn t find new pairs or waiting time too long', 10, 1)
			RETURN
	END;
END;



-----------------------------------
--insert 100
GO 
CREATE PROCEDURE insert_table_100(@TableID int)
AS
BEGIN
	DECLARE @m int
	DECLARE @id int
	if @TableID NOT IN (SELECT TableID
					FROM TestTables)
	BEGIN
					raiserror('bad table_id',10,1)
					RETURN
	END
	SET @m=0
	IF @TableID=1
	Begin
		SELECT @id=MAX(user_id)+1 From Users
		IF @id IS NULL 
			SET @id =1
		WHILE @m<100
		BEGIN 
			INSERT INTO Users VALUES (@id,'User','user@gmail.com','***','2023-12-12');
			SET @m=@m+1
			SET @id=@id+1
		END;
	END;
	IF @TableID=2
	BEGIN
		SELECT @id=MAX(playlist_id)+1 From Playlist
		IF @id is NULL
			SET @id=1
		DECLARE @fk int
		SELECT @fk = MIN(user_id) FROM Users
		IF @fk IS NULL 
			BEGIN
				raiserror('couldn t find fk for user',10,1)
				return
			END
		--WE ADD IN PLAYLIST
		WHILE @m<100
		BEGIN 
			INSERT INTO Playlist VALUES (@id,'Playlist',@fk);
			SET @m=@m+1
			SET @id=@id+1
		END;
	END;
	IF @TableID=3
	BEGIN
		DECLARE @song_id int
		DECLARE @playlist_id int
		DECLARE @maxtries int
		SET @maxtries=1000
		--WE ADD IN Playlist_Songs
		WHILE @m<100 AND @maxtries>=0
		BEGIN
			SET @song_id = (SELECT TOP 1 song_id FROM Songs ORDER BY NEWID()) -- Select a random song_id
			SET @playlist_id = (SELECT TOP 1 playlist_id FROM Playlist ORDER BY NEWID()) -- Select a random playlist_id
			BEGIN TRY
				INSERT INTO Playlist_Songs (playlist_id, song_id) VALUES (@playlist_id, @song_id)
				SET @m = @m + 1	
			END TRY
			BEGIN CATCH
				SET @maxtries=@maxtries-1
			END CATCH;
		END;
		IF @maxtries=0
			raiserror('couldn t find new pairs or waiting time too long',10,1)
			return
	END;
END;

------------------------------------------------------------------------------------
--insert 1000
GO 
CREATE PROCEDURE insert_table_1000(@TableID int)
AS
BEGIN
	DECLARE @n int
	if @TableID NOT IN (SELECT TableID FROM TestTables)
	BEGIN
		raiserror('bad table_id', 10, 1)
		RETURN
	END

	SET @n = 1
	IF @TableID = 1 -- For @TableID = 1
	BEGIN
		WHILE @n < 1001
		BEGIN 
			INSERT INTO Users VALUES (@n, 'User', 'user@gmail.com', '***', '2023-12-12');
			SET @n = @n + 1
		END;
	END;
	IF @TableID = 2 -- For @TableID = 2
	BEGIN
		DECLARE @fk int
		SELECT @fk = MIN(user_id) FROM Users
		IF @fk IS NULL 
		BEGIN
			raiserror('couldn t find fk for user', 10, 1)
			RETURN
		END

		WHILE @n < 1001
		BEGIN 
			INSERT INTO Playlist VALUES (@n, 'Playlist', @fk);
			SET @n = @n + 1
		END;
	END;
	IF @TableID = 3 -- For @TableID = 3
	BEGIN
		DECLARE @song_id int
		DECLARE @playlist_id int
		DECLARE @maxtries int
		SET @maxtries = 10000
		WHILE @n < 1001 AND @maxtries >= 0
		BEGIN
			SET @song_id = (SELECT TOP 1 song_id FROM Songs ORDER BY NEWID()) -- Select a random song_id
			SET @playlist_id = (SELECT TOP 1 playlist_id FROM Playlist ORDER BY NEWID()) -- Select a random playlist_id
			BEGIN TRY
				INSERT INTO Playlist_Songs (playlist_id, song_id) VALUES (@playlist_id, @song_id)
				SET @n = @n + 1	
			END TRY
			BEGIN CATCH
				SET @maxtries = @maxtries - 1
			END CATCH;
		END;
		IF @maxtries = 0
			PRINT 'couldn t find new pairs or waiting time too long'
			RETURN
	END;
END;

--verificare ------------------------

SELECT*
FROM Users

SELECT *
FROM Playlist

SELECT *
FROM Playlist_Songs

DELETE FROM Users

DELETE FROM Playlist

DELETE FROM Playlist_Songs

EXEC insert_table_10 @TableID=1;
EXEC insert_table_100 @TableID=2;
EXEC insert_table_1000 @TableID=3;

---------delet operation -----------------
GO
CREATE PROCEDURE delete_table_10(@TableID int)
AS
BEGIN 
	declare @n int
	SET @n =10
		if @TableID NOT IN (SELECT TableID FROM TestTables)
	BEGIN
		raiserror('bad table_id', 10, 1)
		RETURN
	END
	if @TableID=1
	Begin
		--deleting from users
		while @n>0
		BEGIN
			if EXISTS (SELECT TOP 1 * FROM Users)
			BEGIN
				SET @n=@n-1
				DELETE TOP(1) FROM	Users
			END
		END
		IF @n>0
			print 'there weren t enough elements to be deleted'
	end
	if @TableID=2
	begin
		--deleting from playlist
		while @n>0
		BEGIN
			if EXISTS (SELECT TOP 1 * FROM Playlist)
			BEGIN
				SET @n=@n-1
				DECLARE @playlist_id int
				SELECT TOP 1 @playlist_id = playlist_id FROM Playlist
				IF @playlist_id IN (SELECT playlist_id FROM Playlist_Songs)
				begin
					DELETE FROM Playlist_Songs WHERE playlist_id=@playlist_id
				end
				DELETE TOP(1) FROM Playlist
			END
		END
		IF @n>0
			print 'there weren t enough elements to be deleted'
	end
	if @TableID=3
	begin 
		--deleting from playlist_songs
		while @n>0
		BEGIN
			if EXISTS (SELECT TOP 1 * FROM Playlist_Songs)
			BEGIN
				SET @n=@n-1
				DELETE TOP(1) FROM Playlist_Songs
			END
		END
		IF @n>0
			print 'there weren t enough elements to be deleted'
	end
	
END;
GO
-- Procedure for deleting 100 records
CREATE PROCEDURE delete_table_100(@TableID int)
AS
BEGIN 
	declare @n int
	SET @n = 100
	if @TableID NOT IN (SELECT TableID FROM TestTables)
	BEGIN
		raiserror('bad table_id', 10, 1)
		RETURN
	END
	if @TableID=1
	BEGIN
		while @n>0
		BEGIN
			if EXISTS (SELECT TOP 1 * FROM Users)
			BEGIN
				SET @n = @n - 1
				DELETE TOP(1) FROM Users
			END
		END
		IF @n>0
			print 'There were not enough elements to be deleted'
	END
	if @TableID=2
	BEGIN
		while @n>0
		BEGIN
			if EXISTS (SELECT TOP 1 * FROM Playlist)
			BEGIN
				SET @n = @n - 1
				DECLARE @playlist_id int
				SELECT TOP 1 @playlist_id = playlist_id FROM Playlist
				IF @playlist_id IN (SELECT playlist_id FROM Playlist_Songs)
				BEGIN
					DELETE FROM Playlist_Songs WHERE playlist_id=@playlist_id
				END
				DELETE TOP(1) FROM Playlist
			END
		END
		IF @n>0
			print 'There were not enough elements to be deleted'
	END
	if @TableID=3
	BEGIN 
		while @n>0
		BEGIN
			if EXISTS (SELECT TOP 1 * FROM Playlist_Songs)
			BEGIN
				SET @n = @n - 1
				DELETE TOP(1) FROM Playlist_Songs
			END
		END
		IF @n>0
			print 'There were not enough elements to be deleted'
	END
END;
go
-- Procedure for deleting 1000 records
CREATE PROCEDURE delete_table_1000(@TableID int)
AS
BEGIN 
	declare @n int
	SET @n = 1000
	if @TableID NOT IN (SELECT TableID FROM TestTables)
	BEGIN
		raiserror('bad table_id', 10, 1)
		RETURN
	END
	if @TableID=1
	BEGIN
		while @n>0
		BEGIN
			if EXISTS (SELECT TOP 1 * FROM Users)
			BEGIN
				SET @n = @n - 1
				DELETE TOP(1) FROM Users
			END
		END
		IF @n>0
			print 'There were not enough elements to be deleted'
	END
	if @TableID=2
	BEGIN
		while @n>0
		BEGIN
			if EXISTS (SELECT TOP 1 * FROM Playlist)
			BEGIN
				SET @n = @n - 1
				DECLARE @playlist_id int
				SELECT TOP 1 @playlist_id = playlist_id FROM Playlist
				IF @playlist_id IN (SELECT playlist_id FROM Playlist_Songs)
				BEGIN
					DELETE FROM Playlist_Songs WHERE playlist_id=@playlist_id
				END
				DELETE TOP(1) FROM Playlist
			END
		END
		IF @n>0
			print 'There were not enough elements to be deleted'
	END
	if @TableID=3
	BEGIN 
		while @n>0
		BEGIN
			if EXISTS (SELECT TOP 1 * FROM Playlist_Songs)
			BEGIN
				SET @n = @n - 1
				DELETE TOP(1) FROM Playlist_Songs
			END
		END
		IF @n>0
			print 'There were not enough elements to be deleted'
	END
END;
--------------verification delete----------------

SELECT*
FROM Users

SELECT *
FROM Playlist

SELECT *
FROM Playlist_Songs

DELETE FROM Users

DELETE FROM Playlist

DELETE FROM Playlist_Songs

EXEC delete_table_10 @TableID=2
EXEC delete_table_100 @TableID=1
EXEC delete_table_1000 @TableID=2

-----the select command-------------------------------------
GO 
CREATE PROCEDURE select_view(@View_id int)
AS
BEGIN
	DECLARE @name VARCHAR(30)
	select @name=Name
	FROM Views
	WHERE Views.ViewID=@View_id
	IF @name is null 
	begin
		print 'the view id doesn t exist'
		return
	end
	DECLARE @sqlQuery NVARCHAR(MAX)
    SET @sqlQuery = 'SELECT * FROM ' + QUOTENAME(@name) -- Construct the dynamic query

    EXEC sp_executesql @sqlQuery -- Execute the dynamic SQL
END;
EXEC select_view @View_id=1
------------------------------TEST---------------------------------------------------------------------------
EXEC insert_table_100 @TableID=1
EXEC insert_table_100 @TableID=2
EXEC insert_table_100 @TableID=3
GO 
CREATE PROCEDURE test1
AS
BEGIN
	DECLARE @ds DATETIME --START TIME
	DECLARE @di DATETIME --INTERMEDIATE TIME
	DECLARE @de DATETIME --END TIME
	SET @ds=GETDATE()
	EXEC delete_table_100 @TableID =3
	EXEC delete_table_100 @TableID =2
	EXEC delete_table_100 @TableID =1
	EXEC insert_table_100 @TableID =1
	EXEC insert_table_100 @TableID =2
	EXEC insert_table_100 @TableID =3
	SET @di=GETDATE()
	EXEC select_view @View_id=1
	EXEC select_view @View_id=2
	SET @de=GETDATE()
	INSERT INTO TestRuns (StartAt,EndAt) VALUES (@ds,@de)
	DECLARE @testrunid INT
	SELECT @testrunid = TestRunID
	FROM TestRuns
	WHERE StartAt=@ds and EndAt=@de
	INSERT INTO TestRunTables (TestRunID,TableID,StartAt,EndAt) VALUES (@testrunid,1,@ds,@di)
	INSERT INTO TestRunTables (TestRunID,TableID,StartAt,EndAt) VALUES (@testrunid,2,@ds,@di)
	INSERT INTO TestRunTables (TestRunID,TableID,StartAt,EndAt) VALUES (@testrunid,3,@ds,@di)
	INSERT INTO TestRunViews VALUES(@testrunid,1,@di,@de)
	INSERT INTO TestRunViews VALUES(@testrunid,1,@di,@de)
END;
EXEC test1
SELECT *
FROM TestRuns
SELECT * FROM TestRunTables
SELECT * FROM TestRunViews