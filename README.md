# 🧱 Sales Analytics SQL Data Warehouse

A scalable, query-optimized SQL data warehouse for unified sales analytics—integrating Microsoft Dynamics GP, CRM, and external sources into a governed, auditable model designed for BI and advanced reporting.

![Status](https://img.shields.io/badge/status-active-brightgreen) ![License](https://img.shields.io/badge/license-MIT-blue) ![Coverage](https://img.shields.io/badge/tests-passing-brightgreen)

---

## ✨ Highlights

- **Unified Sales Model:** Consolidates Dynamics GP and CRM into a harmonized star schema (SalesDetail fact + conformed dimensions).
- **Reliable Pipelines:** Incremental loads with change tracking, idempotent jobs, and retry logic.
- **Data Quality First:** Built-in tests for nulls, duplicates, referential integrity, and business rules.
- **Performance Optimized:** Partitioning, indexing/clustering, statistics maintenance, and query tuning patterns.
- **Audit & Governance:** Row lineage, load metadata, PII handling, and masked views.
- **BI Ready:** Semantic consistency for Power BI/Tableau with curated views and calculations.

---

## 🏗️ Architecture

**Zones**: `landing` → `staging` → `core` (facts/dims) → `marts` (BI-ready)

**Typical Flow**
1. **Ingest**: Extract from GP/CRM (API/ODBC/SQL) to landing (Parquet/CSV/Delta).
2. **Stage**: Normalize, apply data types, enforce keys, deduplicate.
3. **Model**: Build `dim_*` and `fact_*`, apply SCD, derive metrics.
4. **Serve**: Publish reporting views and shared datasets.

> Works with Azure Data Factory / SSIS / Python-based orchestration; compatible with SQL Server, Azure SQL, and Snowflake.

---

## 🧰 Tech Stack

- **Warehouse**: SQL Server / Azure SQL / Snowflake  
- **Pipelines**: Azure Data Factory (or SSIS / Python)
- **Scripting**: T‑SQL / Snowflake SQL, Python for utilities
- **Orchestration/CI**: GitHub Actions / Azure DevOps (optional)
- **BI**: Power BI / Tableau (optional)

---

## 🧩 Data Model (Core Entities)

- **Fact**: `fact_sales_detail`
  - Keys: `order_id`, `order_line_id`, `customer_id`, `product_id`, `sales_date_key`
  - Metrics: `quantity`, `unit_price`, `discount`, `tax`, `net_amount`
- **Dimensions**:
  - `dim_date`, `dim_customer`, `dim_product`, `dim_salesperson`, `dim_territory`
- **SCD Policy**:
  - Type 2 for `dim_customer` and `dim_product` (effective dates, current flag)

---

## 📦 Repository Structure
