select
    d.year,
    t.version,
    sum(case when t.account_type_id = 'INC' then t.value else 0 end) as revenue,
    sum(case when t.account_type_id = 'EXP' then t.value else 0 end) as cost,
    sum(case when t.account_type_id = 'INC' then t.value else 0 end)
    - sum(case when t.account_type_id = 'EXP' then t.value else 0 end) as profit

from {{ ref('fct_transactions') }} t
left join {{ ref('dim_date') }} d on t.transaction_date = d.date_id

where d.year < 2021

group by d.year, t.version
