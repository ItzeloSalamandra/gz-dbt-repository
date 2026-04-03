{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw', 'adwords') }}
),

renamed as (
    select
        concat(paid_source, '_', camPGN_name) as campaign_key,
        date_date,
        paid_source,
        camPGN_name as campaign_name,
        CAST(ads_cost AS float64) as ads_cost,
        impression,
        click
    from source
)

select * from renamed