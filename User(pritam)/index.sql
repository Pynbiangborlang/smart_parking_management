-- index on EMAIL column
CREATE INDEX idx_users_email ON parking_schema.USERS(EMAIL);

-- index on NAME column
CREATE INDEX idx_users_name ON parking_schema.USERS(LAST_NAME, FIRST_NAME);

-- index on PHONE column
CREATE INDEX idx_users_phone ON parking_schema.USERS(PHONE);