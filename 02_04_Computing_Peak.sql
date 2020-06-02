-- ***********************************************************
-- Compute peak concurrent sessions by hour
-- ***********************************************************

-- Set the running peak count as 0
SELECT @current_peak:=0;

-- compute peak by hour of day.
SELECT DATE_FORMAT(TS,'%H') AS Hour, MAX(PEAK_VAL) 
FROM
	( SELECT TS, INCREMENT, 
			@current_peak:=@current_peak + INCREMENT AS PEAK_VAL 
	  FROM
		(SELECT DATE_STARTED AS TS, 
			1 AS INCREMENT , ID
        FROM website_visits
		UNION
		SELECT DATE_ADD(DATE_STARTED, INTERVAL DURATION SECOND ) AS TS ,
			-1 AS INCREMENT , ID
        FROM website_visits
		ORDER BY 1) 
        AS t1) 
    AS t2
GROUP BY DATE_FORMAT(TS,'%H');
