CREATE USER PARKING_LOT_ADMIN LOGIN;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE parking_schema.PARKING_SENSOR TO PARKING_LOT_ADMIN;
GRANT SELECT ON TABLE PARKING_SCHEMA.PARKING_SENSOR_READING TO PARKING_LOT_ADMIN;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE parking_schema.GATES TO PARKING_LOT_ADMIN;
GRANT SELECT ON TABLE parking_schema.GATE_SENSOR_READING TO PARKING_LOT_ADMIN;

-- GRANT SELECT ON views
GRANT SELECT ON parking_schema.WORING_SENSORS TO  PARKING_LOT_ADMIN;
GRANT SELECT ON parking_schema.SENSORS_UNDER_MAINTENANCE TO  PARKING_LOT_ADMIN;
GRANT SELECT ON parking_schema.DAILY_PARKING_ENTRY_TRENDS TO  PARKING_LOT_ADMIN;
GRANT SELECT ON parking_schema.DAILY_PARKING_EXIT_TRENDS TO  PARKING_LOT_ADMIN;



