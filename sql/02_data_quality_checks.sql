-- Data quality checks for the source data.

select
  count(*) as total_records,
  countif(rental_id is null) as null_rental_ids,
  count(*) - count(distinct rental_id) as duplicate_rental_id_count,
  countif(start_date is null) as null_start_dates,
  countif(duration is null) as null_durations,
  countif(duration <= 0) as non_positive_durations,
  countif(start_station_id is null) as null_start_station_ids,
  countif(end_station_id is null) as null_end_station_ids
from
  `bigquery-public-data.london_bicycles.cycle_hire`;

select
  count(*) as station_rows,
  countif(id is null) as null_station_ids,
  count(*) - count(distinct id) as duplicate_station_id_count,
  countif(latitude is null or longitude is null) as missing_coordinates
from
  `bigquery-public-data.london_bicycles.cycle_stations`;

select
  count(*) as trips_with_start_station_missing_from_reference
from
  `bigquery-public-data.london_bicycles.cycle_hire` as h
left join
  `bigquery-public-data.london_bicycles.cycle_stations` as s
on
  h.start_station_id = s.id
where
  h.start_station_id is not null
  and s.id is null;

select
  count(*) as trips_with_end_station_missing_from_reference
from
  `bigquery-public-data.london_bicycles.cycle_hire` as h
left join
  `bigquery-public-data.london_bicycles.cycle_stations` as s
on
  h.end_station_id = s.id
where
  h.end_station_id is not null
  and s.id is null;

