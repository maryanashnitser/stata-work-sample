/*************************************************************************************
MASTER FILE 

Project: Notre Dame Population Analytics Predoctoral Research Associate Stata Exercise  
Author: Maryana Shnitser 
Date: 12/30/2025 

Data Source: Federal Reserve Economic Data (FRED)
Data Downloaded: 12/30/2025
	- Effective Federal Funds Rate (FEDFUNDS) - averaged by quarter
	- Personal Consumption Expenditures, in billions of dollars (PCE) - summed by quarter
	
Directory Structure: 
	- Shnitser_NDPop
		- raw data
		- data_clean 
		- do_files
		- outputs
**************************************************************************************/ 

// Clear environment 
clear all 

// Stata setting 
version 19.5 

// Set overall directory 
global dir "H:/Shnitser-NDPop"

// Define additional directory paths 
global data_raw "$dir/data_raw"
global data_clean "$dir/data_clean"
global do_files "$dir/do_files"
global outputs "$dir/outputs"

// Start log file
log using "$outputs/master_log.txt", replace text

// Run sub-do files 
do "$do_files/01_prepare_raw_data.do"
do "$do_files/02_merge_data.do"
do "$do_files/03_create_pce_an.do"
do "$do_files/04_regression.do"
do "$do_files/05_predict_and_graph.do"

// Close log file
log close

