# London Bicycles Project Architecture

```mermaid
flowchart LR
    source["Source Data<br/>London Bicycles<br/>BigQuery Public Dataset"]
    raw["Raw Data Access<br/>bigquery-public-data.london_bicycles<br/>cycle_hire<br/>cycle_stations"]
    warehouse["Data Warehouse<br/>Google BigQuery<br/>Project: vocal-gist-496900-j8<br/>Location: EU"]
    dbt["Transform<br/>dbt Models<br/>staging, dimensions, facts, marts"]
    tests["Data Quality<br/>dbt Tests or SQL Checks<br/>nulls, duplicates, referential integrity, business rules"]
    python["Exploratory Data Analysis<br/>Jupyter Notebook<br/>pandas + SQLAlchemy"]
    outputs["Business Outputs<br/>charts, insights, recommendations"]
    docs["Documentation<br/>architecture diagram, lineage, report"]
    slides["Executive Presentation<br/>10 min presentation<br/>5 min Q&A"]
    optional["Optional Orchestration<br/>Dagster, Airflow, cron, or GitHub Actions"]

    source --> raw
    raw --> warehouse
    warehouse --> dbt
    dbt --> tests
    tests --> dbt
    dbt --> warehouse
    warehouse --> python
    python --> outputs
    outputs --> docs
    outputs --> slides
    dbt --> docs
    optional -. schedules .-> dbt
    optional -. schedules .-> tests

    classDef redTitle fill:#fff,stroke:#d71920,stroke-width:2px,color:#111;
    classDef warehouseStyle fill:#eef6ff,stroke:#4285f4,stroke-width:2px,color:#111;
    classDef transformStyle fill:#fff5f5,stroke:#ff694f,stroke-width:2px,color:#111;
    classDef outputStyle fill:#f4fff4,stroke:#46a35c,stroke-width:2px,color:#111;
    classDef optionalStyle fill:#fafafa,stroke:#777,stroke-dasharray:5 5,color:#111;

    class source,raw redTitle;
    class warehouse warehouseStyle;
    class dbt,tests transformStyle;
    class python,outputs,docs,slides outputStyle;
    class optional optionalStyle;
```

## Plain-English Flow

1. The project starts from the public London Bicycles dataset already hosted in BigQuery.
2. We connect to the source tables through your Google Cloud project.
3. BigQuery acts as the data warehouse.
4. dbt transforms the raw source data into clean staging models, dimensions, fact tables, and analysis marts.
5. Data quality checks validate important rules such as non-null dates, valid durations, unique trip IDs, and station relationships.
6. Python and Jupyter are used for exploratory analysis and charts.
7. The final outputs become the technical documentation, report, and executive slide deck.
8. Orchestration is optional for this assignment, but we can include it as a future enhancement.

