select
    trip_date,
    count(*) as trip_count,
    count(distinct bike_id) as active_bike_count,
    avg(duration_minutes) as avg_duration_minutes,
    approx_quantiles(duration_minutes, 100)[offset(50)] as median_duration_minutes
from {{ ref('fact_trip') }}
where has_invalid_duration = false
group by trip_date

