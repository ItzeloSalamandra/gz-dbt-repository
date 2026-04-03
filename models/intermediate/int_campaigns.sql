-- models/int_campaigns.sql
with union_campaigns as (
    SELECT * FROM {{ ref('stg_raw__adwords') }}
    UNION ALL
    SELECT * FROM {{ ref('stg_raw__bing') }}
    UNION ALL
    SELECT * FROM {{ ref('stg_raw__facebook') }}
    UNION ALL
    SELECT * FROM {{ ref('stg_raw__criteo') }}
)

select * from union_campaigns