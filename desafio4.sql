  SELECT
    DISTINCT CONCAT(nome_usuario, " ", sobrenome_usuario) AS usuario,
     IF(MAX(YEAR(re.data_reproducao)) >= 2021, "Usuário ativo", "Usuário inativo") AS status_usuario
    FROM SpotifyClone.users AS user
    INNER JOIN SpotifyClone.historico_reproducoes AS re ON user.usuario_id = re.usuario_id
    GROUP BY user.usuario_id
    ORDER BY usuario;