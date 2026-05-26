select
    t.customer_type_id,
    c.customer_type_name,
    sum(case when t.account_type_id = 'INC' then t.value else 0 end) as revenue,
    sum(case when t.account_type_id = 'EXP' then t.value else 0 end) as cost,
    sum(case when t.account_type_id = 'INC' then t.value else 0 end)
    - sum(case when t.account_type_id = 'EXP' then t.value else 0 end) as profit
from {{ ref('fct_transactions') }} t
left join {{ ref('dim_customer_type') }} c on t.customer_type_id = c.customer_type_id
where t.version = 'Actual'
and t.customer_type_id is not null
group by t.customer_type_id, c.customer_type_name