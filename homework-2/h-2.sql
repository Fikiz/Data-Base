
-- PART 1

-- Show all details for artist born before 01-04-1992
SELECT * from artist_details
WHERE date_of_birth > '01.04.1992';

-- Show all details for artists from Germany
SELECT * FROM artist_details
WHERE country = 'Germany';

-- Show all songs longer than 4 minutes
SELECT * FROM song
WHERE duration > '4';

-- Show all explicit songs
SELECT * FROM song
WHERE explicit = true;

-- Show all genres having ‘o’ in the name
SELECT * FROM genre
WHERE name LIKE '%0%';

-- Show all lyrics having the word ‘that
SELECT * FROM song_lyrics
WHERE lyrics LIKE '%that%';



-- PART - 2

-- Show all details from artists that have ‘e’ in their full name, ordered by date of
--            birth by the oldest one to the youngest one
SELECT * FROM artist_details
WHERE full_name LIKE '%e%'
ORDER BY date_of_birth ASC;

-- Show all non-explicit songs sorted by duration from shortest to longest
SELECT * FROM song
WHERE explicit = false
ORDER BY duration ASC;

-- Show albums that have ‘u’ in their name sorted by rating, with worst rating on
SELECT * FROM album
WHERE name LIKE  '%u%'
ORDER BY rating ASC;



-- PART 3

-- List all artist names and artist full names without duplicates
SELECT "name" FROM artist
UNION
SELECT full_name FROM artist_details;

-- List all artist names and artist full names with duplicates
SELECT "name" FROM artist
UNION ALL
SELECT full_name FROM artist_details;

	
-- PART 4

-- Show all album names and it`s rating
SELECT name,rating FROM album;

-- Show all artists with their name and full name side by side
SELECT artist.name, artist_details.full_name
FROM artist
JOIN artist_details ON artist.id = artist_details.artist_id;

-- Show all songs with their lyrics side by side
SELECT song.name, song_lyrics.lyrics
FROM song
JOIN song_lyrics ON song.id = song_lyrics.song_id;


-- PART 5

--  Show artist names with album names side by side
SELECT artist.name AS artist_name, album.name AS album_name
FROM artist
JOIN album ON artist.id = album.id;

--  Show the artist names and their spouse name for all artist including ones that dont`t have details
SELECT artist.name AS artist_name, artist_details.spouse_name
FROM artist
JOIN artist_details ON artist.id = artist_details.artist_id;

--  Show artist names and list of countries for all, including missing artist and missing details info
SELECT artist.name AS artist_name, artist_details.country
FROM artist
JOIN artist_details ON artist.id = artist_details.artist_id;

-- PART 6
--  List all song names with genre names
SELECT song.name AS song_name, genre.name AS genre_name
FROM song
JOIN genre ON song.id = genre.id;

--  List all song names with playlist names
SELECT song.name AS song_name, playlist.title AS playlist_title
FROM song 
JOIN playlist ON song.id = playlist.id
	
--  List all album names and rating that have rating above 4 with the artist name
SELECT album.name AS album_name, album.rating, artist.name AS artist_name
FROM album
JOIN artist ON album.name = artist.name
WHERE album.rating > 4;

--  List all explicit song names and artist names without missing data
SELECT song.name AS song_name, artist.name AS artist_name
FROM song
JOIN artist ON song.artist_id = artist.id
WHERE song.explicit = TRUE 
AND song.name IS NOT NULL 
AND artist.name IS NOT NULL;



