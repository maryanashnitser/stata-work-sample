/*************************************************************************************
Do-file: 04_regression.do

This .do file regresses personal consumption from Q1 1960 to Q4 2019 on the 1-quarter
lagged federal funds rate and 1-quarter-lagged personal consumption

Author: Maryana Shnitser
Date: 12/31/2025 
**************************************************************************************/ 
*-------------------------------REGRESSION----------------------------------------------
// Access 'consumpt' dataaset 
use "$data_clean/consumpt.dta", clear 

// Set time variable
tsset quarter_year, quarterly

// Generate 1-quarter lagged FFR and PCE 
gen FFR_lag = L1.FFR
gen PCE_lag = L1.PCE 

// Check 
list in 1/10

// Regress (period:  Q1 1960 to in Q4 2019)
regress PCE PCE_lag FFR_lag if inrange(quarter_year, tq(1960q1), tq(2019q4)), robust

