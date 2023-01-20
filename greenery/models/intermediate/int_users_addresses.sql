{{
  config(
    materialized='table'
  )
}}

with users as (
    select * from {{ ref ('stg_postgres_users')}}
)

, addresses as (
    select * from {{ ref ('stg_postgres_address')}}
)

SELECT
        users.USER_ID
        , users.FIRST_NAME
        , users.LAST_NAME
        , users.EMAIL
        , users.PHONE_NUMBER
        , users.created_at_utc
        , users.updated_at_utc
        , users.ADDRESS_ID
        , addresses.ADDRESS
        , addresses.ZIPCODE
        , addresses.STATE
        , addresses.COUNTRY

from users 
left join addresses on users.address_id = addresses.address_id