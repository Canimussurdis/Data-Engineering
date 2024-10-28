DROP VIEW IF EXISTS director_report;
CREATE VIEW director_report AS
WITH LastMonthTransactions AS (
    SELECT
        service_id,
        COUNT(transaction_id) AS total_orders,
        SUM(payment) AS total_earned,
        SUM(w.wages) AS total_wages
    FROM transactions t
    JOIN workers w ON t.worker_id = w.worker_id
    WHERE t.date >= (SELECT MAX(date) FROM transactions) - INTERVAL '1 month'
    GROUP BY service_id
)
SELECT
    CONCAT(s.service, ' - ', s.service_addr) AS branch,
    lmt.total_orders,
    lmt.total_earned,
    lmt.total_earned - lmt.total_wages AS net_earnings
FROM LastMonthTransactions lmt
JOIN services s ON lmt.service_id = s.service_id;

-- DROP VIEW IF EXISTS director_report;
-- CREATE VIEW director_report AS
-- WITH LastMonthTransactions AS (
--     SELECT
--         service_id,
--         COUNT(transaction_id) AS total_orders,
--         SUM(payment) AS total_earned,
--         SUM(w.wages) AS total_wages
--     FROM transactions t
--     JOIN workers w ON t.worker_id = w.worker_id
--     WHERE t.date >= CURRENT_DATE - INTERVAL '1 month'
--     GROUP BY service_id
-- )
-- SELECT
--     CONCAT(s.service, ' - ', s.service_addr) AS branch,
--     lmt.total_orders,
--     lmt.total_earned,
--     lmt.total_earned - lmt.total_wages AS net_earnings
-- FROM LastMonthTransactions lmt
-- JOIN services s ON lmt.service_id = s.service_id;