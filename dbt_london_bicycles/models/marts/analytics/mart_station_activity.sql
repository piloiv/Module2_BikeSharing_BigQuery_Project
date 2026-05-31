with starts as (
    select
        start_station_id as station_id,
        count(*) as departure_count
    from {{ ref('fact_trip') }}
    where start_station_id is not null
    group by start_station_id
),

ends as (
    select
        end_station_id as station_id,
        count(*) as arrival_count
    from {{ ref('fact_trip') }}
    where end_station_id is not null
    group by end_station_id
),

combined as (
    select
        coalesce(starts.station_id, ends.station_id) as station_id,
        coalesce(starts.departure_count, 0) as departure_count,
        coalesce(ends.arrival_count, 0) as arrival_count
    from starts
    full outer join ends
        on starts.station_id = ends.station_id
)

select
    combined.station_id,
    stations.station_name,
    stations.latitude,
    stations.longitude,
    departure_count,
    arrival_count,
    departure_count + arrival_count as total_activity_count,
    departure_count - arrival_count as net_departure_count
from combined
left join {{ ref('dim_station') }} as stations
    on combined.station_id = stations.station_id

