with src_order_items as (
    select * from {{source('postgres','order_items')}}
)

, renamed_recast as (
    select 
        ORDER_ID
        , PRODUCT_ID
        , QUANTITY
    from src_order_items
)

select * from renamed_recast