/*************************************************************************************
Do-file: 01_prepare_raw_data.do

This .do file converts raw Excel files to Stata .dta format, inspects data structure, 
checks for missing values, and adds quarter-year variable (quarter_year) for future 
analysis 

Author: Maryana Shnitser
Date: 12/30/2025 
**************************************************************************************/
 
*----------------------------------CONVERT TO .DTA-------------------------------------

// Clear environment 
clear all 
set more off 
 
 // Import FEDFUNDS data 
import excel "$data_raw\FEDFUNDS.xlsx", sheet("Quarterly") cellrange(A1:B286) firstrow clear

// Save as .dta file 
save "$data_raw\fedfunds.dta", replace
clear

//Import PCE data
import excel "$data_raw\pce.xlsx", sheet("Quarterly") firstrow clear 

//Save as .dta file 
save "$data_raw\pce.dta", replace
clear


*----------------------INSPECT DATA AND ADD YEAR-QUARTER COLUMN ------------------------
// Access FEDFUNDS dataset 
use "$data_raw/fedfunds.dta", clear

// Use describe and list to understand data structure 
describe
list in 1/5

// Check for missing values 
misstable summarize

// Convert observation_date to quarterly stata date, format, and label
gen quarter_year = qofd(observation_date)
format quarter_year %tq
label var quarter_year "Quarterly date (yyyyqq)"

// Save to data_clean
save "$data_clean\fedfunds_clean.dta", replace

// Access PCE dataset 
use "$data_raw/pce.dta", clear

// Use describe and list to understand data structure 
describe
list in 1/5

// Check for missing values 
misstable summarize

//Convert observation_date to quarterly stata date, format, and label
gen quarter_year = qofd(observation_date)
format quarter_year %tq
label var quarter_year "Quarterly date (yyyyqq)"

// Save to data_clean
save "$data_clean\pce_clean.dta", replace
