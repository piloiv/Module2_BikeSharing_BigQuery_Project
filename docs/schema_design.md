# Schema Design

## Proposed Star Schema

The project uses a bike-sharing analytics star schema centered on trip events.

## Fact Tables

### `fact_trip`

One row per bike hire trip.

Key fields:

- `rental_id`
- `bike_id`
- `bike_model`
- `start_at`
- `end_at`
- `trip_date`
- `trip_start_hour`
- `start_station_id`
- `end_station_id`
- `duration_seconds`
- `duration_minutes`

## Dimension Tables

### `dim_station`

One row per station.

Key fields:

- `station_id`
- `station_name`
- `latitude`
- `longitude`
- `bikes_count`
- `docks_count`
- `is_installed`
- `locked_status`
- `terminal_name`

### `dim_date`

One row per calendar date.

Key fields:

- `date_key`
- `year`
- `month`
- `month_name`
- `quarter`
- `day_of_week_name`
- `is_weekend`

## Analytics Marts

- `mart_daily_demand`
- `mart_hourly_demand`
- `mart_weekday_demand`
- `mart_station_activity`

## Design Justification

This schema supports efficient querying because common business questions can be answered from focused fact, dimension, and mart tables instead of repeatedly scanning the full public source table.
