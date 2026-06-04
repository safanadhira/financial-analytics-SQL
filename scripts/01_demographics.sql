USE financial_analytics;

-- #1 : User Demographics & Credit Risk Analysis
-- Objective : Analyze how user attributes impact financial profiles
 
-- do older users have more credit worthiness than younger users?
SELECT 
	(current_age >=50) AS above_50,
    COUNT(*) AS total_users,
    AVG(credit_score) AS avg_credit_score,
    SUM(total_debt) AS total_combined_debt
FROM users_data
GROUP BY (current_age >= 50);
-- SUMMARY : no, their average credit scores are similar. so, age doesn't influence this matter

-- do older users accumulate more debt than younger users?
SELECT 
	(current_age >=50) AS above_50,
    AVG(yearly_income) AS avg_yearly_income,
    AVG(total_debt) AS avg_debt_load
FROM users_data
GROUP BY (current_age >= 50);
-- SUMMARY : the younger group is making more income but they are highly leveraged. 
-- with higher ratio of debt load, they're likely taking out mortgages, auto loans, or student loans.
-- while the older group earn slightly less on average (might be due to retirement or life transition),
-- they carry less debt load. their financial profile is much more stable and conservative.

-- is there a correlation between users credit score and their total number of credit cards?
SELECT 
	num_credit_cards,
    COUNT(*) AS total_users,
    ROUND(AVG(credit_score), 1) AS avg_credit_score,
    ROUND(AVG(total_debt), 1) AS avg_total_debt
FROM users_data
GROUP BY num_credit_cards
ORDER BY num_credit_cards ASC;
-- summary : yes, it shows a correlation. when user has more credit cards, they have less total debt
-- which makes their credit score higher. this shows that users with 5-8 credit cards are more financially
-- disciplined, prime consumers. 