{{
  config(
    materialized='table'
  )
}}

with users as (
    select * from {{ ref ('stg_postgres_users')}}
)

, orders as (
    select * from {{ ref ('stg_postgres_orders')}}
)



select 

        users.USER_ID
        ,users.FIRST_NAME
        , users.LAST_NAME
        , users.EMAIL
        , users.PHONE_NUMBER
        , users.created_at_utc as users_created_at_utc 
        , users.updated_at_utc as users_updated_at_utc
        , users.ADDRESS_ID
        , orders.ORDER_ID
        , orders.PROMO_ID
        , orders.created_at_utc as orders_created_at_utc
        , orders.ORDER_COST
        , orders.SHIPPING_COST
        , orders.ORDER_TOTAL
        , orders.TRACKING_ID
        , orders.SHIPPING_SERVICE
        , orders.estimated_delivery_at_utc
        , orders.delivered_at_utc
        , orders.STATUS
        


from users 
left join orders on users.user_id = orders.user_id

