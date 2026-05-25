select
    prodcategoryid          as product_category_id,
    short_descr             as product_category_name

from {{ source('raw', 'productcategorytexts') }}

where prodcategoryid is not null