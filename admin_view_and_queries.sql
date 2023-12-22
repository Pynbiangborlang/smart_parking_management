-- QUERY FOR REGISTER USER
SELECT 
    EMAIL, 
    PHONE, 
    FIRST_NAME, 
    LAST_NAME, 
    GENDER, 
    AGE, 
    STATUS,
    RFID_TAG 
FROM USERS
ORDER BY USER_ID;

-- QUERY FOR ALL PARKING SPACE
SELECT 
    PARKING_SPACE.NAME AS PARKING_SPACE, 
    STATUS, 
    PARKING_SPACE.TYPE AS PARKING_SPACE_TYPE
FROM PARKING_SPACE;

-- Create a stored procedure named get_available_parking_spaces
CREATE OR REPLACE FUNCTION get_available_parking_spaces(
    p_type VARCHAR(50),
    p_status VARCHAR(50)
) RETURNS TABLE (
    PARKING_SPACE_NAME VARCHAR(255),
    PARKING_SPACE_TYPE VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        PARKING_SPACE.NAME,
        PARKING_SPACE.TYPE
    FROM PARKING_SPACE
    WHERE PARKING_SPACE.TYPE = p_type
        AND PARKING_SPACE.STATUS = p_status;
END;
$$ LANGUAGE plpgsql;

-- QUERY FOR PARKING SPACE BASED ON STATUS AND TYPE 
SELECT * FROM get_available_parking_spaces('TWO-WHEELER', 'AVAILABLE');


-- Creating an index for status to increase the performance
CREATE INDEX idx_parking_space_status ON PARKING_SPACE(STATUS);

-- Create a stored procedure named update_parking_space_status
CREATE OR REPLACE PROCEDURE update_parking_space_status(
    p_space_name VARCHAR(255),
    p_new_status VARCHAR(50)
) LANGUAGE plpgsql AS $$
BEGIN
    UPDATE PARKING_SPACE
    SET STATUS = p_new_status
    WHERE NAME = p_space_name;
END;
$$;

-- Call the stored procedure with specific values
CALL update_parking_space_status('PARKING_SPACE_NAME', 'UNAVAILABLE');


-- Create a view named user_wallet_view
CREATE OR REPLACE VIEW user_wallet_view AS
SELECT
    u.EMAIL,
    u.PHONE,
    u.FIRST_NAME,
    u.LAST_NAME,
    u.STATUS,
    w.WALLET_ID,
    w.BALANCE
FROM
    USERS u
JOIN
    USER_WALLET w ON u.USER_ID = w.USER_ID
ORDER BY 
    U.USER_ID;


-- QUERY FOR USER WALLET VIEW
SELECT * FROM user_wallet_view;


-- Create a stored procedure named get_user_wallet_transactions
CREATE OR REPLACE FUNCTION get_user_wallet_transactions(
    p_user_id INTEGER
) RETURNS TABLE (
    TRANSACTION_TYPE VARCHAR(10),  -- Updated to VARCHAR(10) to accommodate 'Credit' and 'Debit'
    AMOUNT NUMERIC,
    TRANSACTION_DATE TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        CASE
            WHEN uw.TYPE = 'C' THEN 'Credit'
            WHEN uw.TYPE = 'D' THEN 'Debit'
            ELSE uw.TYPE  -- Handle any other types if needed
        END AS TRANSACTION_TYPE,
        uw.AMOUNT,
        uw.DATE AS TRANSACTION_DATE
    FROM
        USER_WALLET_HISTORY uw
    JOIN
        USER_WALLET w ON uw.WALLET_ID = w.WALLET_ID
    WHERE
        w.USER_ID = p_user_id;
END;
$$ LANGUAGE plpgsql;

-- Call the stored procedure with a specific user ID
SELECT * FROM get_user_wallet_transactions(1); -- Replace 1 with the desired user ID


-- Create a stored procedure named calculate_monthly_income
CREATE OR REPLACE PROCEDURE calculate_monthly_income(
    p_month INTEGER,
    p_year INTEGER
) l AS $$
DECLARE
    start_date TIMESTAMP := TO_TIMESTAMP(p_year || '-' || p_month || '-01', 'YYYY-MM-DD');
    end_date TIMESTAMP := start_date + INTERVAL '1 month' - INTERVAL '1 day';
BEGIN
    CREATE OR REPLACE VIEW monthly_income_view AS
    SELECT
        DATE_TRUNC('month', uw.DATE) AS MONTH,
        SUM(CASE WHEN uw.TYPE = 'C' THEN uw.AMOUNT ELSE 0 END) AS CREDIT_AMOUNT,
        SUM(CASE WHEN uw.TYPE = 'D' THEN uw.AMOUNT ELSE 0 END) AS DEBIT_AMOUNT,
        SUM(CASE WHEN uw.TYPE = 'C' THEN uw.AMOUNT ELSE -uw.AMOUNT END) AS MONTHLY_INCOME
    FROM
        USER_WALLET_HISTORY uw
    WHERE
        uw.DATE >= start_date AND uw.DATE <= end_date
    GROUP BY
        DATE_TRUNC('month', uw.DATE);
END;
$$LANGUAGE plpgsq;


-- Call the stored procedure with specific month and year
SELECT * FROM calculate_monthly_income(1, 2023); -- Replace 1 and 2023 with the desired month and year

-- DELETE USER ACCOUNT
DELETE FROM USERS CASCADE WHERE USER_ID = 1; -- Replace 1 with the ID of the user you want to delete

-- UPDATE USER STATUS
UPDATE USERS SET STATUS = 'INACTIVE' WHERE USER_ID = 1; -- Replace 1 with the ID of the user you want to update