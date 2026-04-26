CREATE VIEW vw_sales_dashboard AS
WITH base AS (
    SELECT
        oi.order_id,
        c.customer_unique_id,
        FORMAT(o.order_purchase_timestamp, 'yyyy-MM') AS rok_miesiac,
        ct.product_category_name_english AS category,
        CAST(oi.price AS float) AS price
    FROM dbo.order_items oi
    JOIN dbo.orders o 
        ON oi.order_id = o.order_id
    JOIN dbo.customers c 
        ON o.customer_id = c.customer_id
    JOIN dbo.products p 
        ON oi.product_id = p.product_id
    JOIN dbo.category_translation ct 
        ON p.product_category_name = ct.product_category_name
    WHERE o.order_status = 'delivered'
),
order_level AS (
    SELECT
        order_id,
        customer_unique_id,
        rok_miesiac,
        category,
        SUM(price) AS order_revenue
    FROM base
    GROUP BY order_id, customer_unique_id, rok_miesiac, category
)

SELECT
    rok_miesiac,
    category,
    COUNT(DISTINCT order_id) AS number_of_orders,
    COUNT(DISTINCT customer_unique_id) AS number_of_customers,
    SUM(order_revenue) AS total_revenue,
    AVG(order_revenue) AS AOV,
    CAST(COUNT(DISTINCT order_id) AS float) 
        / COUNT(DISTINCT customer_unique_id) AS orders_per_customer
FROM order_level
GROUP BY rok_miesiac, category;
