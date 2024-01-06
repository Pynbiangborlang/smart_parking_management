-- User can view available parking spaces.

CREATE OR REPLACE VIEW parking_schema.AVAILABLE_PARKING_SPACES AS
SELECT
    SPACE_ID,
    NAME,
    STATUS,
    TYPE
FROM
    parking_schema.PARKING_SPACE
WHERE
    STATUS = 'AVAILABLE';

-- User can check balance in e-wallet.

CREATE OR REPLACE VIEW parking_schema.USER_WALLET_BALANCE AS
SELECT
    BALANCE
FROM
    parking_schema.USER_WALLET;

-- User can see his transactions.

CREATE OR REPLACE VIEW parking_schema.USER_WALLET_TRANSACTIONS AS
SELECT
    UWH.WALLET_ID,
    UWH.TYPE,
    UWH.AMOUNT,
    UWH.DATE,
    UW.USER_ID
FROM
    parking_schema.USER_WALLET_HISTORY UWH
JOIN
    parking_schema.USER_WALLET UW ON UWH.WALLET_ID = UW.WALLET_ID;

-- USER RUNNING COST VIEW --
CREATE VIEW parking_schema.USER_RUNNING_COST AS
SELECT
    UPH.check_in,
    (
        SELECT ST.RATE_PER_MIN * EXTRACT(EPOCH FROM (CURRENT_TIMESTAMP - UPH.check_in)) / 60
        FROM SPACE_TYPE ST
        WHERE UPH.check_out IS NULL
        LIMIT 1
    ) AS RUNNING_COST
FROM
    parking_schema.USER_PARKING_HISTORY UPH
WHERE UPH.check_in IS NOT NULL AND UPH.check_out IS NULL;