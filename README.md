## HR Service Call Prediction with Linear Regression (R)

**Project Description:**

This project aims to predict the number of service calls received by a maintenance company each month. We'll use linear regression in R to analyze the relationship between service calls and various weather factors, total members, equipment age, and month of the year. The project follows these steps:

1. **Data Preprocessing:**
    - Load data from the provided CSV file on Canvas.
    - Handle missing values (e.g., remove rows, impute values).
2. **Model Building:**
    - Conduct stepwise regression to identify the most significant predictors for number of service calls.
    - Evaluate model performance using metrics like R-squared and adjusted R-squared.
3. **Model Diagnostics:**
    - Check assumptions of linear regression (linearity, homoscedasticity, normality of errors).
    - Address potential violations (e.g., transformations, transformations combined with model selection).
4. **Model Improvement:**
    - If assumptions are violated, take corrective actions (e.g., data transformations, alternative models).
    - Evaluate the final model's predictive power and discuss limitations.

**Instructions:**

1. **Download Data:** Download the CSV file containing historical data from Canvas and save it in the same directory as this README file and your R script.
2. **Run Script:** Execute the R script  to perform the analysis.

**Output:**

- The R script will create visualizations and print results, including:
    - Summary of the initial model and stepwise regression output.
    - Diagnostic plots (e.g., residual plots) to assess assumptions.
    - Evaluation metrics (R-squared, adjusted R-squared) for the final model.
    - Discussion of model limitations and potential improvements.

**Software Requirements:**

- R (programming language)
- Required R packages (likely to include `tidyverse`, `stepAIC`, `ggplot2`) - Specify the exact packages used in your script.


