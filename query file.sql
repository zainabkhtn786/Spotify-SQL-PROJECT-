-- Adavanced SQL Project -- Spotify 

-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
select * from spotify;

-- -----------------------------------------
--      DATA ANALYSIS(Easy Level Queries) --
-- -----------------------------------------

-- 1.Retrieve the names of all tracks that have more than 1 billion streams.
SELECT track, stream
FROM spotify 
WHERE stream > 1000000000;


-- 2.List all albums along with their respective artists.
SELECT DISTINCT album, artist 
FROM spotify;


-- 3.Get the total number of comments for tracks where licensed = TRUE.
SELECT SUM(comments) AS total_comments 
FROM spotify 
WHERE licensed = TRUE;


-- 4.Find all tracks that belong to the album type single.
SELECT track, album 
FROM spotify 
WHERE album_type = 'single';


-- 5.Count the total number of tracks by each artist
SELECT artist, COUNT(track) AS total_tracks 
FROM spotify 
GROUP BY artist 
ORDER BY total_tracks DESC;

-- ---------------------------------
--    Medium Level Queries --
-- ----------------------------------

-- 6.Calculate the average danceability of tracks in each album.
SELECT album, AVG(danceability) AS avg_danceability 
FROM spotify 
GROUP BY album;


-- 7.Find the top 5 tracks with the highest energy values.
SELECT track, energy 
FROM spotify 
ORDER BY energy DESC 
LIMIT 5;

-- 8.List all tracks along with their views and likes where official_video = TRUE.
SELECT track, views, likes 
FROM spotify 
WHERE official_video = TRUE 
ORDER BY views DESC;

-- 9.For each album, calculate the total views of all associated tracks.
SELECT album, SUM(views) AS total_views 
FROM spotify 
GROUP BY album 
ORDER BY total_views DESC;


-- 10.Retrieve the track names that have been streamed on Spotify more than YouTube.

SELECT * 
FROM (
    SELECT 
        track,
        COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream END), 0) AS streamed_on_youtube,
        COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END), 0) AS streamed_on_spotify
    FROM spotify
    GROUP BY track
) AS t1
WHERE streamed_on_spotify > streamed_on_youtube;







