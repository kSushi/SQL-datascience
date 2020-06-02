
-- ***********************************************************
-- Turn off safe updates to allow for bulk changes
-- ***********************************************************
SET SQL_SAFE_UPDATES = 0;

-- ***********************************************************
-- Normalize name to be first name followed by last name
-- Round off duration to be in seconds.
-- ***********************************************************

SELECT CUSTOMER_NAME, DURATION 
FROM website_visits;

UPDATE website_visits
SET CUSTOMER_NAME=
	(CASE INSTR(CUSTOMER_NAME,',') > 0 -- check if name has comma
		WHEN true THEN 
			CONCAT(RIGHT(CUSTOMER_NAME, -- extract first name
						LENGTH(CUSTOMER_NAME) 
						- INSTR(CUSTOMER_NAME,',')),
					' ',
                    LEFT(CUSTOMER_NAME, -- extract last name
						INSTR(CUSTOMER_NAME,',') - 1)) 
		ELSE CUSTOMER_NAME
		END ),
	DURATION = ROUND(DURATION,0); -- round off duration.
	
SELECT CUSTOMER_NAME, DURATION 
FROM website_visits;