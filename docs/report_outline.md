# Report Outline

## 1. Executive Summary

- Business problem
- Dataset used
- Pipeline solution
- Key findings
- Recommended actions

## 2. Data Source and Ingestion

- London Bicycles public dataset in BigQuery
- Source tables used
- Dataset location and access method
- Why direct BigQuery access is appropriate for this project

## 3. Warehouse Design

- Star schema overview
- Dimension tables
- Fact tables
- Schema design justification

## 4. ELT Pipeline

- dbt model layers
- Staging models
- Dimension and fact models
- Analytics marts

## 5. Data Quality

- Null checks
- Duplicate checks
- Referential integrity checks
- Business rule checks
- Known limitations
- First dbt test run found invalid durations, missing start station IDs, and historical station IDs that do not match the current station reference table.

## 6. Python Analysis

- Method
- Metrics calculated
- Charts generated
- Key observations

## 7. Findings and Recommendations

- Demand peaks
- Busiest stations
- Weekday/weekend differences
- Station imbalance
- Operational recommendations

## 8. Risks and Next Steps

- Free-tier query cost control
- Source data limitations
- Optional orchestration
- Future dashboarding
