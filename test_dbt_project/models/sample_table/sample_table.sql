{{
    config(
        materialized='table'
    )
}}
{% set business_date = get_business_date() %}

select
    {{business_date}}::date as business_date
from {{ ref('dual') }}