{{
    config(
        materialized='table'
    )
}}
{% set business_date = get_business_date() %}


          select * from {{ref('ldfctmtrccaptr_aud01')}}
union all select * from {{ref('ldfctmtrccaptr_aud02')}}
union all select * from {{ref('ldfctmtrccaptr_aud03')}}