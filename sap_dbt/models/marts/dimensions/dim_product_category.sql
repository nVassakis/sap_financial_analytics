select
    product_category_id,
    product_category_name

from {{ ref('stg_product_category_texts') }}