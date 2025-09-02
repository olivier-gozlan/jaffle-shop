WITH local_sales AS (
    SELECT *
    FROM {{ ref('stg_local_sales') }}
),

group_sales AS (
    SELECT *
    FROM {{ ref('stg_crf_sales_group_data') }}
)

SELECT
    l.sub_category,
    SUM(l.ca) AS local_revenue,
    SUM(g.CA) AS group_revenue,
    SUM(l.ca) - SUM(g.CA) AS difference
FROM local_sales l
JOIN group_sales g
    ON l.sub_category = g.pdt_SUB_CATEGORY
GROUP BY l.sub_category
ORDER BY l.sub_category