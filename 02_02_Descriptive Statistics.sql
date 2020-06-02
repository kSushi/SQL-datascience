
-- ***********************************************************
-- Popular descriptive statistical functions
-- ***********************************************************
SELECT SALARY_RANGE,
	AVG(DURATION) as 'Mean',
    MIN(DURATION) as 'Min',
    MAX(DURATION) as 'Max',
    VARIANCE(DURATION) as 'Variance',
	STDDEV(DURATION) as 'Standard Deviation',
	( SUM( DURATION * AGE ) - SUM( DURATION ) * SUM( AGE ) / 
	COUNT( DURATION ) ) / COUNT( AGE )  as 'Covariance Duration / Age'
FROM website_visits
GROUP BY SALARY_RANGE;