with product_source as (
    select * from {{ source('raw', 'product') }}
),

renamed as (
    select
        products_id,
        CAST(purchSE_PRICE AS float64) AS purchase_price
    from product_source
)

select * from renamed   