-- CREATION OF A VIEW FOR A USER'S BILL
CREATE OR REPLACE VIEW parking_schema.user_bill_view AS
SELECT 
	u.first_name,
	u.last_name, 
	u.email,
	u.phone,
	w.wallet_id,
	b.amount,
	b.status,
	b.parking_id
FROM 
	parking_schema.USERS u
JOIN 
	parking_schema.USER_WALLET w ON u.user_id = w.user_id
JOIN
	parking_schema.BILL b ON w.wallet_id = b.wallet_id
ORDER BY u.user_id;