select
    accounttypeid           as account_type_id,
    medium_descr            as account_type_name

from {{ source('raw', 'glaccounttypetexts') }}

where accounttypeid is not null
