 SELECT
 COUNT(u.usuario_id) AS quantidade_musicas_no_historico
 FROM SpotifyClone.users AS u
 INNER JOIN SpotifyClone.historico_reproducoes AS re ON u.usuario_id = re.usuario_id
 WHERE nome_usuario = "Barbara"
 GROUP BY u.usuario_id;