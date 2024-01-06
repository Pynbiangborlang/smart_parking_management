-- user can see his details

SELECT *
FROM parking_schema.USERS
WHERE USER_ID = 1;



-- VIEW QUEIRIES --
-- user can see avaliable parking spaces

SELECT *
FROM parking_schema.AVAILABLE_PARKING_SPACES;

-- User can check balance in e-wallet --

SELECT BALANCE
FROM parking_schema.USER_WALLET_BALANCE
WHERE USER_ID = 1;

-- User can see his transactions.--

SELECT
    WALLET_ID,
    TYPE,
    AMOUNT,
    DATE
FROM parking_schema.USER_WALLET_TRANSACTIONS
WHERE USER_ID = 1;

-- user can see running cost 

SELECT check_in, RUNNING_COST
FROM parking_schema.USER_RUNNING_COST
WHERE USER_ID = 1;


