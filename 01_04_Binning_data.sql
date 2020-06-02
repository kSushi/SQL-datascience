
-- ***********************************************************
-- Turn off safe updates to allow for bulk changes
-- ***********************************************************
SET SQL_SAFE_UPDATES = 0;

-- ***********************************************************
-- Set Age range to sets of 10
-- Set Salary range to predefined ranges
-- ***********************************************************
UPDATE website_visits
SET AGE_RANGE =	CONCAT( FLOOR(AGE/10) * 10, 
					' - ', 
                    (FLOOR(AGE/10) * 10) + 10),
	SALARY_RANGE =	(CASE true 	
						WHEN (SALARY >= 100) THEN '100K +' 
						WHEN (SALARY >= 50) THEN '50K - 100K'
						ELSE '< 50K' 
                        END );

-- ***********************************************************
-- Turn off safe updates to allow for bulk changes
-- ***********************************************************
SELECT AGE,AGE_RANGE, SALARY, SALARY_RANGE 
FROM website_visits;