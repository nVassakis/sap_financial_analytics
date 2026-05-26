select
    customer_type_id,
    customer_type_name
from {{ ref('stg_customer_type_texts') }}

where customer_type_id is not null
