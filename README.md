# Financial Analytics (SQL & EDA)

## Project Overview
This project is an exploratory data analysis (EDA) of a 1,000-row consumer financial transaction dataset. Utilizing advanced MySQL querying, relational database engineering, and portfolio risk methodologies, this analysis isolates key demographic trends, underwriting anomalies, and credit-risk thresholds to support strategic corporate decision-making.

## Tools Used
- **Database** : MySQL (MySQL Workbench)
- **Language** : SQL
- **Key Concept** : Relational Schema Design, Multi-Table Joins, Data Cleansing & Type Casing, Boolean Aggregations, Risk Modeling & Marget Segmentation

## Database Architecture
This analysis is built upon 2 interconnected core tables :
- `users_data` : Contains user demographic profiles, credit scores, debt metrics, and incomes
- `cards_data` : Tracks card-specific attributes including card brand, card type, and credit limits

### Data Anomalies
- During initial ingestion, raw credit limits and income columns were formatted as text strings containing currency symbols ($). Furthermore, a structural synthetic dataset flaw was identified where *Debit* card lines were erroneously assigned credit limits.
- To solve the anomaly, I performed data cleaning using CAST(REPLACE(column, '$', '') AS DECIMAL(12,2))` to parse numbers on the fly, while filtering out non-credit products (`WHERE card_type = 'Credit'`).


---

### 1. Demographic Risk Profile & High-Leverage Generations
- **Insight:** Consumers under the age of 50 command a higher average yearly income (~$46,704) compared to those aged 50 and above (~$44,227). However, this younger cohort is heavily leveraged, carrying an average debt load that is **$21,338 higher** than the older demographic.
- **Strategic Impact:** Highlights potential financial over-exposure in the asset-acquisition phase of younger consumers. This recommends applying more conservative debt-to-income underwriting parameters for applicants under the age of 50 to mitigate systemic defaults.

### 2. Credit Card Multiplicity & The Risk Threshold Tipping Point
- **Insight:** The analysis revealed a strong positive correlation between creditworthiness and card portfolio scaling up to a specific limit. Card ownership from 1 to 8 open lines peaks cleanly at a robust average credit score of `749.0` alongside a low average debt load of `$17,403`. 
- **The Tipping Point:** At exactly 9+ open credit lines, this stable pattern shatters aggressively. Consumer debt loads experience a **344% spike** ($77,338) while average credit scores drop to `695.3`. This mathematically establishes 9+ open credit lines as a leading indicator of distressed "credit-stacking" and capital juggling behavior.

### 3. Credit Card Portfolio Performance & Market Segmentation
Cross-table analysis linking card portfolio performance to user demographics reveals a highly structured risk-to-reward hierarchy across the four major networks:

| Rank | Volume (User Count) | Assigned Credit Limit | Segment Persona | Financial Breakdown & Risk Interpretation |
| :--- | :--- | :--- | :--- | :--- |
| **1** | **VISA** | 2nd Place | **High-Income Risky Debtors** | Commands the largest market share and the **highest average income**, yet exhibits the **lowest average credit score**. This indicates a high-earning consumer segment that demonstrates low financial responsibility in managing borrowed capital; cash flows are strong, but utilization behavior is high-risk. |
| **2** | **Mastercard** | 3rd Place | **Middle-Class Optimizers** | Represents a resilient, stable middle tier. Despite having lower average incomes compared to Visa and Amex, they maintain significantly higher credit scores, making them low-default, highly reliable interest revenue generators. |
| **3** | **Amex** | **Highest Limit** | **Premium / Aggressive Growth** | Captures the second-highest income tier but is granted the **absolute highest average credit limits** across the entire portfolio, despite carrying the second-lowest credit scores. This exposes an aggressive underwriting strategy aimed at capturing premium, high-ticket transaction volumes from high earners by tolerating elevated risk profiles. |
| **4** | **Discover** | Lowest Limit | **Ultra-Disciplined Savers** | Holds the smallest market share and the **lowest average income**, yet commands the **highest average credit scores** across the entire portfolio. They utilize credit minimally, pay off balances immediately, and represent an ultra-safe, low-risk consumer niche. |

---

## Scripts Included
- `ADD_PK_AND_FK`, `CLEAN_DATA`, `CREATE_TABLES`, `LOAD_DATAS`: DDL structures establishing relational schemas, primary keys, and foreign key constraints.
- `01_demographics.sql`: Boolean queries isolating generative age and card density distributions.
- `02_performance.sql`: Multi-table inner joins synthesizing issuing brands with client credit histories.
