{{
    config(
        materialized='ephemeral'
    )
}}

-- select 
-- NULL::BIGINT  inventory_id ,
-- NULL::VARCHAR part_num     ,
-- NULL::BIGINT  color_id     ,
-- NULL::BIGINT  quantity     ,
-- NULL::BOOLEAN is_spare     
-- from dual
-- where 1=0


select * from inventory_parts where 1=0
