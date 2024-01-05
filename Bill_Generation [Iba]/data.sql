-- first recharge of e-wallet after registration of user
INSERT INTO parking_schema.user_wallet_history(wallet_id, type, amount, date) values (1, 'DEBIT', 200, CURRENT_TIMESTAMP);

INSERT INTO parking_schema.PARKING_SENSOR_READING(READING, DATE, SENSOR_ID) VALUES
(0, CURRENT_TIMESTAMP, 1);

