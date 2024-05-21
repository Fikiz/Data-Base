-- Calculate the count of all songs in the system
SELECT COUNT(*) song
FROM song;

-- Calculate the count of all songs per artists in the system
SELECT artist.id, artist.name, COUNT(song.id) AS song_count
FROM artist
LEFT JOIN song ON artist.id = song.artist_id
GROUP BY artist.id, artist.name;

-- Calculate the count of all songs per artist in the system for first 100 albums (ID < 100)
SELECT artist.id, artist.name, COUNT(song.id) AS song_count
FROM artist
LEFT JOIN song ON artist.id = song.artist_id
LEFT JOIN album ON song.id = album.id
WHERE album.id < 100
GROUP BY artist.id, artist.name;

-- Find the maximal duration and the average duration per song for each artist
SELECT 
    artist.id,
    artist.name,
    MAX(song.duration) AS max_duration,
    AVG(song.duration) AS avg_duration
FROM artist
LEFT JOIN song ON artist.id = song.artist_id 
GROUP BY artist.id, artist.name; 

-- Calculate the count of all songs per artist in the system and filter onnly song count greater than 10
SELECT  artist.id, artist.name,
COUNT(song.id) AS song_count  
FROM artist
LEFT JOIN song ON artist.id = song.artist_id
GROUP BY artist.id, artist.name
HAVING 
COUNT(song.id) > 10;

-- #Calculate the count of all songs per artist in the system for first 100 albums
-- (ID < 100) and filter artists with more than 10 song count

SELECT  ar.name, 
COUNT(s.id) AS song_count
FROM artist ar
JOIN song s ON ar.id = s.artist_id
JOIN album al ON s.album_id = al.id
WHERE al.id < 100
GROUP BY ar.name
HAVING COUNT(s.id) > 10
ORDER BY song_count DESC;


