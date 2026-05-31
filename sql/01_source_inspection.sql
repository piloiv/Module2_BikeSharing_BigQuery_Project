-- Run these in BigQuery first to confirm source access and schema.

select
  table_name
from
  `bigquery-public-data.london_bicycles.INFORMATION_SCHEMA.TABLES`
order by
  table_name;

select
  table_name,
  column_name,
  data_type
from
  `bigquery-public-data.london_bicycles.INFORMATION_SCHEMA.COLUMNS`
where
  table_name in ('cycle_hire', 'cycle_stations')
order by
  table_name,
  ordinal_position;

select
  count(*) as total_hire_records,
  min(start_date) as earliest_start_date,
  max(start_date) as latest_start_date
from
  `bigquery-public-data.london_bicycles.cycle_hire`;

select
  count(*) as total_station_records
from
  `bigquery-public-data.london_bicycles.cycle_stations`;

