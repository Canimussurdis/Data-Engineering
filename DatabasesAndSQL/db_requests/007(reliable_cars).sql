-- SELECT car, COUNT(transaction_id) AS service_visits
-- FROM transactions t
-- JOIN cars c ON t.car_id = c.car_id
-- GROUP BY car
-- ORDER BY COUNT(transaction_id) ASC;

WITH CarServiceCount AS (
    SELECT car, COUNT(transaction_id) AS service_visits
    FROM transactions t
    JOIN cars c ON t.car_id = c.car_id
    GROUP BY car
)
SELECT car,
       RANK() OVER (ORDER BY service_visits ASC) AS reliability_rank -- чем меньше, тем надежнее
FROM CarServiceCount
ORDER BY reliability_rank;