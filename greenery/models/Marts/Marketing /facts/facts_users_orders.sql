{{
  config(
    materialized='table'
  )
}}

with users as (
    select * from {{ ref ('int_users_orders')}}
)



select 

      USER_ID
       ,count(distinct ORDER_ID) asTotal_Number_of_Orders
       ,sum(ORDER_TOTAL) as Total_Amount_of_Spending
        


from users 
group by USER_ID