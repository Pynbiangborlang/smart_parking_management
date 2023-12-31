-- USER PARKING VIEW --
CREATE VIEW USER_PARKING_VIEW AS 
SELECT NAME FROM PARKING_SPACE WHERE STATUS = 'VACANT';


-- USER RUNNING COST VIEW --
CREATE VIEW USER_RUNNING_COST AS
SELECT
    UPH.check_in,
    (
        SELECT ST.RATE_PER_MIN * EXTRACT(EPOCH FROM (CURRENT_TIMESTAMP - UPH.check_in)) / 60
        FROM SPACE_TYPE ST
        WHERE UPH.check_out IS NULL
        LIMIT 1
    ) AS RUNNING_COST
FROM
    USER_PARKING_HISTORY UPH
WHERE UPH.check_in IS NOT NULL AND UPH.check_out IS NULL;



