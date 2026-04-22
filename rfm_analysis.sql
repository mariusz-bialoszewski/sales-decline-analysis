-- =========================================
-- Customer Segmentation (RFM Analysis)
-- Author: [Twoje imiê]
-- Description: Creates a view with RFM metrics and customer segments
-- =========================================

CREATE VIEW analytics.vw_rfm_segments AS

WITH combined AS (
    SELECT *, '2009-2010' AS source FROM raw.retail_2009
    UNION ALL
    SELECT *, '2010-2011' AS source FROM raw.retail_2010
),

cleaned AS ( 
    SELECT 
        Invoice,
        StockCode,
        Description,
        Country,
        source,
        TRY_CAST(Quantity AS INT) AS Quantity,
        TRY_CAST(REPLACE(Price, ',', '.') AS FLOAT) AS Price,
        TRY_CAST(InvoiceDate AS DATETIME) AS InvoiceDate,
        TRY_CAST(Customer_ID AS INT) AS Customer_ID
    FROM combined
),

filtered AS (
    SELECT 
        *,
        Quantity * Price AS order_value
    FROM cleaned 
    WHERE 
        Customer_ID IS NOT NULL
        AND InvoiceDate IS NOT NULL 
        AND Quantity > 0
        AND Price > 0
        AND Invoice NOT LIKE 'C%'
),

rfm_base AS (
    SELECT 
        Customer_ID,
        MAX(InvoiceDate) AS last_purchase,
        COUNT(DISTINCT Invoice) AS frequency,
        SUM(order_value) AS monetary
    FROM filtered
    GROUP BY Customer_ID
),

max_date AS (
    SELECT MAX(InvoiceDate) AS max_date FROM filtered
),

rfm_final AS (
    SELECT 
        Customer_ID,
        DATEDIFF(day, last_purchase, max_date) AS recency,
        frequency,
        monetary
    FROM rfm_base
    CROSS JOIN max_date
),

rfm_scored AS (
    SELECT 
        Customer_ID,
        recency,
        frequency,
        monetary,
        NTILE(5) OVER (ORDER BY recency DESC) AS R_score,
        NTILE(5) OVER (ORDER BY frequency ASC) AS F_score,
        NTILE(5) OVER (ORDER BY monetary ASC) AS M_score
    FROM rfm_final
),

rfm_segmented AS (
    SELECT 
        Customer_ID,
        recency,
        frequency,
        monetary,
        R_score,
        F_score,
        M_score,
        CASE 
            WHEN R_score >= 4 AND F_score >= 4 AND M_score >= 4 THEN 'Champions'
            WHEN R_score >= 3 AND F_score >= 4 THEN 'Loyal'
            WHEN R_score = 5 AND F_score = 1 THEN 'New'
            WHEN R_score >= 4 AND F_score >= 2 THEN 'Potential'
            WHEN R_score <= 2 AND F_score >= 3 THEN 'At Risk'
            WHEN R_score <= 2 AND F_score <= 2 THEN 'Lost'
            ELSE 'Others'
        END AS segment
    FROM rfm_scored
)

SELECT *
FROM rfm_segmented;

-- Example usage:
-- SELECT segment, COUNT(*) 
-- FROM analytics.vw_rfm_segments
-- GROUP BY segment;