# Financial Analytics (SQL & EDA)

## Project Overview
This project is an exploratory data analysis (EDA) of a 1,000-row consumer financial transaction dataset. Utilizing advanced MySQL querying, relational database engineering, and portfolio risk methodologies, this analysis isolates key demographic trends, underwriting anomalies, and credit-risk thresholds to support strategic corporate decision-making.

## Tools Used
- **Database** : MySQL (MySQL Workbench)
- **Language** : SQL
- **Key Concept** : Relational Schema Design, Multi-Table Joins, Data Cleansing & Type Casing, Boolean Aggregations, Risk Modeling

## Business Insights
### 1. Demographic Risk Profile
- **Insight:** Consumers under the age of 50 yield a higher average yearly income (~$46,704) compared to those 50 and above (~$44,227). However, this younger cohort is highly leveraged, carrying an average debt load that is **$21,338 higher** than the older demographic.
- **Strategic Impact:** Highlights potential financial exposure in the asset-acquisition phase of younger consumers, recommending more conservative debt-to-income underwriting parameters for applicants under 50.

### 2. The Credit Card Multiplicity Risk Threshold
- **Insight:** Analysis revealed a strong positive correlation between card ownership and creditworthiness from 1 to 8 open lines, peaking at an average credit score of `749.0` and a low debt load of `$17,403`. 
- **The Tipping Point:** At exactly 9+ open credit lines, the pattern shatters aggressively. Average consumer debt loads spike by **344%** ($77,338) while credit scores drop to `695.3`, signaling distressed "credit-stacking" behavior.

### 3. Portfolio Distribution Anomaly & Brand Dominance
- **Data Anomaly Addressed:** Identified a structural synthetic data generation flaw where debit card lines were erroneously assigned credit limits. This was isolated and documented in the cleaning pipeline.
- **Brand Performance:** After stripping text formatting on the fly, **American Express (Amex) Credit** cards were proven to hold the highest average assigned credit limits across the portfolio, aligning with premium account underwriting tiers.
