-- models/int_campaigns.sql
with union_campaigns as (
    SELECT * FROM {{ ref('stg_raw_adwords') }} -- Un solo guion
    UNION ALL
    SELECT * FROM {{ ref('stg_raw_bing') }}
    UNION ALL
    SELECT * FROM {{ ref('stg_raw_facebook') }}
    UNION ALL
    SELECT * FROM {{ ref('stg_raw_criteo') }}
)

select * from union_campaigns