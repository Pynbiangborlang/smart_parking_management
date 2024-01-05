--4 PARKING SENSORS
INSERT INTO parking_schema.PARKING_SENSOR(tag, status, space_id) VALUES
('SEC1-SP1-S1',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC1-SP1')),
('SEC1-SP2-S2',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC1-SP2')),
('SEC1-SP3-S3',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC1-SP3')),
('SEC1-SP4-S4',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC1-SP4')),
('SEC1-SP5-S3',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC1-SP5')),
('SEC1-SP6-S4',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC1-SP6')),
('SEC2-SP1-S1',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP1')),
('SEC2-SP2-S2',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP2')),
('SEC2-SP3-S3',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP3')),
('SEC2-SP4-S4',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP4')),
('SEC2-SP5-S5',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP5')),
('SEC2-SP6-S6',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP6')),
('SEC2-SP7-S7',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP7')),
('SEC2-SP8-S8',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP8')),
('SEC2-SP9-S9',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP9')),
('SEC2-SP10-S10', 'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP10')),
('SEC2-SP11-S11', 'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP11')),
('SEC2-SP12-S12', 'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC2-SP12')),
('SEC3-SP1-S1',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP1')),
('SEC3-SP2-S2',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP2')),
('SEC3-SP3-S3',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP3')),
('SEC3-SP4-S4',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP4')),
('SEC3-SP5-S5',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP5')),
('SEC3-SP6-S6',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP6')),
('SEC3-SP7-S7',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP7')),
('SEC3-SP8-S8',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP8')),
('SEC3-SP9-S9',	'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP9')),
('SEC3-SP10-S10', 'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP10')),
('SEC3-SP11-S11', 'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP11')),
('SEC3-SP12-S12', 'ACTIVE' ,(select space_id from parking_schema.parking_space where name = 'SEC3-SP12'));

--6 GATES
-- Insert data into GATES table
INSERT INTO parking_schema.GATES (TYPE, SENSOR_TAG, SENSOR_STATUS, PARKING_LOT_ID) VALUES
  ('ENTRY', 'ENT001', 'ACTIVE', 1),
  ('EXIT', 'EXT001', 'ACTIVE', 1);