# Stata Work Sample: Federal Funds Rate & Personal Consumption

**Author:** Maryana Shnitser  
**Date:** December 2025

## Overview
This project analyzes the relationship between the effective federal funds rate and personal consumption expenditures (PCE) in the U.S., using quarterly data from 1960–2019. It includes data cleaning, merging, and a regression analysis of PCE on lagged federal funds rate and lagged PCE, with a visual comparison of predicted vs. actual values.

## Data Source
[Federal Reserve Economic Data (FRED)](https://fred.stlouisfed.org/), downloaded 12/30/2025:
- **FEDFUNDS** – Effective Federal Funds Rate (averaged by quarter)
- **PCE** – Personal Consumption Expenditures, in billions of dollars (summed by quarter)

## Directory Structure
stata-work-sample/
├── raw_data/ # Original Excel files as downloaded from FRED
├── data_clean/ # Cleaned and merged .dta files
├── do_files/ # Stata do-files (see below)
└── outputs/ # Regression results, graphs, and summary tables

## Do-Files

| File | Description |
|---|---|
| `01_prepare_raw_data.do` | Converts raw Excel files to Stata `.dta` format, inspects data structure, checks for missing values, and adds a `quarter_year` variable |
| `02_merge_data.do` | Merges FEDFUNDS and PCE tables, renames and labels variables, runs summary statistics |
| `03_create_pce_an.do` | Creates a `PCE_AN` variable summing PCE by year |
| `04_regression.do` | Regresses personal consumption (Q1 1960–Q4 2019) on 1-quarter-lagged federal funds rate and 1-quarter-lagged personal consumption |
| `05_predict_and_graph.do` | Generates predicted PCE values and creates a line chart comparing predicted vs. actual PCE |

## How to Run
Run `master.do` from the `do_files/` directory — it calls each do-file in order (01 → 05) and produces the cleaned data and outputs.
