{{
    config(
        materialized='incremental'
    )
}}

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
-- from dual
-- where 1=0

select 
      ld.datastarttm
    , ld.dataendtm
    , ld.mtrcsk
    , ld.rptsk
    , ld.rptdt
    , ld.mtrcval
    , ld.divnm
    , ld.rgnnm
    , ld.mso
    , ld.psu
    , ld.mtrcnm
    , ld.lvl1id
    , ld.lvl1nm
    , ld.lvl1def
    , ld.lvl2id
    , ld.lvl2nm
    , ld.lvl2def
    , ld.lvl3id
    , ld.lvl3nm
    , ld.lvl3def
    , cast(current_timestamp as timestamp) as loaddttm
from {{ ref('ldfctmtrccaptr') }} as ld