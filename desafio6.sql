  SELECT 
    MIN(valor_plano) AS faturamento_minimo,
    MAX(valor_plano) AS faturamento_maximo,
    ROUND(AVG(valor_plano), 2) AS faturamento_medio,
    SUM(valor_plano) AS faturamento_total
    FROM SpotifyClone.plano AS p
    INNER JOIN SpotifyClone.users AS u ON p.plano_id = u.plano_id;