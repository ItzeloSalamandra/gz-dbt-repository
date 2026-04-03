{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw', 'raw_gz_adwords') }} -- Cambia esto por bing, facebook o criteo según el archivo
),

renamed as (
    select
        -- Creamos o traemos la llave de la campaña
        concat(paid_source, '_', camPGN_name) as campaign_key,
        date_date,
        paid_source,
        campaign_key
        camPGN_name as campaign_name, -- Renombrado solicitado
        CAST(ads_cost AS float64) as ads_cost, -- Cast solicitado
        impression,
        click
    from source
)

select * from renamed