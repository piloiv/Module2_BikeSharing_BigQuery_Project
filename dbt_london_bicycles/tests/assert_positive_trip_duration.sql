{{ config(severity='warn') }}

select
    rental_id,
    duration_seconds
from {{ ref('fact_trip') }}
where duration_seconds is null
   or duration_seconds <= 0
