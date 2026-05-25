select
    productid               as product_id,
    productcategoryid       as product_category_id

from {{ source('raw', 'products') }}

where productid is not null
