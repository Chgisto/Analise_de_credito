CREATE VIEW faixa_atraso AS
SELECT
ROUND(SUM(A.saldo_devedor), 2) AS divida_total,
ROUND(SUM(B.perda_esperada), 2) AS total_perda,
ROUND(SUM(B.perda_esperada) / SUM(A.saldo_devedor) * 100, 2) AS proporcao,
CASE
WHEN A.dias_atraso = 0 THEN 'EM DIA'
WHEN A.dias_atraso <= 30 THEN '1-30 Dias'
WHEN A.dias_atraso <= 90 THEN '31-90 Dias'
ELSE '90-+ Dias'
END AS faixa_atraso
FROM posicao_mensal AS A
INNER JOIN perda_esperada AS B ON A.contrato_id = B.contrato_id
WHERE A.mes_referencia = (SELECT MAX(mes_referencia) FROM posicao_mensal)
AND B.mes_referencia = (SELECT MAX(mes_referencia) FROM perda_esperada)
GROUP BY faixa_atraso;
