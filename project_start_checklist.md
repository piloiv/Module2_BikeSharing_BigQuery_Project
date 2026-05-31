# Project Start Checklist - London Bicycles BigQuery

## Assignment Requirements

- Build an end-to-end data pipeline and analysis workflow.
- Use one source dataset; selected dataset is `bigquery-public-data.london_bicycles`.
- Ingest or connect source data into a database/data warehouse.
- Design and implement a warehouse schema.
- Build an ELT pipeline, preferably with dbt or an equivalent transformation approach.
- Add data cleaning, validation, and derived fields.
- Add data quality tests for nulls, duplicates, referential integrity, and business rules.
- Analyze the warehouse data with Python, pandas, and SQLAlchemy or an equivalent connection method.
- Document code, data lineage, and pipeline architecture.
- Prepare a report with technical approach, findings, charts, and schema design justification.
- Prepare a 10-minute executive presentation plus 5-minute Q&A.

## Confirmed Project Choices

- Dataset: London Bicycles.
- Source system: BigQuery public dataset.
- Public project: `bigquery-public-data`.
- Dataset ID: `london_bicycles`.
- Dataset location: EU multi-region.
- Main tables:
  - `bigquery-public-data.london_bicycles.cycle_hire`
  - `bigquery-public-data.london_bicycles.cycle_stations`
- Current Google Cloud project noted: `vocal-gist-496900-j8`.

## Immediate Next Steps

- Confirm BigQuery access works in the browser. Done.
- Confirm the Google Cloud project has billing enabled. Done.
- Confirm the dbt project location is set to EU. Done.
- Run schema inspection queries for `cycle_hire` and `cycle_stations`. Done.
- Save screenshots or query results for data ingestion evidence. Done.
- Decide whether transformed outputs will be BigQuery views or tables. Done.
- Create a simple star schema for bike-sharing analytics. Done.
- Create a GitHub repository on a single main branch.
-
## Phase 2 Status

- BigQuery target dataset `london_bicycles_analytics` created in EU.
- dbt connection verified with `dbt debug`.
- dbt models built successfully with `dbt run`.
- dbt tests completed with 12 passes, 5 documented warnings, and 0 errors.
- Warehouse outputs created in BigQuery for staging, dimensions, facts, and analytics marts.

## Phase 3 Status

- Jupyter notebook opened successfully.
- Python connected to BigQuery through the existing authenticated environment.
- Starter analysis queries ran against the dbt marts.
- Initial charts rendered successfully.
- Analysis findings extracted into `docs/analysis_findings.md`.
- Final report drafted in `docs/final_report.md`.
- Executive PowerPoint deck created in `slides/london_bicycles_executive_summary.pptx`.

## Suggested Warehouse Design

- `dim_date`: one row per date, with year, month, weekday, and weekend labels.
- `dim_station`: one row per station, with station name, coordinates, and station attributes.
- `dim_time`: optional table for hour-of-day and time-period labels.
- `fact_trip`: one row per bike hire trip, with start/end stations, date/time keys, duration, and source rental ID.
- `fact_station_activity`: aggregated station-level activity by date or period.

## Suggested ELT Models

- `stg_cycle_hire`: cleaned trip source records.
- `stg_cycle_stations`: cleaned station source records.
- `int_trips_with_station_details`: joined trip and station metadata.
- `dim_date`: reusable date dimension.
- `dim_station`: reusable station dimension.
- `fact_trip`: analysis-ready trip fact table.
- `mart_daily_demand`: daily trip metrics.
- `mart_hourly_demand`: hourly demand metrics.
- `mart_station_activity`: station usage metrics.
- `mart_station_imbalance`: departures vs arrivals by station.

## Data Quality Checks

- `rental_id` is not null and unique if available.
- `start_date` is not null.
- `duration` is not null and greater than zero.
- Start station ID is not null.
- End station ID is not null if available.
- Start and end station IDs can be matched to `cycle_stations.id` where possible.
- Trip dates fall within the expected source date range.
- Extremely long rides are flagged as outliers.

## Analysis Questions

- When is demand highest by hour, weekday, month, and season?
- Which stations are busiest for trip starts?
- Which stations are busiest for trip ends?
- What are typical ride durations?
- How do weekday and weekend usage patterns differ?
- Which stations have strong departure-arrival imbalance?
- What operational actions could improve bike availability?

## Final Deliverables

- GitHub repository with code and documentation.
- Jupyter notebook with basic Python analysis.
- SQL or dbt transformation files.
- Data quality tests or validation queries.
- Architecture or lineage diagram.
- Report summarizing technical approach, findings, and recommendations.
- Executive slide deck with summary, architecture, insights, risks, and business recommendations.

## Presentation Structure

1. Executive summary.
2. Business problem and value.
3. Dataset and ingestion approach.
4. Warehouse design and pipeline architecture.
5. Data quality checks.
6. Key analysis findings.
7. Business recommendations.
8. Risks, limitations, and next steps.
9. Q&A preparation.
