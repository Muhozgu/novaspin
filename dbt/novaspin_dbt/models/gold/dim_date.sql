-- Gold: calendar date dimension covering the full dataset span
-- (company launch 2016-03-15 through end of 2026), for Power BI
-- time-intelligence measures (YoY, MoM, running totals, etc.).

with date_spine as (
    select
        dateadd(day, seq4(), '2016-01-01'::date) as date_day
    from table(generator(rowcount => 4018))  -- 2016-01-01 through 2026-12-31 inclusive
)

select
    date_day,
    year(date_day)          as year,
    quarter(date_day)       as quarter,
    month(date_day)         as month,
    monthname(date_day)     as month_name,
    day(date_day)           as day_of_month,
    dayofweek(date_day)     as day_of_week,
    dayname(date_day)       as day_name,
    weekofyear(date_day)    as week_of_year,
    case when dayofweek(date_day) in (0, 6) then true else false end as is_weekend
from date_spine
where date_day <= '2026-12-31'
