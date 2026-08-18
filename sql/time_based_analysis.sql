USE ecommerce_funnel;

#Transactions over time
SELECT
    DATE(FROM_UNIXTIME(timestamp)) AS transaction_date,
    COUNT(DISTINCT transactionid) AS total_transactions
FROM events
WHERE transactionid IS NOT NULL
GROUP BY DATE(FROM_UNIXTIME(timestamp))
ORDER BY transaction_date;


#monthly transaction trends
SELECT
    DATE_FORMAT(FROM_UNIXTIME(timestamp), '%Y-%m') AS month,
    COUNT(DISTINCT transactionid) AS total_transactions
FROM events
WHERE transactionid IS NOT NULL
GROUP BY DATE_FORMAT(FROM_UNIXTIME(timestamp), '%Y-%m')
ORDER BY month;


#monthly customer activity
SELECT
    DATE_FORMAT(FROM_UNIXTIME(timestamp), '%Y-%m') AS month,
    COUNT(DISTINCT visitorid) AS active_customers,
    COUNT(*) AS total_events
FROM events
GROUP BY DATE_FORMAT(FROM_UNIXTIME(timestamp), '%Y-%m')
ORDER BY month;


#peak transaction peaks
SELECT
    DATE(FROM_UNIXTIME(timestamp)) AS transaction_date,
    COUNT(DISTINCT transactionid) AS total_transactions
FROM events
WHERE transactionid IS NOT NULL
GROUP BY DATE(FROM_UNIXTIME(timestamp))
ORDER BY total_transactions DESC
LIMIT 10;


#time of day analysis
SELECT
    HOUR(FROM_UNIXTIME(timestamp)) AS hour_of_day,
    COUNT(DISTINCT transactionid) AS total_transactions
FROM events
WHERE transactionid IS NOT NULL
GROUP BY HOUR(FROM_UNIXTIME(timestamp))
ORDER BY total_transactions DESC;


#customer behaivor over time
SELECT
    DATE_FORMAT(FROM_UNIXTIME(timestamp), '%Y-%m') AS month,
    COUNT(DISTINCT visitorid) AS unique_visitors,
    COUNT(DISTINCT CASE
        WHEN transactionid IS NOT NULL THEN visitorid
    END) AS purchasing_customers
FROM events
GROUP BY DATE_FORMAT(FROM_UNIXTIME(timestamp), '%Y-%m')
ORDER BY month;

