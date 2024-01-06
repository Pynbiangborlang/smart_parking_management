After necessary table and trigger creations, follow the given steps -
1. After registration of a new user, e-wallet creation is triggered.
2. User must add cash to e-wallet
    --> insert into user_wallet_history for 'dedit' type.
    --> update user_wallet to update the e-wallet balance of user.
3. User enters through ENTRY gate
    --> insert into gate_sensor_reading
4. User moves to parking space [CHECK-IN]
    --> insert into parking_sensor_reading for check in into parking space [1]
5. User moves out of parking space [CHECK-OUT]
    --> insert into parking_sensor_reading for check out of parking space [0]
6. Bill Generation Calculation:
    i. Calculate amount based on check-in and check-out timing and rate of the space type.
    ii. Deduct amount from user's e-wallet.
    iii. Check if balance on e-wallet > amount to be paid.
        --> if balance < amount, status will be set to 'PENDING' and user will have to recharge.
        --> if balance > amount, status will be set to 'PAID' and user is allowed to EXIT.
7. User exits from EXIT gate
    --> insert into gate_sensor_reading
