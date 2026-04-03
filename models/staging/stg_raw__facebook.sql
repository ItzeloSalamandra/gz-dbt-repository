{{ config(materialized='table') }}

with source as (
    select * from {{ source('raw', 'facebook') }}
),

renamed as (
    select
        -- REVISA ESTA LÍNEA: debe tener el paréntesis de cierre ) antes del AS
        concat(paid_source, '_', camPGN_name) as campaign_key,
        date_date,
        paid_source,
        camPGN_name as campaign_name,
        -- REVISA ESTA LÍNEA: debe tener el paréntesis de cierre ) antes del AS
        CAST(ads_cost AS float64) as ads_cost,
        impression,
        click
    from source
)

select * from renamed