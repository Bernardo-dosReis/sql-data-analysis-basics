-- Criação das Tabelas

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    state VARCHAR(2),
    signup_date DATE
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    amount NUMERIC(10, 2),
    transaction_type VARCHAR(20),
    transaction_date DATE
);

-- 2. Dados de Teste
INSERT INTO customers VALUES
(1, 'Alice Silva', 'SP', '2025-01-10'),
(2, 'Bruno Costa', 'RJ', '2025-01-15'),
(3, 'Carla Mendes', 'MG', '2025-02-01'),
(4, 'Diego Lima', 'SP', '2025-02-10'),
(5, 'Eduarda Rocha', 'PR', '2025-03-05');

INSERT INTO transactions VALUES
(101, 1, 150.00, 'pix', '2025-01-12'),
(102, 1, 80.00, 'card', '2025-01-20'),
(103, 1, 300.00, 'pix', '2025-02-05'),
(104, 2, 50.00, 'card', '2025-01-18'),
(105, 2, 120.00, 'pix', '2025-02-15'),
(106, 3, 200.00, 'card', '2025-02-10'),
(107, 4, 1200.00, 'pix', '2025-02-14'),
(108, 4, 450.00, 'card', '2025-02-28');
