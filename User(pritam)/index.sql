-- index on user table
CREATE INDEX idx_users_email ON parking_schema.USERS(EMAIL);

-- index on user wallet table 
CREATE INDEX idx_user_wallet ON parking_schema.user_wallet(user_id);