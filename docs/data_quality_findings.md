# Data Quality Findings

## dbt Test Run Summary

After classifying known public-source data quality issues as warnings, the dbt test run completed with 17 tests:

- 12 passed
- 5 warning-level source-data quality findings
- 0 errors

These warnings do not mean the dbt pipeline is broken. They show real data quality conditions in the London Bicycles public dataset that need to be documented and handled in the analysis.

## Findings From First Test Run

| Check | Records flagged | Interpretation |
| --- | ---: | --- |
| Non-positive or missing trip duration | 59,292 | Some trips have invalid or missing duration values and should be excluded from duration-based analysis. |
| Null `duration_seconds` in staging | 19,587 | Some source trips are missing duration. |
| Null `start_station_id` in staging | 229,639 | Some trips do not have a usable start station ID. |
| End station missing from station reference | 5,193,714 | Some trip end station IDs are not present in the current station reference table. |
| Start station missing from station reference | 5,082,612 | Some trip start station IDs are not present in the current station reference table. |

## Cleaning Decisions

- Keep `fact_trip` as a faithful trip-level fact table so source issues remain auditable.
- Use `has_invalid_duration` to filter out invalid trips in duration-based analysis marts.
- Treat missing station IDs and unmatched station reference records as known data limitations.
- Do not fail the whole pipeline for known public-source quality issues; keep them as warning-level tests.

## Business Impact

- Demand-over-time analysis remains usable because most trips have valid dates.
- Duration metrics should exclude invalid or missing durations.
- Station-level analysis should acknowledge that some historical station IDs do not match the current station reference table.
- Geographic station maps should be based on stations that successfully match `dim_station`.
