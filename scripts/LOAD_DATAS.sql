USE financial_analytics;

-- 1. Stream Users Data
LOAD DATA LOCAL INFILE 'C:/Users/Safa/Downloads/financial_analytics/users_data.csv'
INTO TABLE users_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; -- This skips the header row (id, current_age, etc.)

-- 2. Stream Cards Data
LOAD DATA LOCAL INFILE 'C:/Users/Safa/Downloads/financial_analytics/cards_data.csv'
INTO TABLE cards_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- 3. Stream Transactions Data
LOAD DATA LOCAL INFILE 'C:/Users/Safa/Downloads/financial_analytics/transactions_data.csv'
INTO TABLE transactions_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT COUNT(*) FROM cards_data;
SELECT COUNT(*) FROM users_data;
SELECT COUNT(*) FROM transactions_data;