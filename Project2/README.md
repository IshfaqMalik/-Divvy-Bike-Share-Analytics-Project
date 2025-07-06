
# 🚴‍♂️ Bike Trips Lakehouse Analytics Project

## Overview

This project implements a **Lakehouse architecture** using **Azure Databricks** and **Delta Lake** to analyze bike-sharing data. It follows a classic **ETL pipeline** with Bronze, Silver, and Gold data layers, and is designed to meet specific **business outcomes** related to rider behavior, trip patterns, and payment trends.

The final data model uses a **star schema** with two fact tables — one for trip data and another for payment data — and several shared dimension tables. This model supports efficient analytical queries using Spark and Delta.

## 🔧 Technologies Used

- **Azure Databricks**
- **Apache Spark (PySpark)**
- **Delta Lake**
- **Azure Data Lake Storage (ADLS)**
- **Lakehouse Architecture (Bronze, Silver, Gold layers)**

## 📊 Business Outcomes Addressed

1. Analyze time spent per ride:
   - By day of week and time of day
   - By starting and ending station
   - By rider's age at time of trip
   - By rider type (Member vs. Casual)

2. Analyze money spent:
   - Per month, quarter, and year
   - By member and their age at account start
   - (Extra Credit) Based on rides/minutes per month

## 🧱 Star Schema Design

### 🧾 Fact Tables

#### `fact_trips`
- `trip_id`
- `rider_id` (FK)
- `start_station_id` (FK)
- `end_station_id` (FK)
- `date_id` (FK)
- `duration_mins`
- `rider_age_at_trip`
- `is_member`

#### `fact_payments`
- `payment_id`
- `rider_id` (FK)
- `date_id` (FK)
- `amount`
- `payment_method`

### 📐 Dimension Tables

#### `dim_riders`
- `rider_id`
- `account_start_date`
- `birth_year`
- `is_member`
- `age_at_account_start`

#### `dim_stations`
- `station_id`
- `name`
- `latitude`
- `longitude`

#### `dim_dates`
- `date_id`
- `year`
- `month`
- `quarter`
- `day_of_week`
- `hour`
- `date`

## 🪄 ETL Pipeline

### 1. Extract (Bronze Layer)
- Read raw `.csv` files from `/FileStore` or ADLS
- Write raw data to Delta format (`bronze_` tables)

### 2. Transform (Silver Layer)
- Clean and normalize Bronze data
- Join tables as needed and enrich records
- Save as intermediate Delta tables (`silver_` tables)

### 3. Load (Gold Layer)
- Build star schema
- Compute fact metrics: duration, age, revenue
- Write output as Delta tables with `overwrite` mode (`gold_` tables)

## 📂 Project Structure

.
├── notebooks/
│   ├── 01_extract_bronze.ipynb
│   ├── 02_transform_silver.ipynb
│   ├── 03_load_gold.ipynb
│   └── 04_analysis_queries.ipynb
├── README.md
├── schema_diagram.png (optional)
└── data/ (CSV files or mounted paths)

## ✅ How to Run

1. Import the notebooks into Azure Databricks workspace.
2. Run `01_extract_bronze.ipynb` to read raw CSVs and write to Delta bronze tables.
3. Run `02_transform_silver.ipynb` to clean and stage silver data.
4. Run `03_load_gold.ipynb` to create star schema tables.
5. (Optional) Run `04_analysis_queries.ipynb` to explore insights.

## 📈 Output Tables

- `gold_fact_trips`
- `gold_fact_payments`
- `gold_dim_riders`
- `gold_dim_stations`
- `gold_dim_dates`

## 🏅 Extra Credit

- Metrics for average rides and minutes per rider per month are implemented in `04_analysis_queries.ipynb`.

## 📌 Notes

- All Delta tables use **overwrite** mode for reproducibility.
- Datetime parsing and age calculations are handled using Spark functions.
- Missing values are cleaned at the silver layer.
- Partitioning is optional but can be added for performance (e.g., partition by `year` in fact tables).

## 📬 Contact

For questions or enhancements, reach out via Databricks notebook comments or GitHub issues (if applicable).
