# E-Commerce Data Analysis: Sales Performance & Profitability

## 📌 Overview

**End-to-end data analysis of an e-commerce dataset using Google BigQuery (SQL) for data cleaning & analysis, and Looker Studio for interactive dashboards.**

---

### 📦 Data Source
The analysis utilizes an **Online Retail Sales Dataset** covering transactional data from **January 2018 through December 2019**. The dataset contains records for sales transactions, product details, customer information, and geographic locations.

### 🛠️ Tools & Technologies
* **Database & Querying:** **Google BigQuery** (for robust cloud-based data warehousing and processing) and **SQL** (for data manipulation and analysis).
* **Visualization:** **Looker Studio** (for creating interactive, shareable dashboards).

### 🎯 Business Questions
* What is the overall sales trend over time?
* How are we performing against sales targets?
* Which product categories & sub-categories drive the most profit?
* Who are our most valuable customers?
* What is the geographic distribution of sales?

### 📐 Key Metrics Analyzed
The analysis focuses on **Sales**, **Profit**, comparison against **Sales Targets**, and **Customer Profitability**.

### 📊 Key Insights
* 📈 Sales showed growth but high volatility.
* 🎯 Company missed targets in most months; only **Jan 2019** exceeded expectations.
* 💰 **Printers** & **Bookcases** drove most profits; **Tables** & **Electronic Games** lost money.
* 👥 **Seema** was the top profit customer (~$2,000).
* 🌍 **Indore** & **Pune** were most profitable cities; **Chennai** & **Ahmedabad** had losses.

---

## 🚀 How to Use

To explore this project and replicate the analysis:

* **SQL Queries:** Check the **`sql/`** directory for all BigQuery scripts used for data cleaning, transformation, and final analysis.
* **Full Case Study:** View the complete documentation and deep dive into the findings in the **`report/Ecommerce_Analysis.pdf`** file.
* **Visualizations:** See the key screenshots from the final Looker Studio dashboard in the **`report/dashboard_screenshots/`** folder.

---

## 📂 Repository Structure

The repository is organized to separate the analytical code from the documentation:

| Folder/File | Purpose |
| :--- | :--- |
| `sql/` | Contains all BigQuery **SQL scripts** for data cleaning, transformation, feature engineering, and final analysis queries. |
| `report/` | Contains the **full case study PDF** and the dashboard screenshot folder. |
| `report/dashboard_screenshots/` | Contains **screenshots** of the final Looker Studio dashboard. |
| `README.md` | This file: The project overview, methodology, and key findings. |

---

## ➡️ Project Steps & Workflow

This project followed a standard data analysis pipeline:

1.  **Data Ingestion:** The raw e-commerce data was loaded into a dedicated dataset in **Google BigQuery**.
2.  **Data Cleaning & Transformation:** SQL scripts were used to handle missing values, correct data types, and normalize product/customer names.
3.  **Data Analysis:** Final analytical SQL queries were executed to answer the business questions, generating optimized views for visualization.
4.  **Data Visualization:** **Looker Studio** was connected directly to the optimized BigQuery views to build the interactive sales and profitability dashboard.

---

## ⚙️ Getting Started / Prerequisites

To replicate this analysis, you will need the following:

* A **Google Cloud Platform (GCP)** account.
* A GCP project with **BigQuery** enabled.
* Basic knowledge of **SQL** for running the analytical scripts.
* The raw e-commerce dataset (or similar data) loaded into BigQuery.
