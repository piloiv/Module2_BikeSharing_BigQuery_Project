with stations as (
    select * from {{ ref('stg_cycle_stations') }}
)

select
    station_id,
    station_name,
    latitude,
    longitude,
    bikes_count,
    docks_count,
    empty_docks_count,
    is_temporary,
    is_installed,
    locked_status,
    terminal_name,
    installed_date,
    removed_date
from stations
