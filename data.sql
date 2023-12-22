CREATE EXTENSION pgcrypto;
--1. ADMIN
INSERT INTO ADMIN (admin_email, phone_no, first_name, last_name, gender, password) VALUES
('john.smith@gmail.com',	'5316849271',	'John',	'Smith', 'MALE', crypt('johndoe#1234', gen_salt('md5')));


--2. PARKING_LOT

INSERT INTO PARKING_LOT(name, address, admin_email) VALUES
('J.SMITH PARKING',	'123 Main Street, Cityville', 'john.smith@gmail.com');

INSERT INTO SECTIONS (name, parking_lot_id) VALUES
('SECTION-1', 1),
('SECTION-2', 1),
('SECTION-3', 1);

INSERT INTO SPACE_TYPE(type, rate_per_min) VALUES
('TWO-WHEELER',	0.3),
('FOUR-WHEELER',	0.5);

--3 PARKING_SECTIONS
INSERT INTO PARKING_SPACE(name, status, section_id, type) VALUES
('SEC1-SP1','AVAILABLE', (select section_id from sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC1-SP2','AVAILABLE', (select section_id from sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC1-SP3','AVAILABLE', (select section_id from sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC1-SP4','AVAILABLE', (select section_id from sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC1-SP5','AVAILABLE', (select section_id from sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC1-SP6', 'AVAILABLE', (select section_id from sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC2-SP1','AVAILABLE',  (select section_id from sections where name='SECTION-1'),'FOUR-WHEELER'),
('SEC2-SP2','AVAILABLE', (select section_id from sections where name='SECTION-1'),'FOUR-WHEELER'),
('SEC2-SP3','AVAILABLE',(select section_id from sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP4','AVAILABLE',(select section_id from sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP5','AVAILABLE',(select section_id from sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP6','AVAILABLE',(select section_id from sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP7','AVAILABLE',(select section_id from sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP8','AVAILABLE',(select section_id from sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP9','AVAILABLE',(select section_id from sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP10','AVAILABLE',(select section_id from sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP11','AVAILABLE',(select section_id from sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP12','AVAILABLE',(select section_id from sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC3-SP1','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP2','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP3','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP4','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP5','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP6','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP7','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP8','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP9','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP10','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP11','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP12','AVAILABLE',(select section_id from sections where name='SECTION-3'),'FOUR-WHEELER');

--4 PARKING SENSORS
INSERT INTO PARKING_SENSOR(tag, status, space_id) VALUES
('SEC1-SP1-S1',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC1-SP1')),
('SEC1-SP2-S2',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC1-SP2')),
('SEC1-SP3-S3',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC1-SP3')),
('SEC1-SP4-S4',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC1-SP4')),
('SEC1-SP5-S3',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC1-SP5')),
('SEC1-SP6-S4',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC1-SP6')),
('SEC2-SP1-S1',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP1')),
('SEC2-SP2-S2',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP2')),
('SEC2-SP3-S3',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP3')),
('SEC2-SP4-S4',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP4')),
('SEC2-SP5-S5',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP5')),
('SEC2-SP6-S6',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP6')),
('SEC2-SP7-S7',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP7')),
('SEC2-SP8-S8',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP8')),
('SEC2-SP9-S9',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP9')),
('SEC2-SP10-S10', 'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP10')),
('SEC2-SP11-S11', 'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP11')),
('SEC2-SP12-S12', 'ACTIVE' ,(select space_id from parking_space where name = 'SEC2-SP12')),
('SEC3-SP1-S1',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP1')),
('SEC3-SP2-S2',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP2')),
('SEC3-SP3-S3',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP3')),
('SEC3-SP4-S4',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP4')),
('SEC3-SP5-S5',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP5')),
('SEC3-SP6-S6',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP6')),
('SEC3-SP7-S7',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP7')),
('SEC3-SP8-S8',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP8')),
('SEC3-SP9-S9',	'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP9')),
('SEC3-SP10-S10', 'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP10')),
('SEC3-SP11-S11', 'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP11')),
('SEC3-SP12-S12', 'ACTIVE' ,(select space_id from parking_space where name = 'SEC3-SP12'));

--5 USERS
INSERT INTO USERS (EMAIL, PHONE, FIRST_NAME, LAST_NAME, GENDER, AGE, STATUS, RFID_TAG, PASSWORD) VALUES
('john.doe@gmail.com', '+1234567890', 'John', 'Doe', 'Male', 30, 'ACTIVE', crypt('ABC123',gen_salt('md5')), crypt('johndoe#1234', gen_salt('md5'))),
('jane.smith@gmail.com', '+9876543210', 'Jane', 'Smith', 'Female', 25, 'ACTIVE', crypt('XYZ456',gen_salt('md5')), crypt('janeX@4321', gen_salt('md5')));


--6 GATES
-- Insert data into GATES table
INSERT INTO GATES (TYPE, SENSOR_TAG, SENSOR_STATUS, PARKING_LOT_ID) VALUES
  ('ENTRY', 'ENT001', 'ACTIVE', 1),
  ('EXIT', 'EXT001', 'ACTIVE', 1);

--GATE SENSORS READING--simulate
-- Insert data into GATE_SENSOR_READING table
INSERT INTO GATE_SENSOR_READING (DATE, SENSOR_TAG, RFID_TAG) VALUES
  (CURRENT_TIMESTAMP, 'ENT001', 'ABC123');
