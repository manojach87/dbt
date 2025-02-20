{{
    config(
        materialized='table'
    )
}}
{% set business_date = get_business_date() %}

with inventory_by_color as (
        select c.name as color_name, count(*) from inventory_parts i
        inner join colors c on i.color_id = c.id
        group by 1
)
, ldfctmtrccaptr_inventory_by_color_white as (
    select
        {{ var('business_date') }}::date as datastarttm
        , {{ var('business_date') }}::date as dataendtm
        , 1::int  mtrcsk
        , 1::int  rptsk
        , current_date as rptdt
        , 100.02::decimal(18, 2)  mtrcval
        , ''::varchar(255) as divnm
        , ''::varchar(255) as rgnnm
        , ''::varchar(255) as mso
        , ''::varchar(255) as psu
        , 'color'::varchar(255) as mtrcnm
        , color_name::varchar(255) as lvl1id
        , ''::varchar(255) as lvl1nm
        , ''::varchar(255) as lvl1def
        , ''::varchar(255) as lvl2id
        , ''::varchar(255) as lvl2nm
        , ''::varchar(255) as lvl2def
        , ''::varchar(255) as lvl3id
        , ''::varchar(255) as lvl3nm
        , ''::varchar(255) as lvl3def
        , cast(current_timestamp as timestamp) as loaddttm
        from inventory_by_color as all_colors where color_name = 'White'
)

-- select
--     current_date as datastarttm
--     , current_date as dataendtm
--     , -1::int  mtrcsk
--     , -1::int  rptsk
--     , current_date as rptdt
--     , 100.02::decimal(18, 2)  mtrcval
--     , ''::varchar(255) as divnm
--     , ''::varchar(255) as rgnnm
--     , ''::varchar(255) as mso
--     , ''::varchar(255) as psu
--     , ''::varchar(255) as mtrcnm
--     , ''::varchar(255) as lvl1id
--     , ''::varchar(255) as lvl1nm
--     , ''::varchar(255) as lvl1def
--     , ''::varchar(255) as lvl2id
--     , ''::varchar(255) as lvl2nm
--     , ''::varchar(255) as lvl2def
--     , ''::varchar(255) as lvl3id
--     , ''::varchar(255) as lvl3nm
--     , ''::varchar(255) as lvl3def
--     , cast(current_timestamp as timestamp) as loaddttm
-- from {{ ref('dual') }}
-- where 1=0
-- union all  

select * from ldfctmtrccaptr_inventory_by_color_white
