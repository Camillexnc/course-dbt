{{
  config(
    materialized='table'
  )
}}

with sessions as (
    select * from {{ ref ('stg_postgres_events')}}
)



select 

count (distinct b.session_id)/count(distinct a.session_id) as overall_conversion_rate


from sessions a 
left join sessions b on a.event_id = b.event_id and b.event_type = 'checkout'
