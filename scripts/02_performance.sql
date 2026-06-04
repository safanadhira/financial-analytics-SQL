USE financial_analytics;

-- analyze how different credit card products behave
-- evaluate by spending limits, card types, and brand dominance

SELECT card_brand, card_type, COUNT(*) AS total_cards, AVG(credit_limit) AS avg_credit_limit
FROM cards_data
WHERE card_type = 'Credit'
GROUP BY card_brand, card_type
ORDER BY avg_credit_limit DESC;

