# London Bicycles BigQuery Analytics Pipeline

This project builds an end-to-end data pipeline and analysis workflow for the London Bicycles public dataset in BigQuery.

## Project Goal

Create a reliable analytics workflow that helps business and technical stakeholders understand bike-sharing demand, station activity, and operational imbalance.

## Dataset

- Source: London Bicycles public dataset
- BigQuery project: `bigquery-public-data`
- Dataset: `london_bicycles`
- Location: EU multi-region
- Main tables:
  - `bigquery-public-data.london_bicycles.cycle_hire`
  - `bigquery-public-data.london_bicycles.cycle_stations`
- Confirmed source size:
  - `cycle_hire`: 83,434,866 trip records from 2015-01-04 to 2023-01-15
  - `cycle_stations`: 800 station records

## Architecture

1. Public BigQuery source data
2. Google BigQuery warehouse in project `vocal-gist-496900-j8`
3. dbt transformations into staging, dimensions, facts, and marts
4. Data quality tests with dbt and SQL checks
5. Python exploratory analysis in Jupyter
6. Report and executive presentation

See [project_architecture_diagram.md](project_architecture_diagram.md) for the architecture diagram.

## Repository Layout

- `dbt_london_bicycles/`: dbt project scaffold and models
- `sql/`: BigQuery inspection and validation queries
- `analysis/`: Jupyter notebook starter for Python analysis
- `docs/`: report, schema, and architecture documentation
- `slides/`: executive presentation outline

See `docs/data_quality_findings.md` for the first dbt test findings and cleaning decisions.

## First Run Checklist

1. Confirm BigQuery billing is enabled. Done.
2. Confirm the dbt profile uses location `EU`. Done.
3. Run the inspection SQL in `sql/01_source_inspection.sql`. Done.
4. Validate the actual source columns against the dbt staging models. Done.
5. Run dbt models and tests from `dbt_london_bicycles`. Done.
6. Use the analysis notebook to generate charts and findings. Next.

## Current Status

Phase 2 is complete for the first pass. dbt built 9 models successfully and testing completed with 12 passes, 5 documented warnings, and 0 errors.

Phase 3 has started. The starter Python notebook connects to BigQuery, queries the dbt marts, and runs through the initial charts successfully.

The notebook has been expanded with KPI, time-pattern, station-activity, station-imbalance, findings, and recommendations sections. See `docs/analysis_plan.md`.

The first completed notebook outputs have been extracted into `docs/analysis_findings.md`, with reusable chart images under `docs/charts/`.

The first written report and executive deck are now available:

- `docs/final_report.md`
- `slides/london_bicycles_executive_summary.pptx`

The source trip table is large, so repeated analysis should use transformed marts instead of scanning the public source table every time.
