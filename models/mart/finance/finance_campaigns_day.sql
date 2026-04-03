-- models/marts/finance/fct_finance_campaigns_day.sql

with campaigns as (
    -- Asegúrate de que este sea el nombre de tu modelo de agregación diaria de campañas
    select * from {{ ref('int_campaigns_day') }}
),

finance as (
    -- Este es el modelo de la unidad anterior
    select * from {{ ref('finance_days') }}
)

select
    f.date_date as date,
    -- Cálculo solicitado por Finanzas
    (f.operational_margin - c.ads_cost) as ads_margin,
    f.average_basket,
    f.operational_margin,
    c.ads_cost,
    c.ads_impression,
    c.ads_clicks,
    f.quantity,
    f.revenue,
    f.purchase_cost,
    f.margin,
    f.shipping_fee,
    f.log_cost,
    f.ship_cost
from finance f
left join campaigns c 
    on f.date_date = c.date_date
order by date desc
