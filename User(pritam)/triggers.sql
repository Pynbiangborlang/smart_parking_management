-- trigger to create rfid_tag --

CREATE OR REPLACE FUNCTION parking_schema.generate_rfid_tag()
  RETURNS TRIGGER AS $$
BEGIN
  -- Generate a random RFID_TAG using md5 and random()
  NEW.RFID_TAG := MD5(random()::TEXT || NOW()::TEXT)::uuid;

  -- Hash the RFID_TAG using crypt
  NEW.RFID_TAG := crypt(NEW.RFID_TAG, gen_salt('md5'));

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to execute the function before INSERT
DROP TRIGGER IF EXISTS users_before_insert_trigger ON parking_schema.USERS;
CREATE TRIGGER users_before_insert_trigger
  BEFORE INSERT ON parking_schema.users
  FOR EACH ROW
  EXECUTE FUNCTION parking_schema.generate_rfid_tag();

-- trigger to create wallet for the user -- 

-- Create a function that will be called by the trigger
CREATE OR REPLACE FUNCTION update_wallet()
RETURNS TRIGGER AS $$
BEGIN
    -- Check if the user already exists in USER_WALLET
    IF EXISTS (SELECT 1 FROM parking_schema.USER_WALLET WHERE USER_ID = NEW.USER_ID) THEN
        -- If user exists, update the balance
        UPDATE parking_schema.USER_WALLET
        SET BALANCE = BALANCE + COALESCE(NEW.BALANCE, 0)
        WHERE USER_ID = NEW.USER_ID;
    ELSE
        -- If user doesn't exist, insert a new record
        INSERT INTO parking_schema.USER_WALLET (USER_ID, BALANCE)
        VALUES (NEW.USER_ID, COALESCE(NEW.BALANCE, 0));
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER user_insert_trigger
AFTER INSERT ON parking_schema.USERS
FOR EACH ROW
EXECUTE FUNCTION update_wallet();

