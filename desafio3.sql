   SELECT 
    CONCAT(nome_usuario, " ", sobrenome_usuario) AS usuario,
    COUNT(re.usuario_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(c.duracao_segundos / 60), 2)AS total_minutos
    FROM SpotifyClone.users as user
    INNER JOIN SpotifyClone.historico_reproducoes AS re ON user.usuario_id = re.usuario_id
    INNER JOIN SpotifyClone.cancoes AS c ON c.cancao_id = re.cancao_id
    GROUP BY user.usuario_id
    ORDER BY user.nome_usuario;