WITH CarColorRank AS (
    SELECT car, color, COUNT(transaction_id) AS success_count,
           ROW_NUMBER() OVER (PARTITION BY car ORDER BY COUNT(transaction_id) DESC) AS rn
    FROM transactions t
    JOIN cars c ON t.car_id = c.car_id
    GROUP BY car, color
)
SELECT car, color, success_count
FROM CarColorRank
WHERE rn = 1
ORDER BY car;