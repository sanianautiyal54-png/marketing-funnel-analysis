# 📊 Marketing Funnel Analysis

## 📌 Project Overview

This project analyzes the marketing funnel of an e-commerce marketplace using the **Olist Marketing Funnel dataset**.

The objective is to understand how marketing qualified leads (MQLs) move through the sales funnel, measure conversion performance, identify high-performing lead sources, and analyze closed deals.

This project demonstrates an end-to-end data analytics workflow using:

- **Microsoft Excel**
- **SQL Server**
- **Power BI**
- **DAX**

---

## 🎯 Business Objectives

The analysis focuses on answering the following questions:

- How many Marketing Qualified Leads (MQLs) entered the funnel?
- How many leads converted into closed deals?
- What is the overall conversion rate?
- Which lead origins have the highest conversion rates?
- Which channels generate the most leads?
- Which lead types contribute most to closed deals?
- Which business segments contribute most to closed deals?
- How do closed deals change over time?
- Where are the biggest opportunities to improve funnel performance?

---

## 🗂️ Dataset

The project uses two datasets from the Olist Marketing Funnel dataset.

### 1. Marketing Qualified Leads

**File:** `olist_marketing_qualified_leads_dataset.csv`

Contains approximately **8,000 marketing qualified leads**.

Important columns:

- `mql_id`
- `first_contact_date`
- `landing_page_id`
- `origin`

### 2. Closed Deals

**File:** `olist_closed_deals_dataset.csv`

Contains approximately **842 closed deals**.

Important columns:

- `mql_id`
- `seller_id`
- `sdr_id`
- `sr_id`
- `won_date`
- `business_segment`
- `lead_type`
- `lead_behaviour_profile`
- `has_company`
- `has_gtin`
- `average_stock`
- `business_type`
- `declared_product_catalog_size`
- `declared_monthly_revenue`

The common key between the two datasets is:

`mql_id`

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Excel | Data preparation, formulas, PivotTables and initial analysis |
| SQL Server | Data storage, joins, aggregations and analysis |
| Power BI | Interactive dashboard and visualization |
| DAX | Measures and KPI calculations |
| GitHub | Project documentation and portfolio |

---

## 🔄 Project Workflow

```text
Raw CSV Data
      ↓
Excel Data Exploration
      ↓
SQL Server Import
      ↓
SQL Analysis
      ↓
Power BI Data Model
      ↓
DAX Measures
      ↓
Interactive Dashboard
      ↓
Business Insights
