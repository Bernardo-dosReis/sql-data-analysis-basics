-- 1. Filtro
-- Objetivo: Ver transações via PIX maiores que R$ 100,00

SELECT 
    transaction_id,
    customer_id,
    amount,
    transaction_date
FROM transactions
WHERE transaction_type = 'pix' AND amount > 100.00
ORDER BY amount DESC;

-- 2. Agregação com GROUP BY
-- Objetivo: Calcular o total gasto e quantidade de compras por cliente

SELECT 
    customer_id,
    COUNT(transaction_id) AS total_transactions,
    SUM(amount) AS total_spent,
    AVG(amount) AS avg_ticket
FROM transactions
GROUP BY customer_id
ORDER BY total_spent DESC;

-- 3. Junção de tabelas com LEFT JOIN
-- Objetivo: Ver o nome do cliente e total gasto 

SELECT 
    c.name,
    c.state,
    COUNT(t.transaction_id) AS total_transactions,
    COALESCE(SUM(t.amount), 0.00) AS total_spent
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name, c.state
ORDER BY total_spent DESC;

-- 4. Categprização Condicional com CASE WHEN
-- Objetivo: Classificar clientes pelo nível de gasto

SELECT 
    c.name,
    COALESCE(SUM(t.amount), 0.00) AS total_spent,
    CASE 
        WHEN SUM(t.amount) >= 1000 THEN 'High Value'
        WHEN SUM(t.amount) >= 200 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_tier
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name;

-- 5. Ranking com window function (DENSE_RANK)
-- Objetivo: Descobrir qual foi a maior compra de cada cliente

WITH ranked_transactions AS (
    SELECT 
        customer_id,
        transaction_id,
        amount,
        transaction_date,
        DENSE_RANK() OVER (
            PARTITION BY customer_id 
            ORDER BY amount DESC
        ) AS rank_order
    FROM transactions
)
SELECT 
    customer_id,
    transaction_id,
    amount,
    transaction_date
FROM ranked_transactions
WHERE rank_order = 1;
