-- List all customers with their subscriptions
SELECT
    c.name AS customer_name,
    p.name AS plan_name,
    s.start_date,
    s.end_date
FROM
    Customers c
    JOIN Subscriptions s ON c.customer_id = s.customer_id
    JOIN Plans p ON s.plan_id = p.plan_id;

-- Get total call duration by customer
SELECT
    c.name AS customer_name,
    SUM(cr.duration) AS total_duration
FROM
    Customers c
    JOIN Call_Records cr ON c.customer_id = cr.caller_id
GROUP BY
    c.name;

-- Find all unpaid bills
SELECT
    c.name,
    b.billing_date,
    b.amount
FROM
    Customers c
    JOIN Billing b ON c.customer_id = b.customer_id
WHERE
    b.status = 'unpaid';