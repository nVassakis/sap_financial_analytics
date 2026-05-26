select distinct
    transaction_date                                as date_id,
    extract(year from transaction_date)::int        as year,
    extract(quarter from transaction_date)::int     as quarter,
    extract(month from transaction_date)::int       as month,
    to_char(transaction_date, 'Mon YYYY')           as month_label
from {{ ref('stg_financial_transactions') }}

where transaction_date is not null