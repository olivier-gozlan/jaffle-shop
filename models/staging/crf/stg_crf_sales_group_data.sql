select *
from {{ source('crf', 'crf_sales_group_data') }}
