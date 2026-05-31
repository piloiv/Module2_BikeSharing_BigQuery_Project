select
    dates.day_of_week_number,
    dates.day_of_week_name,
    dates.is_weekend,
    count(*) as trip_count,
    avg(trips.duration_minutes) as avg_duration_minutes
from {{ ref('fact_trip') }} as trips
left join {{ ref('dim_date') }} as dates
    on trips.trip_date = dates.date_key
where trips.has_invalid_duration = false
group by
    dates.day_of_week_number,
    dates.day_of_week_name,
    dates.is_weekend

