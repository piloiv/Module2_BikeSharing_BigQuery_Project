with source as (
    select * from {{ source('london_bicycles', 'cycle_stations') }}
),

renamed as (
    select
        cast(id as string) as station_id,
        name as station_name,
        cast(latitude as float64) as latitude,
        cast(longitude as float64) as longitude,
        cast(bikes_count as int64) as bikes_count,
        cast(docks_count as int64) as docks_count,
        cast(nbEmptyDocks as int64) as empty_docks_count,
        cast(temporary as bool) as is_temporary,
        cast(installed as bool) as is_installed,
        locked as locked_status,
        terminal_name,
        cast(install_date as date) as installed_date,
        cast(removal_date as date) as removed_date
    from source
)

select * from renamed
