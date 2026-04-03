with campaigns as (
    select * from {{ ref('int_campaigns') }}
),

daily_performance as (
    select
        date_date,
        -- Agregamos las métricas por día
        sum(ads_cost) as total_ads_cost,
        sum(impression) as total_impressions,
        sum(click) as total_clicks,
        -- Calculamos métricas derivadas si las necesitas (ej. CPC)
        safe_divide(sum(ads_cost), sum(click)) as cpc
    from campaigns
    group by date_date
)

select *
from daily_performance
-- Ordenar por fecha en orden cronológico inverso (lo más reciente primero)
order by date_date desc