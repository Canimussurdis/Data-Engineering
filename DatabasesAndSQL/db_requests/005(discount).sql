CREATE TABLE discounts (
    discount_id SERIAL PRIMARY KEY,
    discount_percentage DECIMAL(5, 2) NOT NULL
);

ALTER TABLE clients
ADD COLUMN discount_id INTEGER REFERENCES discounts(discount_id);

INSERT INTO discounts (discount_percentage)
VALUES (10.00), (15.00), (20.00);

UPDATE clients
SET discount_id = (
    SELECT discount_id
    FROM discounts
    WHERE discount_percentage = 20.00
)
WHERE client_id IN (
    SELECT client_id
    FROM transactions
    GROUP BY client_id
    ORDER BY COUNT(transaction_id) DESC
    LIMIT 5
);

UPDATE clients
SET discount_id = (
    SELECT discount_id
    FROM discounts
    WHERE discount_percentage = 15.00
)
WHERE client_id IN (
    SELECT client_id
    FROM transactions
    GROUP BY client_id
    ORDER BY COUNT(transaction_id) DESC
    OFFSET 5 LIMIT 5
);

UPDATE clients
SET discount_id = (
    SELECT discount_id
    FROM discounts
    WHERE discount_percentage = 10.00
)
WHERE client_id IN (
    SELECT client_id
    FROM transactions
    GROUP BY client_id
    ORDER BY COUNT(transaction_id) DESC
    OFFSET 10 LIMIT 10
);


INSERT INTO discounts (discount_percentage)
VALUES (0.00);

UPDATE clients
SET discount_id = (
    SELECT discount_id
    FROM discounts
    WHERE discount_percentage = 0.00
)
WHERE discount_id IS NULL;