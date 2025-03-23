-- SORU 1 ---------------------------------------------
SELECT COUNT(*) As fatura_adedi
FROM invoice
WHERE billing_country = 'USA'
	AND EXTRACT(YEAR FROM invoice_date) = 2009;
-------------------------------------------------------

-- SORU 2 ---------------------------------------------
SELECT T.track_id, T.name as parca_adi, P.name as playlist_adi
FROM track as T, playlist as P, playlisttrack as PT
WHERE PT.track_id = T.track_id AND PT.playlist_id = P.playlist_id
ORDER BY T.track_id;
-------------------------------------------------------

-- SORU 3 ---------------------------------------------
SELECT T.name as parca_adi, T.milliseconds/1000 as süre_sn, AR.name as sanatci
FROM track as T
JOIN album as A ON T.album_id = A.album_id
JOIN artist as AR ON A.artist_id = AR.artist_id
WHERE A.title = 'Let There Be Rock'
ORDER BY T.milliseconds DESC; 
-------------------------------------------------------
