CREATE VIEW top10_risco AS
SELECT
A.saldo_devedor,
A.dias_atraso,
B.perda_esperada,
B.contrato_id,
C.regiao
FROM perda_esperada AS B
INNER JOIN posicao_mensal AS A ON A.contrato_id = B.contrato_id
AND A.mes_referencia = B.mes_referencia
INNER JOIN clientes AS C ON C.id = B.cliente_id
WHERE A.mes_referencia = (SELECT MAX(mes_referencia) FROM posicao_mensal)
ORDER BY perda_esperada DESC
LIMIT 10;
