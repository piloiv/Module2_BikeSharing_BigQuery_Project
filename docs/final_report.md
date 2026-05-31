# London Bicycles BigQuery Analytics Pipeline Report

## 1. Executive Summary

This project built an end-to-end analytics workflow for the London Bicycles public dataset using BigQuery, dbt, and Python. The pipeline connects to public trip and station data, transforms it into an analytics-ready warehouse layer, tests data quality, and produces business insights for operational decision-making.

The analysis covers **83,375,574 valid demand records** from **2015-01-04** to **2023-01-15**. Demand is strongest during commute periods, especially **17:00**, and station activity is concentrated around major transport and central city locations. The findings also reveal station imbalance patterns that can guide bike redistribution and dock-capacity monitoring.

## 2. Business Objective

The business objective is to help bike-sharing executives understand when and where demand is highest, which stations are most operationally important, and where rebalancing actions may improve service availability.

The project answers these questions:

- When is bike demand highest?
- Which stations are busiest?
- How do weekday and weekend patterns differ?
- Which stations show departure or arrival pressure?
- What operational actions should be prioritized?

## 3. Dataset and Ingestion

The selected source is the London Bicycles public dataset hosted in BigQuery.

| Item | Detail |
| --- | --- |
| Source project | `bigquery-public-data` |
| Source dataset | `london_bicycles` |
| Main trip table | `cycle_hire` |
| Station table | `cycle_stations` |
| Source location | EU multi-region |
| Target project | `vocal-gist-496900-j8` |
| Target dataset | `london_bicycles_analytics` |

The source data did not need to be downloaded locally. Instead, the project connects directly to the public BigQuery tables and materializes transformed outputs into the project-owned BigQuery dataset.

Confirmed source inventory:

| Table | Row count | Notes |
| --- | ---: | --- |
| `cycle_hire` | 83,434,866 | Trip-level source records |
| `cycle_stations` | 800 | Station reference records |

## 4. Architecture and Tools

The project uses a simple ELT pattern:

1. BigQuery public dataset as the source.
2. BigQuery project dataset as the warehouse target.
3. dbt for staging, dimensions, facts, marts, and tests.
4. Python notebook for exploratory analysis and charts.
5. Markdown documentation and PowerPoint presentation for final delivery.

Tools were chosen because they fit the assignment requirements and keep the workflow close to modern data-engineering practice:

- **BigQuery** handles large public data efficiently without local storage.
- **dbt** keeps transformations version-controlled, modular, and testable.
- **Python / pandas** supports exploratory analysis and chart generation.
- **Markdown and PowerPoint** support technical and executive communication.

## 5. Warehouse Design

The warehouse design follows a star-schema-inspired structure with trip events as the central fact.

Core models:

| Model | Purpose |
| --- | --- |
| `stg_cycle_hire` | Cleaned trip records from the source table |
| `stg_cycle_stations` | Cleaned station reference records |
| `dim_date` | Calendar dimension generated from trip dates |
| `dim_station` | Station dimension with location and operational attributes |
| `fact_trip` | One row per trip with date, station, bike, and duration fields |
| `mart_daily_demand` | Daily demand metrics |
| `mart_hourly_demand` | Hour-of-day demand metrics |
| `mart_weekday_demand` | Day-of-week and weekend metrics |
| `mart_station_activity` | Station arrivals, departures, total activity, and imbalance |

This design supports efficient querying because repeated analysis uses smaller marts instead of repeatedly scanning the full public source table.

## 6. ELT Pipeline Results

The first dbt run completed successfully.

| Result | Value |
| --- | ---: |
| Models built | 9 |
| Views | 2 |
| Tables | 7 |
| dbt test pass count | 12 |
| dbt test warnings | 5 |
| dbt test errors | 0 |

The warning-level tests captured real source data limitations rather than pipeline failures.

## 7. Data Quality Findings

Data quality checks found several issues that should be documented and handled in analysis.

| Check | Records flagged | Interpretation |
| --- | ---: | --- |
| Non-positive or missing trip duration | 59,292 | Exclude from duration-based analysis |
| Null `duration_seconds` | 19,587 | Source records missing duration |
| Null `start_station_id` | 229,639 | Some trips lack a usable start station ID |
| End station missing from station reference | 5,193,714 | Historical station IDs may not match current reference table |
| Start station missing from station reference | 5,082,612 | Historical station IDs may not match current reference table |

Cleaning decisions:

- Keep `fact_trip` faithful to the source so records remain auditable.
- Exclude invalid durations from duration-based marts and KPIs.
- Treat unmatched station IDs as a documented source limitation.
- Use warning-level dbt tests for known public-data limitations.

## 8. Analysis Findings

### KPI Summary

| Metric | Value |
| --- | ---: |
| Total trips in analysis mart | 83,375,574 |
| First trip date | 2015-01-04 |
| Last trip date | 2023-01-15 |
| Average daily trips | 28,592 |
| Highest daily trips | 72,295 |
| Stations with activity | 1,629 |

### Demand Timing

Demand is strongest during commute periods, especially the evening commute.

| Hour | Trips |
| ---: | ---: |
| 17:00 | 8,458,650 |
| 18:00 | 7,919,387 |
| 08:00 | 7,564,750 |
| 16:00 | 5,977,853 |
| 19:00 | 5,170,904 |

The highest single day was **2015-07-09**, with **72,295 trips**. The highest month was **2022-07**, with **1,303,376 trips**.

### Weekday and Weekend Behavior

Thursday had the highest total demand, with **12,671,195 trips**.

Weekday trips totaled **61,766,429**, compared with **21,609,145** weekend trips. Weekend rides were longer on average, at **28.19 minutes**, compared with **19.60 minutes** on weekdays. This suggests weekday usage is more commute-oriented, while weekend usage is more leisure-oriented.

### Station Activity

The busiest station was **Hyde Park Corner, Hyde Park**, with **1,313,799 total arrivals and departures**.

Top stations by activity:

| Station | Total activity |
| --- | ---: |
| Hyde Park Corner, Hyde Park | 1,313,799 |
| Argyle Street, Kings Cross | 1,151,365 |
| Waterloo Station 3, Waterloo | 1,005,646 |
| Albert Gate, Hyde Park | 905,959 |
| Black Lion Gate, Kensington Gardens | 894,505 |

### Station Imbalance

Station imbalance highlights where more bikes leave than arrive, or where more bikes arrive than leave.

Highest departure pressure:

| Station | Net departures |
| --- | ---: |
| Waterloo Station 2, Waterloo | 67,864 |
| Eagle Wharf Road, Hoxton | 41,366 |
| Cloudesley Road, Angel | 34,402 |
| Knightsbridge, Hyde Park | 28,794 |
| Boston Place, Marylebone | 27,420 |

Highest arrival pressure:

| Station | Net departures |
| --- | ---: |
| Hop Exchange, The Borough | -127,481 |
| Holborn Circus, Holborn | -78,908 |
| St. James's Square, St. James's | -68,081 |
| Brushfield Street, Liverpool Street | -52,191 |
| William IV Street, Strand | -45,054 |

## 9. Business Recommendations

- Prioritize bike rebalancing near stations with high positive net departures, especially **Waterloo Station 2**.
- Monitor stations with high negative net departures for dock availability pressure, especially **Hop Exchange**.
- Increase operational coverage during evening commute peaks, especially **17:00-18:00**.
- Treat weekends as more leisure-oriented and plan for longer trip durations.
- Keep duration-based KPIs filtered to valid duration records.
- Add external context such as weather, holidays, or events in a future version to explain demand spikes more precisely.

## 10. Risks, Limitations, and Next Steps

Main limitations:

- Some historical station IDs do not match the current station reference table.
- Weather, events, holidays, and service disruptions are not included.
- The public source table is large, so query discipline is important under free-tier billing.

Recommended next steps:

- Add a dashboard layer in Looker Studio or another BI tool.
- Add scheduled dbt runs if orchestration becomes required.
- Add external datasets for weather and holidays.
- Create station-level maps for operational planning.
- Refine station dimension handling if historical station reference data becomes available.

