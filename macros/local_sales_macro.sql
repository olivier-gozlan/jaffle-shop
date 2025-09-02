{% macro local_sales(source_table) %}
SELECT
    CAST(barcode_ean13 AS STRING) AS barcode,
    CAST(site_key AS STRING) AS site_key,
    CAST(product_CATEGORY AS STRING) AS product_category,
    CAST(pdt_SUB_CATEGORY AS STRING) AS sub_category,
    CAST(DATE AS DATE) AS sale_date,
    CAST(CA AS FLOAT64) AS ca
FROM {{ source('crf', source_table) }}
{% endmacro %}
