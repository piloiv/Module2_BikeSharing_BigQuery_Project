select
    trip_start_hour,
    count(*) as trip_count,
    avg(duration_minutes) as avg_duration_minutes
from {{ ref('fact_trip') }}
where has_invalid_duration = false
group by trip_start_hour

