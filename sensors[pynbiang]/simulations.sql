
--1 ENTRY GATE DETECT USER
-- Insert data into GATE_SENSOR_READING table
INSERT INTO parking_schema.GATE_SENSOR_READING (DATE, SENSOR_TAG, RFID_TAG) VALUES
 (CURRENT_TIMESTAMP, 'ENT001', 'ABC123');
  
SELECT * FROM parking_schema.GATE_SENSOR_READING;
SELECT * FROM parking_schema.USER_PARKING_HISTORY;

--2 USER CHECK IN 
INSERT INTO parking_schema.PARKING_SENSOR_READING(READING, DATE, SENSOR_ID) VALUES
(1, CURRENT_TIMESTAMP, 1);

SELECT * FROM parking_schema.PARKING_SENSOR_READING;
SELECT * FROM parking_schema.USER_PARKING_HISTORY;

--3 USER CHECK OUT AND BILL IS GENERATED
INSERT INTO parking_schema.PARKING_SENSOR_READING(READING, DATE, SENSOR_ID) VALUES
(0, CURRENT_TIMESTAMP, 1);

SELECT * FROM parking_schema.PARKING_SENSOR_READING;
SELECT * FROM parking_schema.USER_PARKING_HISTORY;
SELECT * FROM parking_schema.BILL;
SELECT * FROM parking_schema.USER_WALLET;
SELECT * FROM PARKING_SCHEMA.USER_WALLET_HISTORY;

--4 USER EXIT THROUGH EXIT GATE
INSERT INTO parking_schema.GATE_SENSOR_READING (READING_ID, DATE, SENSOR_TAG, RFID_TAG) VALUES
 ((SELECT MAX(READING_ID) FROM parking_schema.GATE_SENSOR_READING) + 1, CURRENT_TIMESTAMP, 'EXT001', 'ABC123');

 --5 INDEXEING
 EXPLAIN SELECT * FROM parking_schema.PARKING_SENSOR WHERE STATUS = 'ACTIVE';

 CREATE INDEX idx_parking_sensor_status ON parking_schema.PARKING_SENSOR USING HASH (STATUS);
 
 