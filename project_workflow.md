# London Bicycles BigQuery Project Workflow

## Goal

Complete the full bike-sharing analytics project using the London Bicycles public dataset in BigQuery.

Primary dataset:

```text
bigquery-public-data.london_bicycles
```

Main tables:

```text
bigquery-public-data.london_bicycles.cycle_hire
bigquery-public-data.london_bicycles.cycle_stations
```

## Current Constraint

The dataset is public and cloud-hosted, but live querying still requires access through a Google Cloud project. Until that access is ready, project planning, documentation, SQL design, expected analysis structure, and report/dashboard design can still move forward.

## Phase 1: Data Ingestion

Purpose: Show how the project connects to and understands the source data.

Tasks:

- Identify the source dataset and tables.
- Confirm the dataset is a public BigQuery dataset.
- Document the dataset location as `EU` multi-region.
- Inspect table schemas.
- Preview sample records.
- Count rows in each table.
- Confirm join keys between trip and station data.

Expected outputs:

- Dataset source description.
- Table inventory.
- Schema summary.
- Sample data screenshots or query results.
- Short explanation that no local download is required because the data is already hosted in BigQuery.

Key SQL:

```sql
SELECT
  table_name
FROM
  `bigquery-public-data.london_bicycles.INFORMATION_SCHEMA.TABLES`
ORDER BY
  table_name;
```

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

## Phase 2: Data Understanding

Purpose: Understand what each table represents and what business questions it can answer.

Tasks:

- Review fields in `cycle_hire`.
- Review fields in `cycle_stations`.
- Identify date/time fields, station identifiers, station names, duration fields, and geographic fields.
- Check whether trips can be analyzed by start station, end station, date, hour, weekday, month, and duration.

Expected outputs:

- Data dictionary.
- Entity relationship summary.
- List of potential analysis dimensions and measures.

Likely relationship:

```sql
h.start_station_id = s.id
```

## Phase 3: Data Quality Checks

Purpose: Identify issues that could affect analysis.

Tasks:

- Check for null station IDs and station names.
- Check for zero or negative ride durations.
- Check minimum and maximum trip dates.
- Check duplicate rental IDs if available.
- Check whether some station IDs in trips are missing from the station table.
- Review unusually long rides as possible outliers.

Expected outputs:

- Data quality summary.
- Cleaning decisions.
- Limitations and assumptions.

Example checks:

```sql
SELECT
  MIN(start_date) AS earliest_start,
  MAX(start_date) AS latest_start,
  COUNT(*) AS total_records
FROM
  `bigquery-public-data.london_bicycles.cycle_hire`;
```

```sql
SELECT
  COUNTIF(duration IS NULL) AS null_duration,
  COUNTIF(duration <= 0) AS non_positive_duration
FROM
  `bigquery-public-data.london_bicycles.cycle_hire`;
```

## Phase 4: Transformation and Feature Engineering

Purpose: Create analysis-ready fields.

Recommended tool: dbt with the BigQuery adapter.

Tasks:

- Extract date, year, month, weekday, and hour from trip timestamps.
- Create weekday/weekend labels.
- Calculate trip duration in minutes if needed.
- Join trip records to station coordinates.
- Create station-level aggregations.
- Use dbt models to organize staging, intermediate, and final analytics transformations.
- Add dbt tests for important fields such as station IDs, rental IDs, dates, and duration values.

Expected outputs:

- Clean analysis query or view.
- Aggregated tables/views for dashboarding.
- dbt project with documented models and tests.

Useful features:

- `trip_date`
- `trip_year`
- `trip_month`
- `trip_day_of_week`
- `trip_hour`
- `is_weekend`
- `duration_minutes`
- `start_station_name`
- `end_station_name`
- `station_latitude`
- `station_longitude`

Suggested dbt model layers:

- `stg_cycle_hire`: cleaned trip records from `cycle_hire`
- `stg_cycle_stations`: cleaned station records from `cycle_stations`
- `int_trips_with_station_details`: joined trips and station metadata
- `mart_daily_demand`: trips aggregated by date, weekday, and month
- `mart_hourly_demand`: trips aggregated by hour and weekday/weekend
- `mart_station_activity`: trips aggregated by station
- `mart_station_imbalance`: comparison of trip starts and trip ends by station

## Phase 5: Exploratory Analysis

Purpose: Answer the main business questions.

Recommended questions:

- When is bike demand highest by hour, weekday, month, and season?
- Which stations are busiest for trip starts and trip ends?
- What are the average and median ride durations?
- Are usage patterns different on weekdays versus weekends?
- Are there seasonal peaks or drops?
- Are there possible station imbalance issues?
- Which stations may need more bikes or more docks?

Expected outputs:

- SQL results.
- Charts.
- Written insights.
- Recommended operational actions.

## Phase 6: Dashboard or Visual Output

Purpose: Present findings clearly.

Possible tools:

- Looker Studio
- BigQuery charts
- Streamlit
- Notebook charts
- PowerPoint / report visuals

Recommended dashboard pages:

- Overview: total trips, date range, average duration, active stations.
- Time patterns: trips by hour, weekday, month.
- Station demand: busiest start and end stations.
- Geography: map of station activity.
- Operations: imbalance indicators and recommendations.

## Phase 7: Final Report and Presentation

Purpose: Convert the analysis into a project-ready deliverable.

Suggested structure:

1. Project objective
2. Dataset and ingestion method
3. Data understanding
4. Data cleaning and preparation
5. Analysis questions
6. Key findings
7. Dashboard or visuals
8. Business recommendations
9. Limitations and next steps

## What We Still Need

- Google Cloud project access for live queries.
- Assignment PDF or exact project brief.
- Required deliverable format.
- Required dashboard/reporting tool, if specified.
- Presentation duration, if any.
