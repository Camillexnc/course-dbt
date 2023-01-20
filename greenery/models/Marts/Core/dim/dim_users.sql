{{
  config(
    materialized='table'
  )
}}

with users as (
    select * from {{ ref ('int_users_addresses')}}

)

select 
      USER_ID
      ,FIRST_NAME
      , LAST_NAME
      ,EMAIL
      , PHONE_NUMBER
      , created_at_utc
      , updated_at_utc
      , ADDRESS_ID
        , ADDRESS
        , ZIPCODE
        , STATE
        , COUNTRY
        ,CASE 
        WHEN country = 'United States' THEN 'Domestic'
        ELSE 'International'
        END AS Market_Type

        from users
