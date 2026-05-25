select
    TRANSACTIONID           as transaction_id,
    accountid               as account_id,
    accounttypeid           as account_type_id,
    customerid              as customer_id,
    customertypeid          as customer_type_id,
    productid               as product_id,
    productcategoryid       as product_category_id,
    profitcenterid          as profit_center_id,
    version,
    to_date(date::text, 'YYYYMMDD')  as transaction_date,
    replace(value::text, ',', '.')::numeric  as value

from {{ source('raw', 'financialtransactions') }}
