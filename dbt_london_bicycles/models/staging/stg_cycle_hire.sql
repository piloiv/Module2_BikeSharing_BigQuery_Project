with source as (
    select * from {{ source('london_bicycles', 'cycle_hire') }}
),

renamed as (
    select
        cast(rental_id as string) as rental_id,
        cast(bike_id as string) as bike_id,
        bike_model,
        cast(start_date as timestamp) as start_at,
        cast(end_date as timestamp) as end_at,
        cast(start_station_id as string) as start_station_id,
        start_station_name,
        cast(start_station_logical_terminal as string) as start_station_logical_terminal,
        cast(end_station_id as string) as end_station_id,
        end_station_name,
        cast(end_station_logical_terminal as string) as end_station_logical_terminal,
        cast(end_station_priority_id as string) as end_station_priority_id,
        cast(duration as int64) as duration_seconds,
        cast(duration_ms as int64) as duration_milliseconds,
        safe_divide(cast(duration as numeric), 60) as duration_minutes
    from source
)

select * from renamed
