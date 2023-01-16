with src_promo as (
    select * from {{source('postgres','promos')}}
)

, renamed_recast as (
    select 
        PROMO_ID
        , DISCOUNT
        , STATUS
    from src_promo
)

select * from renamed_recast