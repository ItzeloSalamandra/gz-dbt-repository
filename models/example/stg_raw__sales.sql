with sales_source as (
    select * from {{ source('raw', 'sales') }}
),

renamed as (
    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue,
        quantity
    from sales_source
)

select * from renamed   