
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
- `rideable_type`
-  `Started_At` 
- `start_station_id` (FK)
-  `Ended_At` 
- `end_station_id` (FK)
- `duration`


#### `fact_payments`
- `payment_id`
- `rider_id` (FK)
- `date` (FK)
- `amount`


### 📐 Dimension Tables

#### `dim_riders`
- `rider_id`
- `first`
- `last`
- `birthday`
- `account_start_date`
- `account_start_date`
- `is_member`
- `age`

#### `dim_stations`
- `station_id`
- `name`
- `latitude`
- `longitude`

#### `dim_dates`
- `full_datetime`
- `date`
- `year`
- `month`
- `qtr`
- `week`
- `day_of_week`
- `hour`
- `time_of_the_day`

## 🪄 ETL Pipeline

### 1. Extract (Bronze Layer)
- Read raw `.csv` files from `/FileStore` or ADLS


### 2. Transform & Load (Silver Layer)
- Clean and normalize Bronze data
- Join tables as needed and enrich records
- Write output as Delta tables with `overwrite` mode (tables)



## 📂 Project Structure

.
├── notebooks/
│   ├── divy_bikeshare_dataset.ipynb
├── README.md
├── schema_diagram.pdf



## ✅ How to Run

1. Import the notebooks into Azure Databricks workspace.
2. Run `divy_bikeshare_dataset.ipynb` to read raw CSVs and write to Delta  tables.
3.

## 📈 Output Tables

- `fact_trips`
- `fact_payments`
- `dim_riders`
- `dim_stations`
- `dim_dates`



## 📌 Notes

- All Delta tables use **overwrite** mode for reproducibility.
- Datetime parsing and age calculations are handled using Spark functions.
- Missing values are cleaned at the silver layer.
- Partitioning is optional but can be added for performance (e.g., partition by `year` in fact tables).

## 📬 Contact

For questions or enhancements, reach out via Databricks notebook comments or GitHub issues (if applicable).
