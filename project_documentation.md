# Customer Churn & Retention Analysis

## 1. Project Overview

This project analyzes customer churn in a telecommunications company using the IBM Telco Customer Churn dataset. The objective is to understand customer attrition patterns, identify customer segments with higher churn rates, and provide data-driven recommendations to improve customer retention.

## 2. Business Problem

Customer churn affects business growth and recurring revenue. The company needs to understand which customer groups are more likely to leave and identify opportunities to improve retention.

## 3. Business Objectives

- Calculate the overall customer churn rate.
- Identify customer segments with higher churn rates.
- Analyze churn based on contract type, tenure, internet service, and payment method.
- Examine the relationship between monthly charges and customer churn.
- Identify potential customer retention opportunities.

## 4. Dataset Information

- **Dataset:** IBM Telco Customer Churn
- **Total Records:** 7,043
- **Total Columns:** 21
- **Target Variable:** Churn (Yes/No)

## 5. Tools & Technologies

- **PostgreSQL:** Data cleaning, validation, and SQL analysis.
- **Python:** Exploratory Data Analysis using Pandas, NumPy, Matplotlib, and Seaborn.
- **Power BI:** Dashboard development and data visualization.

## 6. Project Workflow

1. Imported the dataset into PostgreSQL.
2. Performed data cleaning and quality checks.
3. Conducted SQL-based data analysis.
4. Connected PostgreSQL to Python for exploratory analysis.
5. Created visualizations to identify churn patterns.
6. Developed a Power BI dashboard to present key metrics and insights.

## 7. Key Performance Indicators

- Total Customers
- Churned Customers
- Retained Customers
- Customer Churn Rate
- Average Monthly Charges
- Monthly Charges at Risk

## 8. Key Findings

- Overall customer churn rate is 26.54%.
- Month-to-month contract customers have a higher churn rate (42.71%) than customers with one-year (11.27%) and two-year contracts (2.83%).
- Customers with 0–12 months of tenure have the highest churn rate (47.44%).
- Fiber optic customers have a churn rate of 41.89%.
- Electronic check users have a churn rate of 45.29%.
- Customers who churn have higher average monthly charges (74.44) than retained customers (61.26).
- Customers without online security and tech support show higher churn rates.

## 9. Business Recommendations

- Encourage customers to choose long-term contracts through suitable incentives.
- Improve onboarding and engagement during the first year.
- Investigate customer concerns related to fiber optic services.
- Review the payment experience for electronic check users.
- Promote relevant support and security service bundles.

## 10. Conclusion

The analysis highlights important customer segments associated with higher churn rates. These insights can help the business develop targeted retention strategies, improve customer experience, and support better business decisions.