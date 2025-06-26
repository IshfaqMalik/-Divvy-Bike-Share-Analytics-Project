# 🚲 Divvy Bike Share Analytics Project
**Azure Synapse Analytics + PostgreSQL Integration**

---

## 📌 Project Summary

This project builds a cloud-based data warehouse in **Azure Synapse Analytics** using public Divvy Bike Share data from Chicago. The goal is to analyze ride behavior and payment trends to support key business outcomes.

---

## 📂 Tasks Overview

### 🛠 Task 1: Azure Resources Setup

✅ Steps:
- [x] **Azure Database for PostgreSQL** – OLTP source system  
- [x] **Azure Synapse Workspace** – Data warehouse  
- [x] **Serverless SQL Pool** – Used for querying & transformation  
- ❗️Note: No dedicated SQL pool used (only serverless pool supported in lab)

📸 _Screenshot_: *PostgreSQL and Synapse resource setup*  
🖼️ `Azureresources.png`

---

### ⭐ Task 2: Star Schema Design

You designed a **star schema** based on:
- Business goals (duration, spending, rider behavior)
- Source relational schema from PostgreSQL

📁 Schema includes:
- `fact_rides`  
- `fact_payment`  
- `dim_rider`  
- `dim_station`  
- `dim_date` (excluded in your case)  
- `dim_time` (optional)  

📸 _Screenshot_: *ERD / Star Schema*  
🖼️ `images/task2_star_schema.png`

---

### 📃 Task 3: Create Data in PostgreSQL

✅ Used Python script: `ProjectDataToPostgres.py`  
- Populates 4 tables in PostgreSQL with CSV data  
- Verified using pgAdmin  

📸 _Screenshot_: *PostgreSQL table preview*  
🖼️ `images/task3_postgres_tables.png`

---

### 📄 Task 4: Extract Data to Azure Blob Storage

✅ Used **Synapse Ingest Wizard** to extract data from PostgreSQL to Azure Blob Storage.  
- Data for all 4 tables exported as `.csv` files  
- Files now accessible via Data Lake Linked Service

📸 _Screenshot_: *Ingest pipeline overview*  
🖼️ `images/task4_extract_pipeline.png`

---

### 📅 Task 5: Load Data into External Tables

✅ Used **auto-generated scripts** to create **external staging tables** in serverless SQL pool.  
- Loaded CSVs into Synapse external tables using `CREATE EXTERNAL TABLE`

📸 _Screenshot_: *External table setup in Synapse*  
🖼️ `images/task5_external_tables.png`

---

### 🔄 Task 6: Transform to Star Schema (CETAS)

✅ Used **CETAS (Create External Table AS SELECT)** to:
- Join & transform staging data
- Materialize star schema tables (`fact_rides`, `fact_payment`, etc.)

🧹 Highlights:
- Defined file format `SynapseDelimitedTextFormat`
- Reused external data source
- Created output folders like `/fact_payment/`, `/fact_rides/`

📸 _Screenshot_: *CETAS transformation in Synapse Studio*  
🖼️ `images/task6_cetas_fact_payment.png`

---

## 🔎 Sample Analytics Questions

💬 **Ride Analysis**
- Average duration by station and hour
- Member vs. casual rider behavior
- Rider age impact on ride length

💬 **Payment Analysis**
- Total revenue by quarter
- Member spending by age
- Cost per ride / per rider / per month

---

## ✅ Deliverables

- ☑️ Star schema with `fact_rides` and `fact_payment`
- ☑️ Working serverless SQL queries over external tables
- ☑️ Screenshots showing setup, data flow, and CETAS outputs
- ☑️ Blob Storage linked with Synapse Workspace

---

## 📌 Notes

- No `dim_date` table used: all temporal features derived from timestamps
- External tables are **read-only views** into blob storage
- Star schema transformations are persisted as **partitioned CSVs** in Data Lake

