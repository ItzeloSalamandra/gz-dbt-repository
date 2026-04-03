{{ config(
  materialized='table'
) }}

SELECT
    DATE_TRUNC(date_date, MONTH) AS datemonth,
    -- Métricas de Campañas (Ads)
    SUM(ads_cost) AS ads_cost,
    SUM(impression) AS ads_impression,
    SUM(clicks) AS ads_clicks,
    -- Métricas Financieras
    SUM(quantity) AS quantity,
    SUM(revenue) AS revenue,
    SUM(purchase_cost) AS purchase_cost,
    SUM(margin) AS margin,
    SUM(shipping_fee) AS shipping_fee,
    SUM(log_cost) AS log_cost,
    SUM(ship_cost) AS ship_cost,
    -- Métricas Calculadas
    SUM(margin) - SUM(ads_cost) AS ads_margin,
    ROUND(SAFE_DIVIDE(SUM(revenue), SUM(quantity)), 2) AS average_basket,
    SUM(margin) + SUM(shipping_fee) - SUM(log_cost) - SUM(ship_cost) - SUM(ads_cost) AS operational_margin
FROM {{ ref('finance_campaigns_day') }} -- O el nombre de tu modelo join de finanzas y ads
GROUP BY datemonth
ORDER BY datemonth DESC