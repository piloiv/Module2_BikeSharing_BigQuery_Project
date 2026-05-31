# Phase 2 WSL dbt Guide

This project should follow the same workflow used in the earlier `5m-data-2.5-data-warehouse` module.

## What the Course Module Did

The lesson used this sequence:

```bash
wsl
cd ~/5m-data-2.5-data-warehouse
conda activate elt
cd liquor_sales
gcloud auth application-default login
dbt debug
dbt seed
dbt snapshot
dbt run
dbt test
```

For this London Bicycles project, we do not currently need `dbt seed`, because we are reading from BigQuery public tables instead of loading local CSV seed files.

We also do not need `dbt snapshot` for the first pass. We can add snapshots later if we decide station changes need Type 2 Slowly Changing Dimension handling.

## Our WSL Sequence

From PowerShell:

```bash
wsl
```

Inside WSL:

```bash
cd /mnt/d/Module2_BikeSharing_BigQuery_Project/dbt_london_bicycles
conda activate elt
gcloud auth application-default login
dbt debug
dbt run
dbt test
```

If dbt does not automatically find the local `profiles.yml`, use:

```bash
dbt debug --profiles-dir .
dbt run --profiles-dir .
dbt test --profiles-dir .
```

## BigQuery Dataset Required

Before `dbt run`, create this dataset in BigQuery:

```text
vocal-gist-496900-j8.london_bicycles_analytics
```

Use location:

```text
EU
```

The EU location is required because the London Bicycles public dataset is also in the EU multi-region.

## Expected dbt Outputs

After a successful `dbt run`, BigQuery should contain transformed models such as:

- `stg_cycle_hire`
- `stg_cycle_stations`
- `dim_station`
- `dim_date`
- `fact_trip`
- `mart_daily_demand`
- `mart_hourly_demand`
- `mart_weekday_demand`
- `mart_station_activity`

## If Something Fails

Try this reset sequence from inside `dbt_london_bicycles`:

```bash
dbt clean
dbt debug
dbt run
```

Common things to check:

- The `elt` conda environment is active.
- `gcloud auth application-default login` has been run inside WSL.
- BigQuery dataset `london_bicycles_analytics` exists.
- The dataset location is `EU`.
- The project ID in `profiles.yml` is `vocal-gist-496900-j8`.

