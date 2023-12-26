CREATE DATABASE YoutubeMusic;
GO
USE YoutubeMusic;
GO

CREATE TABLE Users (
	user_id INT PRIMARY KEY,
	username varchar(225) NOT NULL,
	email VARCHAR(225) NOT NULL,
	password_user VARCHAR(225) NOT NULL,
	registration_date DATE NOT NULL,
	CONSTRAINT chk_email_format CHECK (email LIKE '%@gmail.com' OR email LIKE '%@yahoo.com')
	);

CREATE TABLE Artists (
	artist_id INT PRIMARY KEY,
	name_artist VARCHAR(225) NOT NULL,
	bio TEXT,
	genre VARCHAR(225)
);

CREATE TABLE Albums (
	album_id INT PRIMARY KEY,
	title VARCHAR(225) NOT NULL,
	release_date DATE NOT NULL,
	artist_id INT FOREIGN KEY REFERENCES Artists(artist_id)
	);

CREATE TABLE Songs (
	song_id INT PRIMARY KEY,
	title VARCHAR(225) NOT NULL,
	duration INT NOT NULL,
	lyrics TEXT ,
	album_id INT FOREIGN KEY REFERENCES Albums(album_id)
	);

CREATE TABLE Playlist (
	playlist_id INT PRIMARY KEY,
	title VARCHAR(225) NOT NULL,
	user_id INT FOREIGN KEY REFERENCES Users(user_id)
	);

CREATE TABLE Playlist_Songs (
	playlist_id INT FOREIGN KEY REFERENCES Playlist(playlist_id),
	song_id INT FOREIGN KEY REFERENCES Songs(song_id)
	);


CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    user_id INT,
    song_id INT,
    like_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    user_id INT,
    song_id INT,
    comment_text TEXT NOT NULL,
    comment_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

CREATE TABLE Follows (
    follow_id INT PRIMARY KEY,
    user_id INT,
    artist_id INT,
    follow_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);


CREATE TABLE History (
    history_id INT PRIMARY KEY,
    user_id INT,
    song_id INT,
    listen_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

--adding values into Artist table:
INSERT INTO YoutubeMusic.dbo.Artists(artist_id,name_artist,bio,genre)
VALUES(111,'Taylor Swift','the biggest artist of the moment','Pop');
INSERT INTO Artists(artist_id,name_artist,bio,genre)
VALUES(122,'Olivia Rodrigo','an young but talented artist','Pop');
INSERT INTO Artists(artist_id,name_artist,bio,genre)
VALUES(333,'Maneskine','the italian band that has won Eurovision ','Rock');

SELECT *
FROM Artists;

--adding values into Users table:
INSERT INTO Users(user_id,username,email,password_user,registration_date)
VALUES(8288,'DianaDob','diana@gmail.com','sisi','2017-11-11');

--here goes a violation of a referential integrity constrain:
INSERT INTO Users(user_id,username,email,password_user,registration_date)
VALUES(8288,'Alex','nothing@gmail.com','aaaalex','2016-09-11');

INSERT INTO Users(user_id,username,email,password_user,registration_date)
VALUES(8,'Alex','alex@gmail.com','aaalex','2023-12-02');
INSERT INTO Users(user_id,username,email,password_user,registration_date)
VALUES(555,'Bogdan','bogdan@gmail.com','bb1','2022-02-07');

SELECT *
FROM Users;

--adding into Albums
INSERT INTO Albums(album_id,title,release_date,artist_id)
VALUES (13,'Red','2021-10-12',111);
INSERT INTO Albums(album_id,title,release_date,artist_id)
VALUES (12,'Lover','2022-11-22',111);
INSERT INTO Albums(album_id,title,release_date,artist_id)
VALUES (11,'Reputation','2019-11-10',111);
INSERT INTO Albums(album_id,title,release_date,artist_id)
VALUES (10,'RUSH','2023-02-02',333);
INSERT INTO Albums(album_id,title,release_date,artist_id)
VALUES (1,'GUTS','2023-01-12',122);

SELECT *
FROM Albums;

--adding into Songs
INSERT INTO Songs(song_id,title,duration,lyrics,album_id)
VALUES (1,'All too well',10,'you call me up again',13);
INSERT INTO Songs(song_id,title,duration,lyrics,album_id)
VALUES (2,'Red',4,'loving him was blue',13);
INSERT INTO Songs(song_id,title,duration,lyrics,album_id)
VALUES (3,'Better man',3,'I wish you were a better man',13);
INSERT INTO Songs(song_id,title,duration,lyrics,album_id)
VALUES (4,'Bad idea right?',5,'and I m sure i ve seen much hotter man',1);
INSERT INTO Songs(song_id,title,duration,lyrics,album_id)
VALUES (5,'Ballad of homescholled girl',4,'searching how to start a conversation on a website',1);
INSERT INTO Songs(song_id,title,duration,lyrics,album_id)
VALUES (7,'KOOL KIDS',5,'I know you think she s a hot chick but i m sirry she preffers hot chicks',10);

SELECT *
FROM Songs;

-- Adding values into Playlist table:
INSERT INTO Playlist(playlist_id, title, user_id)
VALUES (1, 'Favorites', 8288);
INSERT INTO Playlist(playlist_id, title, user_id)
VALUES (2, 'Rock Classics', 555);

SELECT *
FROM Playlist;

-- Adding values into Playlist_Songs table:
INSERT INTO Playlist_Songs(playlist_id, song_id)
VALUES (1, 1);
INSERT INTO Playlist_Songs(playlist_id, song_id)
VALUES (1, 2);
INSERT INTO Playlist_Songs(playlist_id, song_id)
VALUES (2, 7);
INSERT INTO Playlist_Songs(playlist_id, song_id)
VALUES (2, 2);

SELECT *
FROM Playlist_Songs;

-- Adding values into Likes table:
INSERT INTO Likes(like_id, user_id, song_id, like_date)
VALUES (1, 8288, 1, '2023-01-15');
INSERT INTO Likes(like_id, user_id, song_id, like_date)
VALUES (2, 555, 7, '2023-02-01');
INSERT INTO Likes(like_id, user_id, song_id, like_date)
VALUES (3, 8, 7, '2023-02-01');
INSERT INTO Likes(like_id, user_id, song_id, like_date)
VALUES (4, 8, 1, '2023-01-15');
INSERT INTO Likes(like_id, user_id, song_id, like_date)
VALUES (5, 8, 3, '2023-01-15');
INSERT INTO Likes(like_id, user_id, song_id, like_date)
VALUES (6, 8288, 7, '2023-01-15');

SELECT *
FROM Likes;

-- Adding values into Comments table:
INSERT INTO Comments(comment_id, user_id, song_id, comment_text, comment_date)
VALUES (1, 8288, 1, 'Love this song!', '2023-01-20');
INSERT INTO Comments(comment_id, user_id, song_id, comment_text, comment_date)
VALUES (2, 555, 7, 'Great lyrics!', '2023-02-05');

SELECT *
FROM Comments;

-- Adding values into Follows table:
INSERT INTO Follows(follow_id, user_id, artist_id, follow_date)
VALUES (1, 8288, 111, '2023-01-10');
INSERT INTO Follows(follow_id, user_id, artist_id, follow_date)
VALUES (2, 555, 333, '2023-02-08');

SELECT *
FROM Follows;

-- Adding values into History table:
INSERT INTO History(history_id, user_id, song_id, listen_date)
VALUES (1, 8288, 1, '2023-01-25 08:30:00');

INSERT INTO History(history_id, user_id, song_id, listen_date)
VALUES (2, 555, 7, '2023-02-10 15:45:00');
INSERT INTO History(history_id, user_id, song_id, listen_date)
VALUES (3, 8, 7, '2023-02-10 15:45:00');

SELECT *
FROM History;

--Deleting one artist
DELETE FROM Artists WHERE name_artist='Olivia Rodrica';
DELETE FROM Songs WHERE song_id=5;
DELETE FROM Songs WHERE song_id=4;
DELETE FROM Albums Where album_id=17;

--Update data in 3 tables
UPDATE Songs
SET duration = 5 
WHERE song_id = 3;
--using IS NULL
UPDATE Artists
SET genre='Pop-Rock'
WHERE genre='Rock' OR genre IS NULL;
--using AND:
UPDATE Users
SET password_user='***'
WHERE password_user='sisi' AND username='DianaDob';

--Union and OR:
--Union between songs and albums titles where songs have a lenght grater that 5 or smaller than 3
SELECT title FROM Albums
UNION ALL
SELECT title FROM Songs
WHERE duration<3 OR duration>5;
--union between artists and users that have the vaul 'o' or 'O' in their name
SELECT username as name
FROM Users
WHERE username LIKE '%o%' OR username LIKE '%O%'
UNION
SELECT name_artist as name
FROM Artists
WHERE name_artist LIKE '%o%' OR name_artist LIKE '%O%';

--2 queries using intersection and in
--Query to Retrieve Songs in Both Favorites and Rock Classics Playlists:
SELECT song_id,title
FROM Songs
WHERE song_id IN (SELECT song_id
					FROM Playlist_Songs
					WHERE playlist_id=1)
INTERSECT
SELECT song_id,title
FROM Songs
WHERE song_id IN (SELECT song_id
					FROM Playlist_Songs
					WHERE playlist_id=2);
--Query to retrive the name of the persons how commented AND liked the song 'all too well'
SELECT user_id,username
FROM Users
WHERE user_id IN(SELECT user_id
FROM Likes
WHERE song_id IN(SELECT song_id
					FROM Songs
					WHERE title = 'All too well')
INTERSECT
SELECT user_id
FROM Comments
WHERE song_id IN(SELECT song_id
					FROM Songs
					WHERE title = 'All too well'));


--2 queries with the difference operation; use EXCEPT and NOT IN;
--querie to find the songs that are not in the playlist 'Favorites'
SELECT song_id,title
FROM Songs
where song_id in(SELECT song_id
FROM Songs
EXCEPT 
SELECT song_id
FROM Playlist_Songs
WHERE playlist_id IN (SELECT playlist_id
							FROM Playlist
							WHERE title = 'Favorites'));
--querie to find the song that don t have any comments
SELECT song_id,title
FROM Songs
WHERE song_id NOT IN (SELECT song_id
					FROM Comments);

--4 queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN (one query per operator); one query will join at least 3 tables, while another one will join at least two many-to-many relationships;
--Show all the comments and the username of the person that commented 
SELECT c.user_id,u.user_id,u.username,c.comment_text
FROM Comments c
INNER JOIN Users u on c.user_id=u.user_id;
--Show all the users and their comments, if they have any
SELECT u.username,c.comment_text
FROM Users u
LEFT JOIN Comments c on c.user_id=u.user_id;
--Show all the songs and if someone liked them (many to many relation)
SELECT u.username,l.song_id,s.title
FROM Likes l
RIGHT JOIN Users u on l.user_id=u.user_id
RIGHT JOIN Songs s on s.song_id=l.song_id;
--FULL JOIN on 3 tables : show all albums and they songs with their artist
SELECT a.title,s.title,ar.name_artist
FROM Albums a
FULL JOIN Songs s ON s.album_id=a.album_id
FULL JOIN Artists ar ON ar.artist_id=a.artist_id;

--2 queries with the IN operator and a subquery in the WHERE clause; in at least one case, the subquery must include a subquery in its own WHERE clause;
--show all the songs that have at list a comment
SELECT title
FROM Songs
WHERE song_id IN (SELECT song_id
					FROM Comments);
--show all the songs that apper in a playlist created by user with id 8288
SELECT title
FROM Songs
WHERE song_id IN (SELECT song_id
					FROM Playlist_Songs
					WHERE playlist_id IN (SELECT playlist_id
											FROM Playlist
											WHERE user_id='8288'));

--2 queries with the EXISTS operator and a subquery in the WHERE clause;
--Query Using EXISTS to Retrieve Users Who Have Liked a Song:
SELECT username
FROM Users u
WHERE EXISTS (
    SELECT l.user_id
    FROM Likes l
    WHERE l.user_id = u.user_id
);
--Query Using EXISTS to Retrieve Songs with Comments:
SELECT s.title
FROM Songs s
WHERE EXISTS (
	SELECT c.song_id
	FROM Comments c
	WHERE c.song_id = s.song_id);

--2 queries with a subquery in the FROM clause;   
-- Calculate the average duration of songs for each artist
SELECT artist_name, AVG(song_duration) AS average_duration
FROM (
    SELECT a.name_artist AS artist_name, s.duration AS song_duration
    FROM Artists a
    JOIN Albums al ON a.artist_id = al.artist_id
    JOIN Songs s ON al.album_id = s.album_id
) AS Subquery
GROUP BY artist_name;
--show the albums and the number of songs they have
SELECT title_album,COUNT(song_id)
FROM(SELECT a.title as title_album, s.song_id as song_id
	FROM Albums a,Songs s
	WHERE a.album_id=s.album_id
) AS Subquery
GROUP BY title_album;

--4 queries with the GROUP BY clause, 3 of which also contain the HAVING clause; 2 of the latter will also have a subquery in the HAVING clause; use the aggregation operators: COUNT, SUM, AVG, MIN, MAX;
--Query to Find Users with More Than 0 Likes:
SELECT l.user_id,u.username
FROM Likes l, Users u
WHERE l.user_id=u.user_id
GROUP BY l.user_id,u.username
HAVING COUNT(*)>0;
--Query to Find Artists with More Than 2 Albums and Total Duration Over 10 Minutes and show the duration in seconds
SELECT a.artist_id,a.name_artist,SUM(s.duration * 60) AS total_duration_seconds
FROM Artists a, Albums al, Songs s
WHERE a.artist_id=al.artist_id AND s.album_id=al.album_id
GROUP BY a.artist_id,a.name_artist
HAVING COUNT(*)>2 AND SUM(s.duration)>10;
--show the users and their number of comments and their years of using the up
SELECT u.username,COUNT(c.comment_id) AS sum_of_comm,YEAR(GETDATE()) - YEAR(u.registration_date) AS years_since_registration
From Users u
INNER JOIN Comments c ON u.user_id=c.user_id
GROUP BY u.username,u.registration_date
--SHOW THE ALBUMS BEING IN THE POP GENRE
SELECT al.title
FROM Albums al
INNER JOIN Artists s ON al.artist_id=s.artist_id
WHERE s.genre='Pop'
GROUP BY al.title
HAVING COUNT(s.artist_id)>0;

-- 4 queries using ANY and ALL to introduce a subquery in the WHERE clause (2 queries per operator); rewrite 2 of them with aggregation operators, and the other 2 with IN / [NOT] IN.
-- Find users who have liked at least one song
SELECT DISTINCT u.username
FROM Users u
WHERE u.user_id = ANY (
    SELECT l.user_id
    FROM Likes l
);
-- Find users who have liked at least one song (using in)
SELECT DISTINCT u.username
FROM Users u
WHERE u.user_id IN (
    SELECT DISTINCT user_id
    FROM Likes
);
--Find users who have commeented at least on one song
SELECT DISTINCT u.username
FROM Users u
WHERE u.user_id = ANY (
	SELECT DISTINCT c.user_id
	FROM Comments c
	);
--Find users who have commeented at least on one song(using count)
SELECT DISTINCT u.username 
FROM Users u
WHERE(SELECT COUNT(*)
	FROM Comments c
	WHERE c.user_id=u.user_id
	)>0;
--usage of ALL
--find the date of the oldest like, and how many years and months have passed since then
SELECT DISTINCT l.like_date, YEAR(GETDATE())-YEAR(l.like_date) AS years_since_like, MONTH(GETDATE())-MONTH(l.like_date) AS months_since_like
FROM Likes l
WHERE l.like_date >= ALL (
	SELECT like_date
	FROM Likes );
--USING IN
SELECT DISTINCT l.like_date
FROM Likes l
WHERE l.like_date IN (
	SELECT MAX(like_date)
	FROM Likes);

-- Find the most liked song using ALL and TOP
SELECT s.title
FROM Songs s
WHERE s.song_id = ALL (
    SELECT TOP 1 l.song_id
    FROM Likes l
    GROUP BY l.song_id
    ORDER BY COUNT(*) DESC
)
ORDER BY s.title;
--USING AGGREGATION INSTEAD OF ALL
SELECT TOP 1 s.title
FROM Songs s 
INNER JOIN Likes l ON l.song_id=s.song_id
GROUP BY s.title
ORDER BY COUNT(*) DESC


USE YoutubeMusic;
GO
--modify type of a column
CREATE PROCEDURE modify_type_column
AS 
BEGIN
	ALTER TABLE Songs
	ALTER COLUMN title Char(225)
END;
GO
--undo modify type of a column
CREATE PROCEDURE undo_type_column
AS
BEGIN 
	ALTER TABLE Songs
	ALTER COLUMN title VARCHAR(225) NOT NULL
END;
--add a column
GO
CREATE PROCEDURE add_column
AS
BEGIN 
	ALTER TABLE Songs
	ADD likes INT 
END;
--delete a column
GO
CREATE PROCEDURE delete_column
AS
BEGIN 
	ALTER TABLE Songs
	DROP COLUMN likes
END;
--add a default constraint

GO
CREATE PROCEDURE add_default_constraint
AS
BEGIN 
	ALTER TABLE Users
	ADD CONSTRAINT df_registration_date
	DEFAULT GETDATE()
	FOR registration_date
END;
--REMOVE DEFAULT CONSTRAINT
GO
CREATE PROCEDURE remove_default_constraint
AS
BEGIN
	ALTER TABLE Users
	DROP CONSTRAINT df_registration_date
END;
--add a primary key
GO 
CREATE PROCEDURE add_primary_key
AS
BEGIN
	ALTER TABLE Comments
	ADD CONSTRAINT Pk_commentid PRIMARY KEY(comment_id);
END;
--remove primary key
GO 
CREATE PROCEDURE remove_primary_key
AS
BEGIN
	ALTER TABLE comments
	DROP CONSTRAINT Pk_commentid
END
--add a candidate key
GO
CREATE PROCEDURE add_candidate_key
AS
BEGIN
	ALTER TABLE Users
	ADD CONSTRAINT uc_username UNIQUE(username)
END;
--REMOVE CANDIDATE KEY
GO
CREATE PROCEDURE remove_candidate_key
AS
BEGIN
	ALTER TABLE Users
	DROP CONSTRAINT uc_username
END;
--add a foreign key
GO
CREATE PROCEDURE add_foreign_key
AS
BEGIN
	ALTER TABLE Songs
	ADD CONSTRAINT fk_album
	FOREIGN KEY(album_id)
	REFERENCES Albums(album_id)
END;
--remove a foreign key
GO
CREATE PROCEDURE remove_foreign_key
AS
BEGIN 
	ALTER TABLE Songs
	DROP CONSTRAINT fk_album
END;
--create a table
GO
CREATE PROCEDURE create_table
AS
BEGIN
	CREATE TABLE Podcast(
	podcast_id INT NOT NULL PRIMARY KEY,
	userid INT FOREIGN KEY REFERENCES Users(user_id),
	description VARCHAR(225));
END;
--drop a table
GO
CREATE PROCEDURE remove_table
AS
BEGIN 
	DROP TABLE Podcast;
END;

Create Table Versiune(
	nrVersiune INT default 1
);
INSERT INTO Versiune
values(1);

create table proceduresTable (
    fromVersion int,
    toVersion int,
    primary key (fromVersion, toVersion),
    nameProc varchar(max)
)
insert into proceduresTable values (1, 2, 'modify_type_column' )
insert into proceduresTable values (2, 1, 'undo_type_column')
insert into proceduresTable values (2, 3, 'add_column')
insert into proceduresTable values (3, 2, 'delete_column')
insert into proceduresTable values (3, 4, 'add_default_constraint')
insert into proceduresTable values (4, 3, 'remove_default_constraint')
insert into proceduresTable values (4, 5, 'add_primary_key')
insert into proceduresTable values (5, 4, 'remove_primary_key')
insert into proceduresTable values (5, 6, 'add_candidate_key')
insert into proceduresTable values (6, 5, 'remove_candidate_key')
insert into proceduresTable values (6, 7, 'add_foreign_key')
insert into proceduresTable values (7, 6, 'remove_foreign_key')
insert into proceduresTable values (7, 8, 'create_table')
insert into proceduresTable values (8, 7, 'remove_table')
GO
create procedure goToVersion(@newVersion int) as
    declare @curr int
    declare @var varchar(max)
    select @curr=nrVersiune from Versiune

    if @newVersion > (select max(toVersion) from proceduresTable)
        raiserror ('Bad version', 10, 1)

    while @curr > @newVersion begin
        select @var=nameProc from proceduresTable where fromVersion=@curr and toVersion=@curr-1
        exec (@var)
        set @curr=@curr-1
    end

    while @curr < @newVersion begin
        select @var=nameProc from proceduresTable where fromVersion=@curr and toVersion=@curr+1
        exec (@var)
        set @curr=@curr+1
    end

    update Versiune set nrVersiune=@newVersion
EXEC goToVersion @newVersion=1

--verification var 2
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Songs' AND COLUMN_NAME = 'title';
--verification var 3
SELECT *
FROM Songs
--verification var 4
SELECT name
FROM sys.objects
WHERE parent_object_id = OBJECT_ID('Users') AND type_desc = 'DEFAULT_CONSTRAINT';
--verification var 5/6
SELECT name
FROM sys.objects
WHERE parent_object_id = OBJECT_ID('Users') AND type = 'UQ';
--verification var 7
SELECT name
FROM sys.objects
WHERE parent_object_id = OBJECT_ID('Songs') AND type_desc = 'FOREIGN_KEY_CONSTRAINT';
EXEC remove_foreign_key
--verification var 8
SELECT *
FROM Podcast
