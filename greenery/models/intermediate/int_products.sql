{{
  config(
    materialized='table'
  )
}}

with orders as (
    select * from {{ ref ('stg_postgres_orders')}}
)

,items as (
    select * from {{ ref ('stg_postgres_order_items')}}
)

,products as (
    select * from {{ ref ('stg_postgres_products')}}
)

SELECT
       orders.ORDER_ID
        ,orders.PROMO_ID
        , orders.created_at_utc
        , orders.ORDER_COST
        , orders.SHIPPING_COST
        , orders.ORDER_TOTAL
        , orders.TRACKING_ID
        , orders.SHIPPING_SERVICE
        , orders.estimated_delivery_at_utc
        , orders.delivered_at_utc
        , orders.STATUS
        , items.PRODUCT_ID
        , items.QUANTITY
        , products.NAME
        , products.PRICE
        , products.INVENTORY

from orders 
left join items on items.order_id = orders.order_id
left join products on items.PRODUCT_ID=products.PRODUCT_ID