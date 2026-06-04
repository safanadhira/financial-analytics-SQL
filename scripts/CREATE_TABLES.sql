USE financial_analytics;

-- Drop the old table if it exists to start fresh
DROP TABLE IF EXISTS users_data;
DROP TABLE IF EXISTS cards_data;
DROP TABLE IF EXISTS transactions_data;

-- Create the table with exact matching column names and text-friendly data types
CREATE TABLE users_data (
    id INT,
    current_age INT,
    retirement_age INT,
    birth_year INT,
    birth_month INT,
    gender VARCHAR(50),
    address VARCHAR(255),
    latitude DECIMAL(10, 4),
    longitude DECIMAL(10, 4),
    per_capita_income VARCHAR(100), -- Kept as text to safely absorb the '$' symbol
    yearly_income VARCHAR(100),     -- Kept as text to safely absorb the '$' symbol
    total_debt VARCHAR(100),        -- Kept as text to safely absorb the '$' symbol
    credit_score INT,
    num_credit_cards INT
);

-- Create the table with exact matching column names and text-friendly data types
CREATE TABLE cards_data (
    id INT,
    client_id INT, -- This is the Foreign Key that will link back to users_data (id)
    card_brand VARCHAR(50),
    card_type VARCHAR(50),
    card_number VARCHAR(100), -- Kept as a string to handle 16-digit card numbers safely
    expires VARCHAR(50),      -- e.g., '12/2022'
    cvv INT,
    has_chip VARCHAR(10),     -- 'YES' or 'NO'
    num_cards_issued INT,
    credit_limit VARCHAR(100), -- Kept as text to safely absorb the '$' symbol
    acct_open_date VARCHAR(50), -- e.g., '09/2002'
    year_pin_last_changed INT,
    card_on_dark_web VARCHAR(10) -- 'No' or 'Yes'
);

-- Create the table with exact matching column names and text-friendly data types
CREATE TABLE transactions_data (
    id INT,
    date DATETIME,               -- Cleanly absorbs '2010-01-01 00:01:00'
    client_id INT,               -- Foreign Key matching users_data (id) and cards_data (client_id)
    card_id INT,                 -- Foreign Key matching cards_data (id)
    amount VARCHAR(100),         -- Safely holds '$', '-', and decimals
    use_chip VARCHAR(100),       -- e.g., 'Swipe Transaction'
    merchant_id VARCHAR(255),
    merchant_city VARCHAR(255),
    merchant_state VARCHAR(50),
    zip VARCHAR(50),             -- Absorbs the decimal format '58523.0' safely as text
    mcc INT,                     -- Merchant Category Code
    errors VARCHAR(255)          -- Safely stores text errors or NULLs
);

