{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw', 'criteo') }}
),

renamed as (
    select
        concat(paid_source, '_', camPGN_name) as campaign_key,
        date_date,
        paid_source,
        camPGN_name as campaign_name,
        cast(ads_cost as float64) as ads_cost,
        impression,
        click
    from source
)

select * from renamed