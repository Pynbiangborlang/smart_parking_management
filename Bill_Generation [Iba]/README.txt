After necessary tables and triggers creation, follow the given steps -
1. After registration of a user, e-wallet creation is triggered.
2. User must add cash to e-wallet
    --> insert into user_wallet_history for 'credit' type
3. user enter through entry gate
    --> insert into gate_sensor_reading(sensor_tag, rfid, date) values(sensor_tag, user_rfid, timestamp_value);
4. User moves to parking space
    --> insert into parking_sensor_reading for check in into parking space [1]
5. User moves out of parking space
    --> insert into parking_sensor_reading for check out of parking space [0]
6. Calculate amount based on check-in and check-out timing.
7. user exit through exit gate
    --> insert into gate_sensor_reading(sensor_tag, rfid, date) values(sensor_tag, user_rfid, timestamp_value);
