with trips as (
    select * from {{ ref('stg_cycle_hire') }}
)

select
    rental_id,
    bike_id,
    bike_model,
    start_at,
    end_at,
    date(start_at) as trip_date,
    extract(hour from start_at) as trip_start_hour,
    start_station_id,
    start_station_name,
    start_station_logical_terminal,
    end_station_id,
    end_station_name,
    end_station_logical_terminal,
    end_station_priority_id,
    duration_seconds,
    duration_milliseconds,
    duration_minutes,
    case
        when duration_seconds <= 0 then true
        when duration_seconds is null then true
        else false
    end as has_invalid_duration,
    current_timestamp() as loaded_at
from trips
