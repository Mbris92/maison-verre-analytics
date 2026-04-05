-- ================================================
-- Maison Verre Client Intelligence Report
-- ================================================

-- Result Set 1: Client Spend Summary
WITH client_spend AS (
    SELECT 
        client_id, 
        SUM(unit_price * quantity) AS total_spend
    FROM sales
    GROUP BY client_id
),
client_rank AS (
    SELECT 
        client_id, 
        total_spend, 
        RANK() OVER (ORDER BY total_spend DESC) AS spend_rank
    FROM client_spend
)
SELECT 
    c.first_name,
    c.last_name,
    c.tier,
    cr.total_spend,
    cr.spend_rank,
    CASE
        WHEN cr.total_spend >= 5000 THEN 'High Spender'
        WHEN cr.total_spend BETWEEN 2000 AND 4999 THEN 'Mid Spender'
        WHEN cr.total_spend < 2000 THEN 'Low Spender'
        ELSE 'None'
    END AS spend_segment,
    CASE
        WHEN c.tier = 'Elite' AND cr.total_spend < 2000 THEN 'Tier Review'
        WHEN c.tier = 'Standard' AND cr.total_spend > 4000 THEN 'Tier Review'
        ELSE 'Aligned'
    END AS tier_flag
FROM client_rank AS cr
JOIN clients AS c ON c.client_id = cr.client_id
ORDER BY cr.total_spend DESC;

-- Result Set 2: Clients With No Purchases
SELECT 
    c.first_name,
    c.last_name,
    c.tier,
    c.city,
    c.country
FROM clients AS c
LEFT JOIN sales AS s ON c.client_id = s.client_id
WHERE s.transaction_id IS NULL;

-- Result Set 3: Category Performance
SELECT 
    category, 
    SUM(unit_price * quantity) AS total_revenue, 
    COUNT(transaction_id) AS transaction_count, 
    ROUND(AVG(unit_price * quantity), 2) AS avg_transaction_value
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Result Set 4: Above-Average Transactions
SELECT 
    transaction_id, 
    product_name, 
    category, 
    (unit_price * quantity) AS total_revenue
FROM sales
WHERE (unit_price * quantity) > (SELECT AVG(unit_price * quantity) FROM sales)
ORDER BY total_revenue DESC;
