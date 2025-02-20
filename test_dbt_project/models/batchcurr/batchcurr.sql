{{
    config(
        materialized='table'
    )
}}

select h.* from {{ ref('batchcurr_hist') }} as h
inner join (
    select batch_id, business_date, max(load_date_time) as load_date_time from {{ ref('batchcurr_hist') }}
    where batch_id = (
        select max(batch_id) from {{ ref('batchcurr_hist') }}
    )
    group by batch_id, business_date
) as max_h
on  h.batch_id = max_h.batch_id
and h.business_date = max_h.business_date
and h.load_date_time = max_h.load_date_time