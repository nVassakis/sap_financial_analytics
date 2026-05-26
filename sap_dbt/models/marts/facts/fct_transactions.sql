select
    t.transaction_id,
    t.transaction_date,
    t.version,
    t.account_type_id,
    t.customer_type_id,
    t.product_category_id,
    t.value

from {{ ref('stg_financial_transactions') }} t