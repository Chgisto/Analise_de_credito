TRUNCATE clientes RESTART IDENTITY CASCADE;

INSERT INTO clientes (nome, regiao)
SELECT 'Cliente ' || g,
(ARRAY['Sul','Sudeste','Nordeste','Norte','Centro-Oeste'])[1 + floor(random()*5)::int]
FROM generate_series(1,100) g;

INSERT INTO contrato (cliente_id, produto, valor_original, data_inicio)
SELECT id,
(ARRAY['Crédito pessoal','Financiamento','Cartão'])[1 + floor(random()*3)::int],
round((5000 + random()*45000)::numeric, 2),
DATE '2026-01-01' + floor(random()*60)::int
FROM clientes;

INSERT INTO posicao_mensal (contrato_id, mes_referencia, saldo_devedor, dias_atraso)
SELECT c.id,
(DATE '2026-03-01' + i * INTERVAL '1 month')::date,
round(c.valor_original * (1 - 0.05*(i+1)), 2),
(ARRAY[0,0,0,5,15,30,60])[1 + floor(random()*7)::int]
FROM contrato c, generate_series(0,2) i;

INSERT INTO risco_modelo (contrato_id, pd, lgd)
SELECT id,
round((0.01 + random()*0.29)::numeric, 4),
round((0.30 + random()*0.30)::numeric, 4)
FROM contrato;
