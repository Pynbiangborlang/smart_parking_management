CREATE EXTENSION pgcrypto;
--1. ADMIN
INSERT INTO parking_schema.ADMIN (admin_email, phone_no, first_name, last_name, gender, password) VALUES
('john.smith@gmail.com',	'5316849271',	'John',	'Smith', 'MALE', crypt('Johnsmith#1234', gen_salt('md5')));

--2. PARKING_LOT
INSERT INTO parking_schema.PARKING_LOT(name, address, admin_email) VALUES
('J.SMITH PARKING',	'123 Main Street, Cityville', 'john.smith@gmail.com');

INSERT INTO parking_schema.SECTIONS (name, parking_lot_id) VALUES
('SECTION-1', 1),
('SECTION-2', 1),
('SECTION-3', 1);

INSERT INTO parking_schema.SPACE_TYPE(type, rate_per_min) VALUES
('TWO-WHEELER',	0.3),
('FOUR-WHEELER',	0.5);

--3 PARKING_SECTIONS
INSERT INTO parking_schema.PARKING_SPACE(name, status, section_id, type) VALUES
('SEC1-SP1','AVAILABLE', (select section_id from parking_schema.sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC1-SP2','AVAILABLE', (select section_id from parking_schema.sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC1-SP3','AVAILABLE', (select section_id from parking_schema.sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC1-SP4','AVAILABLE', (select section_id from parking_schema.sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC1-SP5','AVAILABLE', (select section_id from parking_schema.sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC1-SP6', 'AVAILABLE', (select section_id from parking_schema.sections where name='SECTION-1'),	'TWO-WHEELER'),
('SEC2-SP1','AVAILABLE',  (select section_id from parking_schema.sections where name='SECTION-1'),'FOUR-WHEELER'),
('SEC2-SP2','AVAILABLE', (select section_id from parking_schema.sections where name='SECTION-1'),'FOUR-WHEELER'),
('SEC2-SP3','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP4','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP5','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP6','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP7','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP8','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP9','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP10','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP11','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC2-SP12','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-2'),'FOUR-WHEELER'),
('SEC3-SP1','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP2','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP3','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP4','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP5','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP6','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP7','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP8','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP9','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP10','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP11','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER'),
('SEC3-SP12','AVAILABLE',(select section_id from parking_schema.sections where name='SECTION-3'),'FOUR-WHEELER');

--5 USERS
INSERT INTO parking_schema.USERS (EMAIL, PHONE, FIRST_NAME, LAST_NAME, GENDER, AGE, STATUS, RFID_TAG, PASSWORD) VALUES
('john.doe@gmail.com', '+1234567890', 'John', 'Doe', 'Male', 30, 'ACTIVE', crypt('ABC123',gen_salt('md5')), crypt('johndoe#1234', gen_salt('md5'))),
('jane.smith@gmail.com', '+9876543210', 'Jane', 'Smith', 'Female', 25, 'ACTIVE', crypt('XYZ456',gen_salt('md5')), crypt('janeX@4321', gen_salt('md5')));

  

