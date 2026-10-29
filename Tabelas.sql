1- Criando Tabelas

clientes:
 id, nome, regiao
 1, 'Ana', 'Sul'

contratos:
id, cliente_id, produto, valor_original, data_inicio
1, 1, Crédito pessoal', 12000, '2026-03-10'

posicao_mensal:

contrato_id, mes_referencia, saldo_devedor, dias_atraso

1, '2026-10-01', 10000, 0



risco_modelo: 

contrato_id, pd, lgd
 1, 0.05, 0.40
