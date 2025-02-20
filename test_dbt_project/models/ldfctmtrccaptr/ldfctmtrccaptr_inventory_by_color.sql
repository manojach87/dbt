{{
    config(
        materialized='view'
    )
}}
{% set business_date = get_business_date() %}

select c.name as color_name, count(*)::int as inventory_cnt from {{ref('inventory_parts')}} as i
inner join  {{ref('colors')}}  c on i.color_id = c.id
group by 1
