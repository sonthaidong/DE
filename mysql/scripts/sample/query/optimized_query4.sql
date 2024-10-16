-- more than 200 row(s) fetched - 0.256s (0.044s fetch), on 2024-10-16 at 15:52:24
SELECT
    c.customer_id,
    c.name,
    COALESCE(du.total_data_usage, 0) AS total_data_usage,
    COALESCE(cr.total_call_duration, 0) AS total_call_duration,
    COALESCE(sr.total_sms_sent, 0) AS total_sms_sent,
    p.data_limit,
    p.call_limit,
    p.sms_limit,
    (
        COALESCE(du.total_data_usage, 0) / p.data_limit * 100
    ) AS data_usage_percentage,
    (
        COALESCE(cr.total_call_duration, 0) / (p.call_limit * 60) * 100
    ) AS call_usage_percentage,
    (
        COALESCE(sr.total_sms_sent, 0) / p.sms_limit * 100
    ) AS sms_usage_percentage
FROM
    Customers c
    JOIN Subscriptions s ON c.customer_id = s.customer_id
    JOIN Plans p ON s.plan_id = p.plan_id -- Subquery to aggregate Data_Usage by customer
    LEFT JOIN (
        SELECT
            customer_id,
            SUM(data_used) AS total_data_usage
        FROM
            Data_Usage
        GROUP BY
            customer_id
    ) du ON c.customer_id = du.customer_id -- Subquery to aggregate Call_Records by customer
    LEFT JOIN (
        SELECT
            caller_id,
            SUM(duration) AS total_call_duration
        FROM
            Call_Records
        GROUP BY
            caller_id
    ) cr ON c.customer_id = cr.caller_id -- Subquery to aggregate SMS_Records by customer
    LEFT JOIN (
        SELECT
            sender_id,
            COUNT(sms_id) AS total_sms_sent
        FROM
            SMS_Records
        GROUP BY
            sender_id
    ) sr ON c.customer_id = sr.sender_id
GROUP BY
    c.customer_id,
    c.name,
    p.data_limit,
    p.call_limit,
    p.sms_limit;