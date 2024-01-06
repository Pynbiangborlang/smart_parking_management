-- trigger to create rfid_tag --

CREATE OR REPLACE FUNCTION parking_schema.generate_rfid_tag()
  RETURNS TRIGGER AS $$
BEGIN
  
  NEW.RFID_TAG := MD5(random()::TEXT || NOW()::TEXT)::uuid;

  
  NEW.RFID_TAG := crypt(NEW.RFID_TAG, gen_salt('md5'));

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS users_before_insert_trigger ON parking_schema.USERS;
CREATE TRIGGER users_before_insert_trigger
  BEFORE INSERT ON parking_schema.users
  FOR EACH ROW
  EXECUTE FUNCTION parking_schema.generate_rfid_tag();

-- trigger to create wallet for the user -- 

  CREATE OR REPLACE FUNCTION parking_schema.CREATE_WALLET_ON_REG_USER()
  RETURNS TRIGGER
  AS $$
  BEGIN
      IF NOT EXISTS (SELECT 1 FROM parking_schema.USER_WALLET WHERE USER_ID = NEW.USER_ID) THEN
          INSERT INTO parking_schema.USER_WALLET(USER_ID, BALANCE) VALUES (NEW.USER_ID, 0);
      END IF;
      RETURN NEW;
  END;
  $$ LANGUAGE PLPGSQL;

  DROP TRIGGER IF EXISTS CREATE_WALLET_ON_REG_USER ON parking_schema.USERS;
  CREATE TRIGGER CREATE_WALLET_ON_REG_USER
  AFTER INSERT
  ON parking_schema.USERS
  FOR EACH ROW EXECUTE FUNCTION parking_schema.CREATE_WALLET_ON_REG_USER();


