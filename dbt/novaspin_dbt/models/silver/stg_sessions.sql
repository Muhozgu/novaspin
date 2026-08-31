-- Silver: typed, cleaned version of the raw players table.
-- churn_date arrives as an empty string (not NULL) for still-active players,
-- so it's converted to a real NULL date here.

select
    player_id,
    first_name,
    last_name,
    email,
    country_code,
    country_name,
    region,
    gender,
    cast(birth_date as date) as birth_date,
    cast(registration_date as date) as registration_date,
    acquisition_channel,
    vip_level,
    preferred_device,
    preferred_currency,
    kyc_verified::boolean as kyc_verified,
    is_active::boolean as is_active,
    nullif(churn_date, '')::date as churn_date
from {{ source('bronze', 'players') }}
