
USE ecommerce_funnel;
DESCRIBE events;

#total rows
SELECT COUNT(*) AS total_rows
FROM events;

#event count
SELECT
    event,
    COUNT(*) AS event_count
FROM events
GROUP BY event
ORDER BY event_count DESC;

#Unique visitor by event
SELECT
    event,
    COUNT(DISTINCT visitorid) AS unique_visitors
FROM events
GROUP BY event
ORDER BY
    CASE
        WHEN event = 'view' THEN 1
        WHEN event = 'addtocart' THEN 2
        WHEN event = 'transaction' THEN 3
    END;
    
    
 #funnel using CTE   
    WITH funnel AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event = 'view' THEN visitorid  END) AS viewers,
        COUNT(DISTINCT CASE WHEN event = 'addtocart' THEN visitorid END) AS cart_users,
        COUNT(DISTINCT CASE WHEN event = 'transaction' THEN visitorid END) AS purchasers
    FROM events
)

SELECT *
FROM funnel;


#Conversion rates
WITH funnel AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event = 'view' THEN visitorid END) AS viewers,
        COUNT(DISTINCT CASE WHEN event = 'addtocart' THEN visitorid END) AS cart_users,
        COUNT(DISTINCT CASE WHEN event = 'transaction' THEN visitorid END) AS purchasers
    FROM events
)

SELECT
    viewers,
    cart_users,
    purchasers,

    ROUND(cart_users * 100.0 / viewers,2) AS view_to_cart_conversion,
    ROUND(purchasers * 100.0 / cart_users,2) AS cart_to_purchase_conversion,
    ROUND(purchasers * 100.0 / viewers,2) AS overall_conversion

FROM funnel;

#calculate drop-off
WITH funnel AS (
    SELECT 
		COUNT(DISTINCT CASE WHEN event = 'view' THEN visitorid END) AS viewers,
        COUNT(DISTINCT CASE WHEN event = 'addtocart' THEN visitorid END) AS cart_users,
        COUNT(DISTINCT CASE WHEN event = 'transaction' THEN visitorid
        END) AS purchasers
    FROM events
)

SELECT
    viewers - cart_users AS view_to_cart_dropoff,
    cart_users - purchasers AS cart_to_purchase_dropoff,
    ROUND((viewers - cart_users) * 100.0 / viewers,2) AS view_to_cart_dropoff_pct,
    ROUND((cart_users - purchasers) * 100.0 / cart_users,2) AS cart_to_purchase_dropoff_pct

FROM funnel;



#product level funnel analysis
SELECT
    itemid,
    COUNT(DISTINCT CASE WHEN event = 'view' THEN visitorid END) AS viewers,
    COUNT(DISTINCT CASE WHEN event = 'addtocart' THEN visitorid END) AS cart_users,
    COUNT(DISTINCT CASE WHEN event = 'transaction' THEN visitorid END) AS purchasers

FROM events
GROUP BY itemid
ORDER BY viewers DESC
LIMIT 20;

#product conversion
SELECT
    itemid,

    COUNT(DISTINCT CASE WHEN event = 'view' THEN visitorid END) AS viewers,
    COUNT(DISTINCT CASE WHEN event = 'addtocart' THEN visitorid END) AS cart_users,
    COUNT(DISTINCT CASE WHEN event = 'transaction' THEN visitorid END) AS purchasers,
    ROUND(COUNT(DISTINCT CASE WHEN event = 'addtocart' THEN visitorid END) * 100.0
        /
        NULLIF(COUNT(DISTINCT CASE WHEN event = 'view' THEN visitorid END), 0),2) AS view_to_cart_rate,

    ROUND(COUNT(DISTINCT CASE WHEN event = 'transaction' THEN visitorid END) * 100.0
        /
        NULLIF(COUNT(DISTINCT CASE WHEN event = 'addtocart' THEN visitorid END), 0),2) AS cart_to_purchase_rate

FROM events
GROUP BY itemid
HAVING viewers >= 100
ORDER BY view_to_cart_rate DESC;


#product with high traffic but poor conversion
SELECT
    itemid,
    COUNT(DISTINCT CASE WHEN event = 'view' THEN visitorid END) AS viewers,
    COUNT(DISTINCT CASE WHEN event = 'addtocart' THEN visitorid END) AS cart_users,
    ROUND(COUNT(DISTINCT CASE WHEN event = 'addtocart' THEN visitorid END) * 100.0
        /
        NULLIF(COUNT(DISTINCT CASE WHEN event = 'view' THEN visitorid END), 0),2) AS view_to_cart_rate

FROM events
GROUP BY itemid
HAVING viewers >= 100
ORDER BY viewers DESC, view_to_cart_rate ASC
LIMIT 20;
