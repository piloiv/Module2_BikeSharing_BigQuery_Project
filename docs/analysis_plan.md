# Python Analysis Plan

The notebook `analysis/london_bicycles_analysis_starter.ipynb` now queries the dbt marts and produces the first analysis outputs.

## Sections Added

- KPI summary
- Daily demand trend
- Highest-demand days
- Monthly demand trend
- Hourly demand pattern
- Weekday and weekend demand
- Top station activity
- Station departure/arrival imbalance
- Findings draft
- Recommendations draft

## Tables Queried

- `mart_daily_demand`
- `mart_hourly_demand`
- `mart_weekday_demand`
- `mart_station_activity`

## Expected Outputs

- Summary KPI table
- Time-series demand charts
- Bar charts for hourly and weekday demand
- Top station activity table and chart
- Station imbalance table and chart
- Bullet-point findings ready to transfer into the report and slide deck

## Analysis Principles

- Use dbt marts instead of repeatedly scanning raw public source tables.
- Exclude invalid or missing durations from duration-based metrics.
- Treat unmatched historical station IDs as a documented limitation.
- Convert findings into clear operational recommendations.

