-- more than 200 row(s) fetched - 5m 59s (0.008s fetch), on 2024-10-16 at 15:32:05
SELECT
    c.customer_id,
    c.name,
    SUM(du.data_used) AS total_data_usage,
    SUM(cr.duration) AS total_call_duration,
    COUNT(sr.sms_id) AS total_sms_sent,
    p.data_limit,
    p.call_limit,
    p.sms_limit,
    (SUM(du.data_used) / p.data_limit * 100) AS data_usage_percentage,
    (SUM(cr.duration) / (p.call_limit * 60) * 100) AS call_usage_percentage,
    (COUNT(sr.sms_id) / p.sms_limit * 100) AS sms_usage_percentage
FROM
    Customers c
    JOIN Subscriptions s ON c.customer_id = s.customer_id
    JOIN Plans p ON s.plan_id = p.plan_id
    LEFT JOIN Data_Usage du ON c.customer_id = du.customer_id
    LEFT JOIN Call_Records cr ON c.customer_id = cr.caller_id
    LEFT JOIN SMS_Records sr ON c.customer_id = sr.sender_id
GROUP BY
    c.customer_id,
    c.name,
    p.data_limit,
    p.call_limit,
    p.sms_limit;