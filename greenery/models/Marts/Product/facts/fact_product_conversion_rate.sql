{{
  config(
    materialized='table'
  )
}}

with events as (
    select * from {{ ref ('stg_postgres_events')}}
)

, order_items as (
    select * from {{ ref ('stg_postgres_order_items')}}
)

, pv as (
    select product_id, count(distinct a.session_id) as pvs
    from  events a  where a.event_type = 'page_view'
    group by 1)


,checkout as (
    select b.product_id, count(distinct a.session_id) as co
    from events a
    inner join order_items b on a.order_id = b.order_id
    group by 1

)

select a.product_id,b.co/a.pvs
from pv a
inner join checkout b on a.product_id = b.product_id