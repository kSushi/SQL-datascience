
-- ***********************************************************
-- Convert columns to rows of data
-- ***********************************************************
SELECT ID, 'Viewed Reviews' as VIEW_TYPE, 
		REVIEW_DURATION as VIEW_DURATION
FROM website_visits
WHERE REVIEW_DURATION > 0
UNION
SELECT ID, 'Viewed Related Products',
		RELATED_DURATION
FROM website_visits
WHERE RELATED_DURATION > 0
ORDER BY 1;

-- ***********************************************************
-- Convert rows to columns of data
-- Split duration by customer type into 4 columns
-- ***********************************************************
SELECT AGE_RANGE,
	SUM(CASE CUSTOMER_TYPE=1
			WHEN true THEN DURATION ELSE 0 END) 
	as 'Type 1 Duration',
	SUM(CASE CUSTOMER_TYPE=2
			WHEN true THEN DURATION ELSE 0 END) 
	as 'Type 2 Duration',
	SUM(CASE CUSTOMER_TYPE=3
			WHEN true THEN DURATION ELSE 0 END) 
	as 'Type 3 Duration',
	SUM(CASE CUSTOMER_TYPE=4
			WHEN true THEN DURATION ELSE 0 END) 
	as 'Type 4 Duration'
FROM website_visits
GROUP BY AGE_RANGE