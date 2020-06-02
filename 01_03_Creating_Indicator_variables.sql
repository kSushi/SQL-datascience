
-- ***********************************************************
-- Turn off safe updates to allow for bulk changes
-- ***********************************************************
SET SQL_SAFE_UPDATES = 0;

-- ***********************************************************
-- Create all indicator variables in one run
-- ***********************************************************
UPDATE website_visits
SET IS_MALE = CASE GENDER = 'Male'
					WHEN true THEN 1
                    ELSE 0
                    END,
	IS_FEMALE = CASE GENDER = 'Female'
					WHEN true THEN 1
                    ELSE 0
                    END,
	VIEWED_REVIEW = CASE REVIEW_DURATION > 0
						WHEN true THEN 1
						ELSE 0
						END,
	VIEWED_RELATED = CASE RELATED_DURATION > 0
						WHEN true THEN 1
						ELSE 0
						END;

-- ***********************************************************
-- Check changes
-- ***********************************************************
SELECT GENDER, IS_MALE,IS_FEMALE,
	REVIEW_DURATION, RELATED_DURATION, 
	VIEWED_REVIEW, VIEWED_RELATED 
FROM website_visits;