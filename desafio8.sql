SELECT
 nome_artista AS artista,
 al.nome_album AS album
 FROM SpotifyClone.artista AS ar
 INNER JOIN SpotifyClone.album AS al ON ar.artista_id = al.artista_id
 WHERE nome_artista = "Elis Regina";