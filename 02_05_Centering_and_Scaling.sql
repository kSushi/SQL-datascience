
-- ***********************************************************
-- First find mean and standard deviation for Duration & Age
-- ***********************************************************

SELECT @mean_duration := AVG(DURATION),
	@std_duration := STDDEV(DURATION),
    @mean_age := AVG(AGE),
    @std_age := STDDEV(AGE)
 FROM website_visits;
 
-- ***********************************************************
-- Center and Scale age and duration 
-- ***********************************************************

SELECT DURATION,	
		ROUND(( DURATION - @mean_duration) / 
			@std_duration,2) AS CENT_DURATION,
		AGE,
		ROUND((AGE - @mean_age) / 
			@std_age,2) AS CENT_AGE
FROM website_visits;

