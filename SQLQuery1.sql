--Some exercises may have been removed because I didn't know how to comment yet!
--But I promise I did them all. ^^;;
SELECT DISTINCT a.ArtistName
  FROM Artist a
       LEFT JOIN Album b on a.id = b.ArtistId
       LEFT JOIN Genre g on g.id = b.GenreId
        WHERE (g.Label = 'Jazz' OR g.Label = 'Rock');

SELECT b.Title
FROM Album b
LEFT JOIN Song s on s.AlbumId = b.id
WHERE s.Id IS NULL;

SELECT
    *
FROM Album b
    LEFT JOIN Song s ON s.AlbumId = b.Id 
    LEFT JOIN Artist a ON s.ArtistId = a.Id
    WHERE b.Title = 'Wish You Were Here';

SELECT AlbumId, COUNT(*)
AS NumberOfSongs
FROM Song
GROUP BY (AlbumId);

SELECT ArtistId, COUNT(*)
AS NumberOfSongs
FROM Song
GROUP BY (ArtistId);

SELECT GenreId, COUNT(*)
AS NumberOfSongs
FROM Song
GROUP BY (GenreId);

SELECT
    a.ArtistName, COUNT(DISTINCT b.Label)
    FROM Artist a
    LEFT JOIN Album b ON b.ArtistId = a.id
    GROUP BY a.ArtistName
    HAVING COUNT(DISTINCT b.Label) >1;

SELECT Title, AlbumLength
    FROM Album
    WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album);

SELECT s.Title, SongLength, b.Title
    FROM Song s
    LEFT JOIN Album b ON b.Id = s.AlbumId
    WHERE SongLength = (SELECT MAX(SongLength) FROM Song);
