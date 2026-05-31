with date_bounds as (
    select
        date(min(start_at)) as min_date,
        date(max(start_at)) as max_date
    from {{ ref('stg_cycle_hire') }}
),

date_spine as (
    select calendar_date
    from date_bounds,
    unnest(generate_date_array(min_date, max_date)) as calendar_date
)

select
    calendar_date as date_key,
    extract(year from calendar_date) as year,
    extract(month from calendar_date) as month,
    format_date('%B', calendar_date) as month_name,
    extract(quarter from calendar_date) as quarter,
    extract(dayofweek from calendar_date) as day_of_week_number,
    format_date('%A', calendar_date) as day_of_week_name,
    case
        when extract(dayofweek from calendar_date) in (1, 7) then true
        else false
    end as is_weekend
from date_spine

