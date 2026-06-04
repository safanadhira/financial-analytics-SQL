USE financial_analytics;

-- ALTER TABLE to create relational database
ALTER TABLE users_data
ADD PRIMARY KEY (id);

ALTER TABLE cards_data
ADD PRIMARY KEY (id);

ALTER TABLE transactions_data
ADD PRIMARY KEY (id);

ALTER TABLE transactions_data
ADD CONSTRAINT fk_transactions_user 
    FOREIGN KEY (client_id) REFERENCES users_data(id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
ADD CONSTRAINT fk_transactions_card 
    FOREIGN KEY (card_id) REFERENCES cards_data(id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE;