/*************************************************************************************
Do-file: 03_create_pce_an.do

This .do file create a PCE_AN variable that sums PCE by year 

Author: Maryana Shnitser
Date: 12/30/2025 
**************************************************************************************/ 

*------------------------CALCULATE PCE_AN----------------------------------------------
// Create year and quarter columns from 'quarter_year' column
 gen year = year(quarter_year)
 label var year "Observation Year"

// Create and calculate PCE_AN variable - total personal consumption by calendar year 
egen PCE_AN = sum(PCE), by(year)
label var PCE_AN "Total Personal Consumption per Year"

// Save dataset as consumpt.dta
save "$data_clean/consumpt.dta", replace
