-- insert user data --

INSERT INTO parking_schema.USERS (EMAIL, PHONE, FIRST_NAME, LAST_NAME, GENDER, AGE, STATUS, PASSWORD) VALUES
('john.doe@gmail.com', '+1234567890', 'John', 'Doe', 'Male', 30, 'ACTIVE' , crypt('johndoe#1234', gen_salt('md5'))),
('jane.smith@gmail.com', '+9876543210', 'Jane', 'Smith', 'Female', 25, 'ACTIVE', crypt('janeX@4321', gen_salt('md5')));


-- update wallet balance --

UPDATE parking_schema.USER_WALLET
SET BALANCE = BALANCE + COALESCE(1000, 0)
WHERE USER_ID = 1;

-- User can update personal details.

UPDATE parking_schema.USERS
SET
    EMAIL = 'updated_user@example.com',
    PHONE = '5554443333',
    FIRST_NAME = 'dJohn',
    LAST_NAME = 'dDoe',
    GENDER = 'Male',
    AGE = 28
WHERE USER_ID = 1;

-- User can deactivate own account.

UPDATE parking_schema.USERS
SET STATUS = 'INACTIVE'
WHERE USER_ID = 1;