CREATE VIEW perda_esperada AS
SELECT A.contrato_id,
A.mes_referencia,
A.saldo_devedor,
B.pd,
B.lgd,
CAST(A.saldo_devedor * B.pd * B.lgd AS NUMERIC (12,2)) AS perda_esperada
FROM posicao_mensal AS A
INNER JOIN risco_modelo AS B ON A.contrato_id = B.contrato_id;
