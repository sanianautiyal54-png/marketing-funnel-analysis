# Marketing Funnel Analysis

## 📌 Project Overview

This project analyzes a marketing funnel using the **Olist Marketing Funnel** dataset.

The objective is to understand how marketing-qualified leads (MQLs) progress to closed deals, identify drop-off points, compare lead origins, and analyze successful deals by lead type, business segment, and time.

The project follows an end-to-end data analytics workflow:

**Excel → SQL Server → Power BI**

> **Note:** Excel is used for initial exploration and validation. SQL Server is used for data analysis. Power BI is the final visualization and dashboarding tool.

---

## 🎯 Business Objectives

The analysis aims to answer:

- How many marketing-qualified leads were generated?
- How many leads became closed deals?
- What is the overall MQL-to-closed-deal conversion rate?
- How large is the funnel drop-off?
- Which lead origins generate the most leads?
- Which lead origins have the highest conversion rates?
- Which lead types are most common among closed deals?
- Which business segments contribute the most closed deals?
- How do closed deals change over time?

---

## 📂 Dataset

The project uses two Olist CSV files:

### 1. Marketing Qualified Leads

`olist_marketing_qualified_leads_dataset.csv`

Contains approximately **8,000 MQLs**.

Important columns:

- `mql_id` — unique marketing-qualified lead ID
- `first_contact_date` — date of first contact
- `landing_page_id` — landing page associated with the lead
- `origin` — source/origin of the lead

### 2. Closed Deals

`olist_closed_deals_dataset.csv`

Contains approximately **842 closed deals**.

Important columns include:

- `mql_id` — links the deal back to the marketing lead
- `seller_id`
- `won_date`
- `business_segment`
- `lead_type`
- `lead_behaviour_profile`
- `business_type`
- `declared_monthly_revenue`

The two datasets are connected using:

```text
mql_id
```

---

## 🔄 Funnel

The main funnel analyzed in this project is:

```text
Marketing Qualified Leads
          ↓
     Closed Deals
```

### Key Results

| Metric | Result |
|---|---:|
| Marketing Qualified Leads | 8,000 |
| Closed Deals | 842 |
| Drop-offs | 7,158 |
| Overall Conversion Rate | 10.53% |
| Drop-off Rate | 89.48% |

### Conversion Formula

```text
Conversion Rate = Closed Deals / MQLs × 100
```

```text
842 / 8,000 × 100 = 10.53%
```

---

## 📊 Excel Analysis

Excel was used for initial data exploration and validation.

The Excel workbook contains:

- MQL data
- Closed deal data
- Funnel analysis
- Lead-origin analysis
- Conversion calculations
- Supporting charts

The Excel analysis identified differences in conversion performance across lead origins.

### Important interpretation

A lead origin with the highest number of leads is not necessarily the best-performing source.

For example, a source may generate many MQLs but have a relatively low conversion rate. Therefore, both **lead volume** and **conversion rate** should be considered.

---

## 🗄️ SQL Server Analysis

The datasets were imported into SQL Server using two tables:

```text
marketing_qualified_leads
closed_deals
```

### Main SQL analyses

1. Overall funnel performance
2. MQL-to-closed-deal conversion
3. Drop-off analysis
4. Conversion by lead origin
5. Lead volume by origin
6. Closed deals by lead type
7. Closed deals by business segment
8. Monthly closed deals

### Example SQL

```sql
SELECT
    COUNT(DISTINCT m.mql_id) AS total_mqls,
    COUNT(DISTINCT c.mql_id) AS closed_deals,
    COUNT(DISTINCT m.mql_id) - COUNT(DISTINCT c.mql_id) AS drop_offs,
    CAST(
        COUNT(DISTINCT c.mql_id) * 100.0
        / COUNT(DISTINCT m.mql_id)
        AS DECIMAL(10,2)
    ) AS conversion_rate
FROM marketing_qualified_leads m
LEFT JOIN closed_deals c
    ON m.mql_id = c.mql_id;
```

---

## 📈 Power BI Dashboard

Power BI is used as the **final visualization and dashboarding layer**.

The planned dashboard includes:

### KPI Cards

- Total MQLs
- Closed Deals
- Conversion Rate
- Drop-offs

### Visualizations

- Marketing funnel
- Conversion rate by lead origin
- Lead volume by origin
- Closed deals by lead type
- Closed deals by business segment
- Monthly closed deals trend

### Filters / Slicers

- Lead origin
- Lead type
- Business segment
- Date

---

## 🔍 Key Findings

- **8,000** marketing-qualified leads were analyzed.
- **842** leads became closed deals.
- The overall MQL-to-closed-deal conversion rate is **10.53%**.
- **7,158 leads** did not become closed deals.
- Lead origin shows meaningful differences in conversion performance.
- Lead volume and lead quality should be evaluated together rather than relying on volume alone.
- Closed-deal composition can be further understood through lead type and business segment analysis.

---

## 🛠️ Tools Used

- **Microsoft Excel** — initial data exploration and validation
- **SQL Server / SSMS** — data querying and analysis
- **Power BI Desktop** — final dashboard and visualization
- **GitHub** — project documentation and version control

---

## 📁 Suggested Repository Structure

```text
Marketing-Funnel-Analysis/
│
├── README.md
│
├── data/
│   ├── olist_marketing_qualified_leads_dataset.csv
│   └── olist_closed_deals_dataset.csv
│
├── excel/
│   └── Marketing Funnel Analysis - Excel Completed.xlsx
│
├── sql/
│   └── marketing_funnel_analysis.sql
│
└── powerbi/
    └── Marketing Funnel Analysis.pbix
```

> If the original dataset license or repository rules restrict redistributing the CSV files, keep the raw data out of GitHub and provide instructions for obtaining it instead.

---

## 🚀 Project Workflow

```text
Raw CSV Data
     ↓
Excel Exploration
     ↓
SQL Server
     ↓
Data Analysis
     ↓
Power BI
     ↓
Interactive Dashboard
     ↓
Business Insights & Recommendations
```

---

## 💡 Business Recommendations

Based on the analysis, marketing teams should:

1. Evaluate lead sources using both **volume and conversion rate**.
2. Investigate low-converting sources for potential targeting or lead-quality issues.
3. Prioritize channels that consistently produce higher-quality leads.
4. Monitor closed deals over time to identify changes in performance.
5. Use lead type and business-segment information to understand which customer groups are most valuable.

---

## 📚 Dataset Source

The project uses the **Olist Marketing Funnel** dataset available through Kaggle.

Dataset:
https://www.kaggle.com/datasets/olistbr/marketing-funnel-olist

---

## 👤 Author

**Marketing Funnel Analysis Project**

Built as an end-to-end data analytics project using:

**Excel + SQL Server + Power BI**
