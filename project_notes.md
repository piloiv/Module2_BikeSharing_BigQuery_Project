# Bike Sharing BigQuery Project Notes

## Dataset
Dataset name: London Bicycles
BigQuery project ID: bigquery-public-data
BigQuery dataset ID: london_bicycles
BigQuery table name(s): cycle_hire, cycle_stations
Public dataset link: https://console.cloud.google.com/bigquery?p=bigquery-public-data&d=london_bicycles&page=dataset&project=vocal-gist-496900-j8&ws=!1m5!1m4!3m2!1sbigquery-public-data!2slondon_bicycles!23sLEGACY_URL_PARAM
Source/company name: London Bicycle Hires / Transport for London public cycle hire data
Dataset location: Cloud-hosted BigQuery public dataset, EU multi-region
Confirmed source size:
- `cycle_hire`: 83,434,866 records from 2015-01-04 00:00:00 UTC to 2023-01-15 23:59:00 UTC
- `cycle_stations`: 800 records

## Course Requirement
Assignment brief: Full project assignment
Required deliverables:
- GitHub repository in a single main branch with all code and documentation
- Jupyter notebooks with basic analysis
- Slide deck for executive summary and key findings
Presentation duration: 10 minutes presentation + 5 minutes Q&A
Any required tools:
- Database or data warehouse, selected here as BigQuery
- ELT tool such as dbt, or another transformation approach
- Data quality testing through Great Expectations or custom SQL queries
- Python analysis with pandas and SQLAlchemy or equivalent warehouse connection
- Architecture or lineage diagram using tools such as Draw.io or Excalidraw

## Access
Google Cloud project ID: vocal-gist-496900-j8
Billing enabled? yes/no/unknown
BigQuery access method: browser

## Business Focus
Possible questions:
- When is bike demand highest?
- Which stations are busiest?
- How do members and casual riders differ?
- Are there seasonal or weekday/weekend patterns?
- Are there operational issues such as station imbalance?

## Executive Dashboard Focus
Executives of a bike-sharing business would usually look for dashboard content that answers whether demand is growing, operations are efficient, customers are using the service well, and where action is needed next.

Recommended dashboard pages:

1. Overview
   - Total trips
   - Trips this month / year
   - Average daily trips
   - Average ride duration
   - Number of active stations
   - Busiest station
   - Peak usage hour
   - Weekday vs weekend demand

2. Demand Patterns
   - Trips over time by day, week, or month
   - Seasonality patterns
   - Hour-of-day demand
   - Day-of-week demand
   - Peak commute periods
   - Weather or holiday impact if external data is added later

3. Station Operations
   - Top start stations
   - Top end stations
   - Low-usage stations
   - Stations with high inbound vs outbound imbalance
   - Station activity map
   - Stations that may need more bikes or docking capacity

4. Customer / Usage Behavior
   - Short vs long trips
   - Commute-style trips vs leisure-style trips
   - Average trip duration by time of day
   - Common station-to-station journeys
   - Repeat demand patterns by location

5. Operational Health
   - Stations with more departures than arrivals
   - Stations with more arrivals than departures
   - Potential redistribution hotspots
   - Peak-hour pressure points
   - Unusually long trips or possible data quality issues
   - Demand concentration across top stations

6. Insights and Actions
   - Where to rebalance bikes
   - Which stations need capacity review
   - Which time periods need operational support
   - Which areas show growth opportunity
   - Which low-use stations may need promotion, relocation, or review

## Technical Team Focus
The technical team would focus on whether the data source is reliable, the ingestion approach is clear, transformations are correct, data quality is tested, and the project can be maintained or rerun.

Relevant technical content:

1. Data Source and Access
   - Source dataset: `bigquery-public-data.london_bicycles`
   - Tables used: `cycle_hire`, `cycle_stations`
   - Access method: BigQuery public dataset
   - Dataset location: `EU` multi-region
   - Whether data is queried directly or transformed into project-owned tables/views

2. Data Ingestion Health
   - Table availability
   - Row counts by table
   - Latest available trip date
   - Data refresh / last modified date
   - Schema changes, if any
   - Query access status

3. Data Quality
   - Null values in important fields
   - Missing station IDs
   - Invalid or negative durations
   - Duplicate rental/trip IDs
   - Trips with missing start/end station names
   - Trips where station IDs do not match the station reference table
   - Outlier trip durations

4. Transformation Logic
   - dbt model structure
   - Staging models
   - Intermediate joined models
   - Final mart models
   - Business rules used in transformations
   - Date/time extraction logic
   - Duration conversion logic
   - Station imbalance calculation logic

5. Testing and Validation
   - dbt source freshness checks, if available
   - dbt schema tests
   - Unique tests for IDs
   - Not-null tests for key fields
   - Accepted range tests for duration
   - Relationship tests between trip station IDs and station table IDs
   - Reconciliation checks between raw and transformed row counts

6. Performance and Cost
   - Query size / bytes processed
   - Partitioning strategy, if creating project tables
   - Clustering strategy, likely by date or station
   - Avoiding repeated full-table scans
   - Use of views vs materialized tables
   - Scheduled refresh cost
   - Dashboard query performance

7. Deployment and Maintainability
   - dbt project structure
   - Environment setup
   - Credentials method
   - Version control
   - Documentation generated by dbt
   - Clear naming conventions
   - Repeatable run commands
   - Separation between raw sources, staging models, intermediate models, and marts

Recommended technical appendix or technical dashboard section:

1. Data source inventory
2. Ingestion and schema checks
3. Data quality checks
4. dbt model lineage
5. Testing summary
6. Performance and cost notes

## Notes
Anything else:
- The full project will use the London Bicycles dataset hosted in the cloud.
