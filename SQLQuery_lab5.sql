GO
USE YoutubeMusic;
--we will work on playlist,playlist_song and songs
ALTER TABLE Playlist_Songs
DROP CONSTRAINT PK_Playlist_Songs ;
ALTER TABLE Playlist_Songs
ADD CONSTRAINT FK_playlist FOREIGN KEY(playlist_id) REFERENCES Playlist(playlist_id)
ALTER TABLE Playlist_Songs
ADD CONSTRAINT FK_song FOREIGN KEY(song_id) REFERENCES Songs(song_id)

ALTER TABLE Playlist_Songs
ADD PS_id INT IDENTITY(1,1) PRIMARY KEY;
SELECT *
FROM Playlist_Songs
SELECT *
FROM Songs
SELECT* 
FROM Playlist

INSERT INTO Playlist Values(1,'playlist1',8,4)
INSERT INTO Playlist Values(2,'playlist2',555,2)
INSERT INTO Playlist Values(3,'playlist3',8288,7)
INSERT INTO Playlist_Songs VALUES(1,1)
INSERT INTO Playlist_Songs VALUES(1,2)
INSERT INTO Playlist_Songs VALUES(1,7)
INSERT INTO Playlist_Songs VALUES(2,1)
INSERT INTO Playlist_Songs VALUES(2,5)
INSERT INTO Playlist_Songs VALUES(3,3)
INSERT INTO Playlist_Songs VALUES(3,1)
--TA=Playlist (a2=saves)
--TB=Songs(b2=duration)					
--TC=Playlist_Songs
-----------------------------------A-------------------------------------------------------
--clustered index scan;
SELECT *
FROM Playlist;
--clustered index seek;
SELECT *
FROM Playlist
WHERE playlist_id = 1;
--nonclustered index scan;
CREATE NONCLUSTERED INDEX INDEX1 ON Playlist(title)
SELECT *
FROM Playlist
WHERE title LIKE 'p%';
--nonclustered index seek;
SELECT *
FROM Playlist 
WHERE saves = 4;
--key lookup.
SELECT title
FROM Playlist
WHERE playlist_id = 1;
---------------------------------------B-----------------------------------------
--Write a query on table Tb with a WHERE clause of the form WHERE b2 = value and
--analyze its execution plan. Create a nonclustered index that can speed up the query.
--Examine the execution plan again
DROP INDEX IX_SONGS_Duration  ON Songs;
SET SHOWPLAN_ALL ON;
GO
SELECT *
FROM SONGS
WHERE duration = 5;
-- Create a non-clustered index on the duration column
CREATE NONCLUSTERED INDEX IX_SONGS_Duration ON SONGS(duration);
-- Re-run the query to observe the updated execution plan
SELECT *
FROM SONGS
WHERE duration = 5;
-- View the execution plan for the view query
SET SHOWPLAN_ALL OFF;
-------------------------------C-----------------------------------------------------------
-- Create a view that joins at least 2 tables. Check whether existing indexes are helpful;
--if not, reassess existing indexes / examine the cardinality of the tables.
GO
CREATE VIEW Songs_Playlist_View AS
SELECT s.song_id, s.title AS song_title, s.duration, ps.playlist_id
FROM Songs s
JOIN Playlist_Songs ps ON s.song_id = ps.song_id;
GO
create index ix_songid on Playlist_Songs(song_id)

-- Check the number of rows in Songs and Playlist_Songs tables
SELECT COUNT(*) AS song_count FROM Songs;
SELECT COUNT(*) AS playlist_song_count FROM Playlist_Songs;

Select *
From Songs_Playlist_View
