-- Creating an index for status to increase the performance
CREATE INDEX idx_parking_space_status ON PARKING_SPACE(STATUS);

CREATE INDEX idx_user_wallet_history_user_id ON USER_WALLET_HISTORY(USER_ID);

CREATE INDEX amount_index ON parking_schema.BILL (AMOUNT);
