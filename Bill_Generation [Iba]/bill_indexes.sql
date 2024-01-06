-- CREATING INDEXES
CREATE INDEX idx_bill_walletid ON parking_schema.BILL(WALLET_ID);

CREATE INDEX idx_wallet_history_amount ON parking_schema.USER_WALLET_HISTORY(AMOUNT);
