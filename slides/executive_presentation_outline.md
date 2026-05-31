# Executive Presentation Outline

## Slide 1: Title

London Bicycles Analytics Pipeline and Business Insights

## Slide 2: Executive Summary

- Built an end-to-end analytics workflow using BigQuery, dbt, and Python.
- Analyzed bike-sharing trips and station activity.
- Focused on demand patterns, station usage, and operational imbalance.

## Slide 3: Business Problem

- When and where is bike demand highest?
- Which stations are most important operationally?
- Where might rebalancing or capacity planning improve service?

## Slide 4: Solution Architecture

- Public BigQuery dataset
- BigQuery warehouse
- dbt transformation and testing
- Python analysis
- Report and recommendations

## Slide 5: Data Warehouse Design

- `fact_trip`
- `dim_station`
- `dim_date`
- demand and station activity marts

## Slide 6: Data Quality

- Null checks
- Duplicate checks
- Duration checks
- Station relationship checks

## Slide 7: Key Findings

- Demand by hour
- Demand by weekday/weekend
- Busiest stations
- Average ride duration

## Slide 8: Operational Recommendations

- Rebalance bikes near high-departure stations.
- Review capacity at high-arrival stations.
- Staff or monitor peak commute periods.
- Investigate low-usage stations for promotion or relocation.

## Slide 9: Risks and Limitations

- Public source data may have missing station references.
- Free-tier cost requires query discipline.
- Weather, holidays, and events are not included yet.

## Slide 10: Next Steps

- Validate source schema.
- Run dbt models and tests.
- Complete Python notebook charts.
- Finalize report and executive deck.

