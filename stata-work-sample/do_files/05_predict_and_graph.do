/*************************************************************************************
Do-file: 05_predict_and_graph.do

This .do file graphs generates predicted PCE values and creates a line chart to 
compare them against actual PCE values  

Author: Maryana Shnitser
Date: 12/31/2025 
**************************************************************************************/ 

*----------------------------------PREDICT PCE-------------------------------------------
// Predict PCE values for dataset using estimated regression coefficients 

/* Note - this does not generate accurate out-of-sample predictions for 2020 Q1-Q2 because 
lagged variables are not constructed outside of the sample
*/

predict PCE_hat, xb


*-------------------------------CREATE LINE GRAPH----------------------------------------
// Restrict dataset to the relevant time period
preserve

keep if inrange(quarter, tq(1960q1), tq(2020q2))

// create line chart
twoway (line PCE quarter_year) (line PCE_hat quarter_year), xtitle("Year and Quarter") ytitle("PCE Value (Billion USD)", margin (0 5 0 0)) legend(order(1 "PCE" 2 "Predicted PCE")) title("Predicted v. Actual Personal Consumption Expenditure Values")

restore

// Export graph
graph export "$outputs/PCE_Predicted_vs_Actual.png", replace
