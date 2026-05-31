# Data Ingestion Inspection - London Bicycles

## Dataset Access Summary

Dataset: London Bicycles
BigQuery public project: `bigquery-public-data`
BigQuery dataset ID: `london_bicycles`
Location: `EU` multi-region
Access type: Public BigQuery dataset
Inspection date: 2026-05-31

## Main Tables

- `bigquery-public-data.london_bicycles.cycle_hire`
- `bigquery-public-data.london_bicycles.cycle_stations`

## Confirmed Source Inventory

| Table | Row count | Notes |
| --- | ---: | --- |
| `cycle_hire` | 83,434,866 | Trip-level hire records from `2015-01-04 00:00:00 UTC` to `2023-01-15 23:59:00 UTC` |
| `cycle_stations` | 800 | Station reference records |

## Publicly Confirmed Fields

The Google BigQuery tutorial confirms that `cycle_hire` includes trip-level fields such as:

- `rental_id`
- `start_date`
- `end_date`
- `bike_id`
- `bike_model`
- `start_station_name`
- `start_station_id`
- `end_station_name`
- `end_station_id`
- `duration`
- `duration_ms`

The tutorial also confirms that `cycle_stations` includes station-level fields such as:

- `id`
- `name`
- `longitude`
- `latitude`
- `bikes_count`
- `docks_count`
- `nbEmptyDocks`
- `installed`
- `temporary`
- `locked`

These tables can be joined with:

```sql
h.start_station_id = s.id
```

## Useful Inspection Queries

These queries require BigQuery access through the browser console or another authenticated BigQuery method.

### List Tables

```sql
SELECT
  table_name
FROM
  `bigquery-public-data.london_bicycles.INFORMATION_SCHEMA.TABLES`
ORDER BY
  table_name;
```

### Inspect Column Names

```sql
SELECT
  table_name,
  column_name,
  data_type
FROM
  `bigquery-public-data.london_bicycles.INFORMATION_SCHEMA.COLUMNS`
ORDER BY
  table_name,
  ordinal_position;
```

### Preview Hire Records

```sql
SELECT
  *
FROM
  `bigquery-public-data.london_bicycles.cycle_hire`
LIMIT 10;
```

### Preview Station Records

```sql
SELECT
  *
FROM
  `bigquery-public-data.london_bicycles.cycle_stations`
LIMIT 10;
```

### Count Records

```sql
SELECT
  COUNT(*) AS total_hire_records
FROM
  `bigquery-public-data.london_bicycles.cycle_hire`;
```

```sql
SELECT
  COUNT(*) AS total_station_records
FROM
  `bigquery-public-data.london_bicycles.cycle_stations`;
```

## Data Ingestion Notes

For this project, the dataset does not need to be downloaded first. It is already hosted in BigQuery as a public dataset. The ingestion step can therefore describe how the project connects to the public dataset, identifies the required tables, inspects schema and sample records, and prepares the data for later cleaning, transformation, analysis, and dashboarding.

Because `cycle_hire` contains more than 83 million records, the project should avoid repeated full-table exploratory queries. The recommended approach is to inspect schema first, create reusable dbt models and aggregated marts, and use those smaller transformed outputs for repeated Python analysis and presentation charts.
