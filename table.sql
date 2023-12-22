---------- TABLE CREATION ----------
DROP TABLE IF EXISTS ADMIN;
CREATE TABLE IF NOT EXISTS ADMIN(
	ADMIN_EMAIL VARCHAR(256) PRIMARY KEY,
	PHONE_NO VARCHAR(15),
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50),
	GENDER VARCHAR(10),
	PASSWORD TEXT
);

DROP TABLE IF EXISTS PARKING_LOT;
CREATE TABLE IF NOT EXISTS PARKING_LOT(
	PARKING_LOT_ID SERIAL PRIMARY KEY ,
	NAME VARCHAR(50),
	ADDRESS TEXT,
	ADMIN_EMAIL VARCHAR(256) REFERENCES ADMIN(ADMIN_EMAIL)
);

DROP TABLE IF EXISTS SECTIONS;
CREATE TABLE IF NOT EXISTS SECTIONS(
	SECTION_ID SERIAL PRIMARY KEY ,
	NAME VARCHAR(50),
	PARKING_LOT_ID INT REFERENCES PARKING_LOT(PARKING_LOT_ID)
);

DROP TABLE IF EXISTS SPACE_TYPE;
CREATE TABLE IF NOT EXISTS SPACE_TYPE (
	TYPE VARCHAR(20) PRIMARY KEY CHECK(TYPE ILIKE 'TWO-WHEELER' OR TYPE ILIKE 'FOUR-WHEELER'),
	RATE_PER_MIN REAL
);

DROP TABLE IF EXISTS PARKING_SPACE;
CREATE TABLE IF NOT EXISTS PARKING_SPACE(
	SPACE_ID SERIAL PRIMARY KEY ,
	NAME VARCHAR(50) UNIQUE,
	STATUS VARCHAR(20) CHECK(TYPE ILIKE 'AVAILABLE' OR TYPE ILIKE 'OCCUPIED' OR TYPE ILIKE 'UNAVAILABLE'),
	SECTION_ID INT REFERENCES SECTIONS(SECTION_ID),
	TYPE VARCHAR(20) REFERENCES SPACE_TYPE(TYPE)
);

DROP TABLE IF EXISTS PARKING_SENSOR;
CREATE TABLE IF NOT EXISTS PARKING_SENSOR(
	SENSOR_ID SERIAL PRIMARY KEY,
	TAG VARCHAR(50) UNIQUE,
	STATUS VARCHAR(20),
	SPACE_ID INT REFERENCES PARKING_SPACE(SPACE_ID)
);

DROP TABLE IF EXISTS PARKING_SENSOR_READING;
CREATE TABLE IF NOT EXISTS PARKING_SENSOR_READING(
	READING_ID SERIAL PRIMARY KEY,
	READING REAL,
	DATE TIMESTAMP,
	SENSOR_ID INT REFERENCES PARKING_SENSOR(SENSOR_ID)
);

DROP TABLE IF EXISTS GATES;
CREATE TABLE IF NOT EXISTS GATES(
	GATE_ID SERIAL PRIMARY KEY,
	TYPE VARCHAR(5) CHECK(TYPE ILIKE 'EXIT' OR TYPE ILIKE 'ENTRY'),
	SENSOR_TAG VARCHAR(50) UNIQUE,
	SENSOR_STATUS VARCHAR(10) CHECK(SENSOR_STATUS ILIKE 'ACTIVE' OR SENSOR_STATUS ILIKE 'INACTIVE'),
	PARKING_LOT_ID INT REFERENCES PARKING_LOT(PARKING_LOT_ID) UNIQUE
);

DROP TABLE IF EXISTS USERS;
CREATE TABLE IF NOT EXISTS USERS(
	USER_ID SERIAL PRIMARY KEY,
	EMAIL TEXT,
	PHONE TEXT,
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50),
	GENDER VARCHAR(10),
	AGE SMALLINT,
	STATUS VARCHAR(10) CHECK(STATUS ILIKE 'ACTIVE' OR STATUS ILIKE 'INACTIVE'),
	RFID_TAG TEXT,
	PASSWORD TEXT
);

DROP TABLE IF EXISTS GATE_SENSOR_READING;
CREATE TABLE IF NOT EXISTS GATE_SENSOR_READING(
	READING_ID SERIAL PRIMARY KEY,
	DATE TIMESTAMP,
	SENSOR_TAG VARCHAR(50) REFERENCES GATES(SENSOR_TAG),
	RFID_TAG INTEGER	
); 

DROP TABLE IF EXISTS USER_PARKING_HISTORY;
CREATE TABLE IF NOT EXISTS USER_PARKING_HISTORY(
	PARKING_ID SERIAL PRIMARY KEY,
	USER_ID INTEGER REFERENCES USERS(USER_ID),
    ENTRY_TIME TIMESTAMP,
    EXIT_TIME TIMESTAMP,
	CHECK_IN TIMESTAMP,
	CHECK_OUT TIMESTAMP,
	SPACE_ID INTEGER REFERENCES PARKING_SPACE(SPACE_ID)
);

DROP TABLE IF EXISTS USER_WALLET;
CREATE TABLE IF NOT EXISTS USER_WALLET(
	WALLET_ID SERIAL PRIMARY KEY,
	USER_ID INTEGER REFERENCES USERS(USER_ID),
	BALANCE NUMERIC
);

DROP TABLE IF EXISTS USER_WALLET_HISTORY;
CREATE TABLE IF NOT EXISTS USER_WALLET_HISTORY(
	WALLET_ID INTEGER REFERENCES USER_WALLET(WALLET_ID),
	TYPE VARCHAR(1) CHECK(TYPE ILIKE 'C' OR TYPE ILIKE 'D'),
	AMOUNT NUMERIC,
	DATE TIMESTAMP
);

DROP TABLE IF EXISTS BILL;
CREATE TABLE IF NOT EXISTS BILL(
	BILL_ID SERIAL PRIMARY KEY,
	WALLET_ID INTEGER REFERENCES USER_WALLET(WALLET_ID),
	AMOUNT NUMERIC,
	STATUS VARCHAR(10) CHECK(STATUS ILIKE 'PENDING' OR STATUS ILIKE 'PAID'),
	DATE TIMESTAMP,
	PARKING_ID INTEGER REFERENCES USER_PARKING_HISTORY(PARKING_ID)
);

ROLLBACK;

	
	
	