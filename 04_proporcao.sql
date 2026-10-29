CREATE VIEW proporcao AS
SELECT cl.regiao,
ROUND(SUM(B.saldo_devedor), 2) AS saldo_total,
ROUND(SUM(B.perda_esperada), 2) AS perda_total,
ROUND(SUM(B.perda_esperada) / SUM(B.saldo_devedor) * 100, 2) AS proporcao
FROM perda_esperada AS B
INNER JOIN contrato AS ct ON B.contrato_id = ct.id
INNER JOIN clientes AS cl ON ct.cliente_id = cl.id
WHERE mes_referencia = (SELECT MAX(mes_referencia) FROM perda_esperada)
GROUP BY cl.regiao;
