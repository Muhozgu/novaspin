-- Gold: market dimension, ready for Power BI.

select
    market_id,
    country_code,
    country_name,
    region,
    currency,
    launch_date,
    regulatory_status,
    market_tier
from {{ ref('stg_markets') }}
