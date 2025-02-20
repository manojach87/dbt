{{
    config(
        materialized='ephemeral'
    )
}}

-- select 
-- NULL::BIGINT  id
-- , NULL::VARCHAR "name"
-- , NULL::VARCHAR rgb
-- , NULL::BOOLEAN is_trans
-- from dual
-- where 1=0

select * from colors where 1=0
