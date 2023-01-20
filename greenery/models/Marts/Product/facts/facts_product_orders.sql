{{
  config(
    materialized='table'
  )
}}

with products as (
    select * from {{ ref ('int_products')}}
)
select 
PRODUCT_ID
,name
,INVENTORY
,price
,sum(quantity) as total_number_sold

from products
group by PRODUCT_ID ,name,INVENTORY,price