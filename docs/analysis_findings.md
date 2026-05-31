# Analysis Findings

This summary was extracted from the completed notebook `analysis/london_bicycles_analysis_starter.ipynb`.

## KPI Summary

| Metric | Value |
| --- | ---: |
| Total trips in analysis mart | 83,375,574 |
| First trip date | 2015-01-04 |
| Last trip date | 2023-01-15 |
| Average daily trips | 28,592 |
| Highest daily trips | 72,295 |
| Stations with activity | 1,629 |

## Demand Patterns

The highest single-day demand was on **2015-07-09**, with **72,295 trips**.

Top demand days:

| Date | Trips | Average duration minutes | Median duration minutes |
| --- | ---: | ---: | ---: |
| 2015-07-09 | 72,295 | 43.61 | 22 |
| 2020-05-30 | 69,032 | 49.95 | 25 |
| 2022-08-19 | 66,409 | 27.14 | 19 |
| 2020-05-25 | 65,924 | 50.49 | 25 |
| 2022-06-21 | 64,194 | 24.90 | 19 |

Top demand months:

| Month | Trips | Average duration minutes |
| --- | ---: | ---: |
| 2022-07 | 1,303,376 | 21.72 |
| 2022-06 | 1,268,701 | 22.10 |
| 2022-08 | 1,249,038 | 21.68 |
| 2018-07 | 1,239,205 | 22.72 |
| 2021-09 | 1,208,914 | 20.11 |

## Hourly Demand

Peak usage is concentrated around evening commute hours.

Top start hours:

| Hour | Trips | Average duration minutes |
| ---: | ---: | ---: |
| 17:00 | 8,458,650 | 20.79 |
| 18:00 | 7,919,387 | 20.65 |
| 08:00 | 7,564,750 | 15.83 |
| 16:00 | 5,977,853 | 23.98 |
| 19:00 | 5,170,904 | 20.91 |

## Weekday and Weekend Demand

Thursday had the highest total demand, with **12,671,195 trips**.

| Day | Weekend | Trips | Average duration minutes |
| --- | --- | ---: | ---: |
| Sunday | Yes | 10,327,236 | 28.61 |
| Monday | No | 11,703,934 | 19.82 |
| Tuesday | No | 12,609,391 | 18.25 |
| Wednesday | No | 12,588,042 | 19.46 |
| Thursday | No | 12,671,195 | 19.65 |
| Friday | No | 12,193,867 | 20.79 |
| Saturday | Yes | 11,281,909 | 27.77 |

Weekday trips total **61,766,429**, while weekend trips total **21,609,145**. Weekend rides are longer on average at **28.19 minutes**, compared with **19.60 minutes** on weekdays.

## Busiest Stations

The busiest station by combined arrivals and departures is **Hyde Park Corner, Hyde Park**, with **1,313,799 total trips**.

Top stations by total activity:

| Station | Departures | Arrivals | Total activity | Net departures |
| --- | ---: | ---: | ---: | ---: |
| Hyde Park Corner, Hyde Park | 658,129 | 655,670 | 1,313,799 | 2,459 |
| Argyle Street, Kings Cross | 579,703 | 571,662 | 1,151,365 | 8,041 |
| Waterloo Station 3, Waterloo | 512,990 | 492,656 | 1,005,646 | 20,334 |
| Albert Gate, Hyde Park | 451,863 | 454,096 | 905,959 | -2,233 |
| Black Lion Gate, Kensington Gardens | 451,696 | 442,809 | 894,505 | 8,887 |
| Hop Exchange, The Borough | 374,920 | 502,401 | 877,321 | -127,481 |
| Waterloo Station 1, Waterloo | 407,848 | 390,908 | 798,756 | 16,940 |

## Station Imbalance

Positive net departures indicate stations where more trips start than end. Negative net departures indicate stations where more trips end than start.

Highest departure pressure:

| Station | Departures | Arrivals | Net departures |
| --- | ---: | ---: | ---: |
| Waterloo Station 2, Waterloo | 243,259 | 175,395 | 67,864 |
| Eagle Wharf Road, Hoxton | 215,140 | 173,774 | 41,366 |
| Cloudesley Road, Angel | 90,573 | 56,171 | 34,402 |
| Knightsbridge, Hyde Park | 110,194 | 81,400 | 28,794 |
| Boston Place, Marylebone | 152,690 | 125,270 | 27,420 |

Highest arrival pressure:

| Station | Departures | Arrivals | Net departures |
| --- | ---: | ---: | ---: |
| Hop Exchange, The Borough | 374,920 | 502,401 | -127,481 |
| Holborn Circus, Holborn | 219,536 | 298,444 | -78,908 |
| St. James's Square, St. James's | 213,229 | 281,310 | -68,081 |
| Brushfield Street, Liverpool Street | 314,535 | 366,726 | -52,191 |
| William IV Street, Strand | 204,712 | 249,766 | -45,054 |

## Draft Executive Findings

- Peak hour: **17:00**, with **8,458,650 trips**.
- Busiest day of week: **Thursday**, with **12,671,195 trips**.
- Busiest station: **Hyde Park Corner, Hyde Park**, with **1,313,799 total arrivals and departures**.
- Highest departure pressure: **Waterloo Station 2, Waterloo**, with **67,864 net departures**.
- Highest arrival pressure: **Hop Exchange, The Borough**, with **127,481 more arrivals than departures**.

## Recommendations

- Prioritize bike rebalancing around stations with high positive net departures, especially Waterloo Station 2.
- Monitor stations with high negative net departures for dock availability pressure, especially Hop Exchange.
- Provide stronger operational coverage during evening commute peaks, especially 17:00-18:00.
- Treat weekend usage as more leisure-oriented because average ride durations are materially longer.
- Exclude invalid or missing durations from duration-based KPIs.
- Clearly document that some historical station IDs do not match the current station reference table.

## Extracted Charts

- `docs/charts/daily_demand.png`
- `docs/charts/monthly_demand.png`
- `docs/charts/hourly_demand.png`
- `docs/charts/weekday_demand.png`
- `docs/charts/top_station_activity.png`
- `docs/charts/station_imbalance.png`

