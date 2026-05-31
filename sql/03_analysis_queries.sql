-- Starter analysis queries for charts and executive findings.

select
  date(start_date) as trip_date,
  count(*) as trip_count,
  avg(duration / 60) as avg_duration_minutes
from
  `bigquery-public-data.london_bicycles.cycle_hire`
where
  duration > 0
group by
  trip_date
order by
  trip_date;

select
  extract(hour from start_date) as start_hour,
  count(*) as trip_count
from
  `bigquery-public-data.london_bicycles.cycle_hire`
where
  duration > 0
group by
  start_hour
order by
  start_hour;

select
  start_station_name,
  count(*) as departure_count
from
  `bigquery-public-data.london_bicycles.cycle_hire`
where
  start_station_name is not null
group by
  start_station_name
order by
  departure_count desc
limit 20;

select
  end_station_name,
  count(*) as arrival_count
from
  `bigquery-public-data.london_bicycles.cycle_hire`
where
  end_station_name is not null
group by
  end_station_name
order by
  arrival_count desc
limit 20;

