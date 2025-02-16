# 🎵 Spotify Advanced SQL Project

![spotify_logo](https://github.com/user-attachments/assets/f18951d7-3130-49f8-aa5c-f7ee23ba5b46)

### 📌 Analyzing Spotify tracks using SQL queries for data insights.

#### 1. 📌 Overview
This project explores a Spotify dataset containing details about tracks, albums, and artists. The primary goal is to apply SQL queries for data extraction, aggregation, and pattern identification.
```
sql

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
```


#### 2. 🚀 Objectives
a. Explore and understand the dataset.

b. Perform SQL queries of varying complexity (easy & medium levels).

c. Derive insights using aggregation and joins.



#### 3. 📂 Dataset Description
The dataset consists of the following attributes:

🎤 artist: The performer of the track.

🎵 track: The song name.

💽 album: The album name.

📊 album_type: Whether it’s a single or album.

🔥 danceability, energy, loudness, tempo: Track audio characteristics.

🎥 views, likes, comments: YouTube engagement metrics.

📡 streams: Spotify streaming data.


#### 4. 🔍 Project Steps

##### 1️⃣ Data Exploration
a. Understand the dataset structure and attributes.
b. Identify key columns such as artist, track, album, danceability, energy, views, likes, etc.

##### 2️⃣ Database Setup & Schema Creation
a. Create a normalized database from a denormalized dataset.
b. Define a Spotify table with appropriate data types.
c. Insert sample data into the table for analysis.


##### 3️⃣ SQL Querying - Retrieving Insights
🔹 Easy Level Queries

a. Retrieve the names of all tracks that have more than 1 billion streams.
```
sql

SELECT track, streams 
FROM spotify 
WHERE streams > 1000000000;

```

b. List all albums along with their respective artists.
```
sql

SELECT DISTINCT album, artist 
FROM spotify;

```

c. Get the total number of comments for tracks where licensed = TRUE.
```
sql

SELECT SUM(comments) AS total_comments 
FROM spotify 
WHERE licensed = TRUE;
```

d. Find all tracks that belong to the album type ‘Single’.
```
sql

SELECT track, album 
FROM spotify 
WHERE album_type = 'single';
```

e. Count the total number of tracks by each artist.
```
sql

SELECT artist, COUNT(track) AS total_tracks 
FROM spotify 
GROUP BY artist 
ORDER BY total_tracks DESC;

```

🔹 Medium Level Queries

a. Calculate the average danceability of tracks in each album.
```
sql

SELECT album, AVG(danceability) AS avg_danceability 
FROM spotify 
GROUP BY album;

```

b. Find the top 5 tracks with the highest energy values.
```
sql

SELECT track, energy 
FROM spotify 
ORDER BY energy DESC 
LIMIT 5;
```

c. List all tracks along with their views and likes where official_video = TRUE.
```
sql

SELECT track, views, likes 
FROM spotify 
WHERE official_video = TRUE 
ORDER BY views DESC;
```

d. For each album, calculate the total views of all associated tracks.
```
sql

SELECT album, SUM(views) AS total_views 
FROM spotify 
GROUP BY album 
ORDER BY total_views DESC;
```

e. Retrieve track names that have been streamed more on Spotify than YouTube.
```
sql

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
```


#### 5. 📈 Insights & Findings
a. 🔥 Track Popularity: The most streamed track has over 1 billion plays.

b. 🎧 Album Analysis: Some albums have higher engagement than singles.

c. 📊 Energy & Danceability: Songs with higher energy tend to have more views.

d. 📢 Streaming Trends: Some tracks perform better on Spotify than YouTube.


#### 🛠 6. Technology Stack
a. Database: PostgreSQL

b. SQL Tools: pgAdmin 4 / DBeaver

c. Query Types: Joins, Aggregations, Filtering, Grouping



#### 🎯 7. Conclusion
This project demonstrates the power of SQL in analyzing music data, providing key insights into track popularity, engagement, and streaming trends.


