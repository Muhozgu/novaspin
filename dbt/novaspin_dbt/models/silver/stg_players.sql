-- Silver: typed, cleaned version of the raw markets table.
-- No business logic here, just casting and standardizing column types.

select
    market_id,
    country_code,
    country_name,
    region,
    currency,
    cast(launch_date as date) as launch_date,
    regulatory_status,
    market_tier
from {{ source('bronze', 'markets') }}
