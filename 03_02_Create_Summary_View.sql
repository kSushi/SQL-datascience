
-- ***********************************************************
-- Create view for summary statistics
-- ***********************************************************

CREATE VIEW `visit_summary_view` AS
SELECT DATE_FORMAT(DATE_STARTED,'%Y-%m-%d %H') AS Hour, 
	CUSTOMER_TYPE,
    GENDER,
    AGE_RANGE,
    SALARY_RANGE,
    count(*) TOTAL_VISITS,
	SUM(DURATION) as TOTAL_DURATION,
    SUM(VIEWED_REVIEW) as REVIEW_VIEWS,
    SUM(VIEWED_RELATED) as RELATED_VIEWS
FROM website_visits 
GROUP BY DATE_FORMAT(DATE_STARTED,'%Y-%m-%d %H'),
	CUSTOMER_TYPE,
    GENDER,
    AGE_RANGE,
    SALARY_RANGE;