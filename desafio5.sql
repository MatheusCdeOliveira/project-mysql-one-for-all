 SELECT 
    nome_cancao AS cancao,
    COUNT(re.usuario_id) AS reproducoes
    FROM SpotifyClone.cancoes AS c
    INNER JOIN SpotifyClone.historico_reproducoes AS re ON c.cancao_id = re.cancao_id
    GROUP BY c.cancao_id
    ORDER BY reproducoes DESC, cancao ASC
    LIMIT 2;