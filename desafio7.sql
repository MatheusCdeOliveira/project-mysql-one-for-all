SELECT
DISTINCT nome_artista AS artista,
al.nome_album AS album,
COUNT(s.artista_id) AS seguidores
FROM
SpotifyClone.artista AS ar
INNER JOIN SpotifyClone.album AS al ON ar.artista_id = al.artista_id
INNER JOIN SpotifyClone.seguindo_artistas AS s ON ar.artista_id = s.artista_id
GROUP BY nome_artista, nome_album
ORDER BY seguidores DESC, artista ASC, album ASC;