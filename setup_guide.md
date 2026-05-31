# Setup Guide

## 1. Google Cloud

- Confirm billing is enabled on project `vocal-gist-496900-j8`.
- Confirm BigQuery can access `bigquery-public-data.london_bicycles`.
- Create a dataset in your project named `london_bicycles_analytics`.
- Set the dataset location to `EU`.

## 2. Python Environment

Install the project packages:

```powershell
pip install -r requirements.txt
```

If you are using the course WSL setup, use the existing conda environment instead:

```bash
conda activate elt
```

## 3. dbt Profile

This project includes a local profile at:

```text
dbt_london_bicycles/profiles.yml
```

It follows the same pattern as the earlier course dbt module:

- BigQuery adapter
- OAuth authentication
- local `profiles.yml`
- one development target named `dev`

The important settings are:

- `project: vocal-gist-496900-j8`
- `dataset: london_bicycles_analytics`
- `location: EU`
- `method: oauth`

## 4. Authenticate Google Cloud

Run this once in the same environment where you run dbt:

```powershell
gcloud auth application-default login
```

## 5. First BigQuery Checks

Run:

```text
sql/01_source_inspection.sql
```

This confirms table access, source columns, row counts, and date range.

## 6. First dbt Run

From inside `dbt_london_bicycles`, run:

```powershell
dbt debug --profiles-dir .
dbt run --profiles-dir .
dbt test --profiles-dir .
```

The `--profiles-dir .` part tells dbt to use the `profiles.yml` file in this project folder, matching the course-module style.

For WSL, the project folder path is:

```bash
cd /mnt/d/Module2_BikeSharing_BigQuery_Project/dbt_london_bicycles
conda activate elt
dbt debug
dbt run
dbt test
```

If dbt cannot find the profile in WSL, add `--profiles-dir .` to each dbt command.

## 7. Python Analysis

Open:

```text
analysis/london_bicycles_analysis_starter.ipynb
```

Use it to query BigQuery marts and create charts for the report and slide deck.

## Free-Tier Cost Notes

- Use `limit` when previewing source data.
- Prefer marts and aggregated tables for repeated analysis.
- Avoid repeatedly selecting all rows from `cycle_hire`.
- Check BigQuery's estimated bytes processed before running large queries.
