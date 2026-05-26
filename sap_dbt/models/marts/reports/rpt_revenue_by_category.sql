select 
    t.product_category_id,
    pc.product_category_name,
    sum(case when t.account_type_id = 'INC' then t.value else 0 end) as revenue,
    sum(case when t.account_type_id = 'EXP' then t.value else 0 end) as cost,
    sum(case when t.account_type_id = 'INC' then t.value else 0 end)
    - sum(case when t.account_type_id = 'EXP' then t.value else 0 end) as profit
from {{ ref('fct_transactions') }} t
left join {{ ref('dim_product_category') }} pc on t.product_category_id = pc.product_category_id
where t.version = 'Actual'
and t.product_category_id is not null
group by t.product_category_id, pc.product_category_name
order by revenue desc
