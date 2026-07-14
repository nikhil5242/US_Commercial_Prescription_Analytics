# US Commercial Prescription Analytics & Market Access Dashboard using Medicare Part D Data

## Project Overview

This project presents an end-to-end commercial healthcare analytics solution built using publicly available Medicare Part D datasets from the Centers for Medicare & Medicaid Services (CMS). The objective is to simulate a real-world pharmaceutical commercial analytics workflow similar to those used by organizations such as Bristol Myers Squibb (BMS), IQVIA, and other healthcare analytics companies.

The project focuses on analyzing physician prescribing behavior, prescription drug spending, geographic prescription trends, manufacturer performance, and commercial business opportunities through SQL, Python, and Power BI.

The complete analytics pipeline covers business understanding, SQL ETL, data quality validation, feature engineering, exploratory data analysis (EDA), KPI development, business insights, and interactive dashboard development.

---

# Business Problem

A pharmaceutical commercial analytics team wants to answer the following business questions:

- Which drugs generate the highest prescription spending?
- Which physicians contribute the highest prescription volume?
- Which physician specialties drive prescription demand?
- Which states have the highest commercial opportunity?
- Which manufacturers dominate prescription spending?
- Which physicians should commercial sales teams prioritize?
- Which drugs contribute the largest share of overall healthcare spending?

The objective is to transform raw prescription datasets into actionable commercial insights that support strategic decision-making.

---

# Project Objectives

- Build an end-to-end healthcare analytics solution.
- Perform data cleaning and quality validation using SQL.
- Engineer meaningful business features for commercial analysis.
- Conduct exploratory data analysis using Python.
- Identify prescribing patterns across physicians, drugs, and geographic regions.
- Develop commercial KPIs for healthcare analytics.
- Generate business insights to support pharmaceutical decision-making.
- Design an interactive Power BI dashboard for executive reporting.

---

# Technology Stack

| Category | Tools |
|-----------|-------|
| Database | PostgreSQL |
| SQL | PostgreSQL SQL |
| Programming | Python |
| Libraries | Pandas, NumPy, Matplotlib, Seaborn |
| Dashboard | Power BI |
| IDE | Visual Studio Code, Jupyter Notebook |

---

# Datasets Used

The project uses publicly available datasets published by the Centers for Medicare & Medicaid Services (CMS).

### Dataset 1
**Medicare Part D Prescribers by Provider**

Used for:
- Physician Analysis
- Specialty Analysis
- High-Value Prescriber Identification
- Prescription Volume Analysis

---

### Dataset 2
**Medicare Part D Prescribers by Geography and Drug**

Used for:
- State-wise Prescription Analysis
- Geographic Demand Analysis
- Territory Performance

---

### Dataset 3
**Medicare Part D Spending by Drug**

Used for:
- Drug Spending Analysis
- Manufacturer Performance
- Commercial Market Share Analysis
- Brand Performance

> Due to GitHub file size limitations, the original datasets are not included in this repository. They can be downloaded directly from the official CMS Data Portal.

---

# Project Workflow

```
Business Understanding
        ↓
Data Understanding
        ↓
SQL ETL
        ↓
Data Cleaning
        ↓
Data Validation
        ↓
Feature Engineering
        ↓
Python Exploratory Data Analysis
        ↓
Commercial Business Rule Analysis
        ↓
KPI Development
        ↓
Business Insights
        ↓
Power BI Dashboard
        ↓
Business Recommendations
```

---

# SQL Data Preparation

The SQL workflow includes:

- Data Import
- Data Cleaning
- Duplicate Detection
- Missing Value Validation
- Business Rule Validation
- Feature Engineering

### Data Validation Rules

- No negative prescription counts
- No negative drug costs
- Missing physician specialties identified
- Missing state information validated
- Invalid drug names removed
- Duplicate records checked

---

# Feature Engineering

The following business features were created:

- Cost Per Claim
- Average Cost Per Beneficiary
- High Value Prescriber Flag
- High Cost Drug Flag
- Prescription Volume Category
- Drug Spending Category
- State Prescription Tier
- Prescriber Decile
- Market Share Percentage

These engineered features improve downstream business analysis and dashboard reporting.

---

# Exploratory Data Analysis (EDA)

EDA was performed using Python to understand the overall characteristics of the datasets.

The analysis included:

### Data Quality

- Dataset Shape
- Missing Values
- Duplicate Records
- Data Types

### Univariate Analysis

- Prescription Claims Distribution
- Drug Spending Distribution
- Beneficiary Distribution
- Cost Per Claim Distribution

### Outlier Detection

- Boxplots
- Interquartile Range (IQR)

### Top Analysis

- Top Drugs
- Top Manufacturers
- Top Physician Specialties
- Top Prescribers
- Top States

### Bivariate Analysis

- Claims vs Drug Cost
- Beneficiaries vs Spending
- State vs Drug Cost
- Specialty vs Spending

### Correlation Analysis

Correlation Heatmap was used to understand relationships among key numerical variables.

---

# Commercial Business Analysis

The project includes business analyses commonly used in pharmaceutical commercial analytics.

### Prescriber Decile Analysis

Physicians were segmented into performance deciles based on prescription volume to identify high-value prescribers.

### Pareto Analysis

Evaluated whether a small percentage of drugs contribute to the majority of prescription spending.

### Market Concentration Analysis

Analyzed the concentration of prescriptions among physicians and manufacturers.

### Geographic Penetration Analysis

Compared prescription demand across states to identify high-performing and underperforming territories.

---

# Key Performance Indicators (KPIs)

The dashboard reports the following commercial KPIs:

- Total Prescriptions
- Total Drug Spending
- Total Physicians
- Total Drugs
- Average Cost per Claim
- Total Beneficiary
- Average Cost per Beneficiary
- Average Cost per Physician
- Average Prescriptions per Physician
- Average Beneficiaries per Physician

---

# Dashboard Overview

## Page 1 – Commercial Prescription Overview

The first dashboard page provides an executive summary of commercial prescription performance.

Visualizations include:

- KPI Cards
- Top Drugs
- Top Specialties
- Top Prescribers
- Prescription Distribution
- Drug Cost Distribution
- Claims vs Cost Scatter Plot
- Pareto Analysis

---

## Page 2 – Territory & Market Analytics

The second dashboard focuses on geographic and market-level insights.

Visualizations include:

- State-wise Prescription Map
- Drug Spending by State
- Manufacturer Market Share
- Territory Performance
- Prescription Distribution by Geography
- Commercial Market Insights

---

# Business Insights

Some of the key insights generated include:

- A small percentage of drugs contribute to a significant share of total prescription spending.
- High-value physicians account for a disproportionate percentage of prescription claims.
- Prescription demand varies considerably across different states.
- Certain physician specialties consistently drive higher prescription volumes.
- Drug spending is concentrated among a limited number of manufacturers.
- Commercial opportunities exist in underpenetrated geographic markets.

---

# Repository Structure

```
US_Commercial_Prescription_Analytics/
│
├── Data/
│   ├── Dataset_Download_Instructions.md
│   
├── SQL/
│   ├── Data_Cleaning.sql
│   ├── Validation.sql
│   └── Feature_Engineering.sql
│
├── Python/
│   └── EDA.ipynb
│
├── PowerBI/
│   └── Commercial_Prescription_Analytics_Dashboard.pdf
│
└── README.md
```

---

# How to Run the Project

1. Download the datasets from the CMS Data Portal.
2. Import the datasets into PostgreSQL.
3. Execute the SQL scripts in the following order:
   - ETL.sql
   - Data_Cleaning.sql
   - Validation.sql
   - Feature_Engineering.sql
4. Open and run the Python EDA notebook.
5. Open the Power BI dashboard file to explore the interactive reports.

---

# Skills Demonstrated

- SQL
- PostgreSQL
- Data Cleaning
- Data Validation
- Feature Engineering
- Exploratory Data Analysis
- Healthcare Analytics
- Commercial Analytics
- Python
- Power BI
- Data Visualization
- Business Intelligence
- KPI Development
- Business Insights
- Git
- GitHub

---

# Acknowledgements

This project uses publicly available Medicare Part D datasets provided by the Centers for Medicare & Medicaid Services (CMS). The project was developed solely for educational and portfolio purposes to demonstrate healthcare commercial analytics and business intelligence skills.
