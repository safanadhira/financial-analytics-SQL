USE financial_analytics;

-- analyze how different credit card products behave
-- evaluate by spending limits, card types, and brand dominance

-- find the highest credit limit
SELECT card_brand, card_type, COUNT(*) AS total_cards, AVG(credit_limit) AS avg_credit_limit
FROM cards_data
WHERE card_type = 'Credit'
GROUP BY card_brand, card_type
ORDER BY avg_credit_limit DESC;

-- find the most disciplined users based on the card brand
SELECT card_brand, AVG(yearly_income) AS average_income, AVG(credit_score) AS average_credit_score
FROM users_data AS u
JOIN cards_data AS c
ON u.id = c.client_id
WHERE card_type = 'Credit'
GROUP BY card_brand
ORDER BY average_income DESC;
