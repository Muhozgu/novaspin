-- Gold: player dimension, ready for Power BI.

select
    player_id,
    first_name,
    last_name,
    email,
    country_code,
    country_name,
    region,
    gender,
    birth_date,
    registration_date,
    acquisition_channel,
    vip_level,
    preferred_device,
    preferred_currency,
    kyc_verified,
    is_active,
    churn_date
from {{ ref('stg_players') }}
