/*************************************************************************************
Do-file: 02_merge_data.do

This .do file merges FEDFUNDS and PCE tables, renames and labels variables, and 
runs summary statistics 

Author: Maryana Shnitser
Date: 12/30/2025 
**************************************************************************************/ 

*------------------------------MERGE PCE AND FFR------------------------------------------
use "$data_clean\pce_clean.dta"

// Merge FEDFUNDS to PCE by observation_date
merge 1:1 quarter_year using "$data_clean/fedfunds_clean.dta"
 
// Check merge structure and missing values 
describe
list in 1/5
list quarter_year FEDFUNDS PCE if missing(FEDFUNDS) | missing(PCE)

// Drop rows with missing PCE
drop if missing(PCE)

// Drop _merge column 
drop _merge 

// Save merged dataset 
save "$data_clean/fedfunds_pce_merge.dta", replace


*----------------------RENAME VARIABLES-----------------------------------------------
use "$data_clean/fedfunds_pce_merge.dta", clear 

// Rename FEDFUNDS to FFR
rename FEDFUNDS FFR

// Rename PCE 
rename PCE PCE

// label variables
label var FFR "Federal Funds Rate"
label var PCE "Personal Consumption Expenditures"


*------------------------SUMMARY STATISTICS--------------------------------------------
// Summarize FFR and PCE to get count, sample mean, sd 
sum FFR PCE



