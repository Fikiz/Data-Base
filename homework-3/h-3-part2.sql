-- Create a new (vw_ArtistSongCounts) that will list all artist IDs and count of songs per artist 
CREATE VIEW vw_ArtistSongCounts AS
SELECT artist.id,
	COUNT(song.id) AS SongCount
FROM artist 
JOIN song  ON artist.id = song.artist_id
GROUP BY artist.id;

SELECT * FROM vw_ArtistSongCounts;


-- Change the view to show artist names instead of artist ID
CREATE VIEW vw_ArtistSongCounts2 AS
SELECT artist.name,
COUNT(song.id) AS SongCount
FROM artist
JOIN song ON artist.id = song.artist_id
GROUP BY artist.name;

SELECT * FROM vw_ArtistSongCounts2;

-- List all rows from the view ordered by the biggest song count
SELECT * FROM vw_ArtistSongCounts2
ORDER BY SongCount DESC;

-- Create a new view (vw_ArtistAlbumDetails) that will list all artists (name) and
-- count the albums they have
CREATE VIEW vw_ArtistAlbumDetails AS
SELECT artist.name AS artist_name,
COUNT(album.id) AS AlbumCount
FROM artist
JOIN song ON artist.id = song.artist_id
JOIN album ON song.id = album.id
GROUP BY artist.name;

SELECT * FROM vw_ArtistAlbumDetails;
