After necessary tables and triggers creation, follow the given steps -
1. After registration of a user, e-wallet creation is triggered.
2. User must add cash to e-wallet
    --> insert into user_wallet_history for 'Debit' type
3. User moves to parking space
    --> insert into parking_sensor_reading for ENTRY into parking space [1]
4. User moves out of parking space
    --> insert into parking_sensor_reading for EXIT out of parking space [0]
5. Calculate amount based on check-in and check-out timing.
