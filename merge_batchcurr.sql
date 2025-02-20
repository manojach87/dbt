{{
    config(
        materialized='table'
    )
}}

select * from {{ ref('batchcurr_hist') }}

-- current_timestamp as load_date_time



-- merge into batchcurr as target
-- using batchcurr as source
-- on target.batch_id = source.batch_id
-- when matched then
--   update set
--     target.business_date = source.business_date + 1,
--     target.batch_id = source.batch_id + 1,
--     target.load_date_time = current_timestamp
-- when not matched then
--   insert (id, column1, column2)
--   values (source.id+1, source., source.column2);