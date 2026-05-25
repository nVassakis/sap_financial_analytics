select
    customertypeid      as customer_type_id,
    medium_descr        as customer_type_name

from {{ source('raw', 'customertypetexts') }}