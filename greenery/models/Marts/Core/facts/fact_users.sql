{{
  config(
    materialized='table'
  )
}}

with users as (
    select * from {{ ref ('int_users_addresses')}}

)

select 

COUNTRY,state,count(distinct user_id) as total_number_users

from users
group by COUNTRY,state