-- clean all the $ sign
USE financial_analytics;
SET SQL_SAFE_UPDATES = 0;

-- 1. Strip the '$' from the amount column instantly
UPDATE transactions_data SET amount = REPLACE(amount, '$', '');

-- 2. Convert the column to a mathematical decimal permanently
ALTER TABLE transactions_data MODIFY COLUMN amount DECIMAL(10,2);

SET SQL_SAFE_UPDATES = 1;