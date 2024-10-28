UPDATE workers
SET wages = wages * 1.10
WHERE worker_id IN (
    SELECT worker_id
    FROM transactions
    GROUP BY worker_id
    ORDER BY COUNT(transaction_id) DESC
    LIMIT 3
);