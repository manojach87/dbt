{{
    config(
        materialized='incremental'
    )
}}

select
  strftime(current_date - 1, '%Y%m%d')::int as batch_id
, current_date - 1 as business_date
, cast(current_timestamp as timestamp) as load_date_time
from dual