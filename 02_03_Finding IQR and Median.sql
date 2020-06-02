

-- ***********************************************************
-- Finding Intra-Quartile Range - 25th, 50th and 75th values
-- ***********************************************************

-- fetch total rows
SELECT @total_rows:=125;

-- find which row would be 25th, 50th and 75th percentile
SELECT @25_per := CAST( @total_rows /4 as SIGNED);
SELECT @50_per := CAST( @total_rows /2 as SIGNED);
SELECT @75_per := CAST( @total_rows - @25_per as SIGNED);

-- print percentile row numbers
SELECT @total_rows, @25_per, @50_per, @75_per;

-- initialize values for durations at percentile positions
SELECT @25_val:=0;
SELECT @50_val:=0;
SELECT @75_val:=0;

-- count row numbers
SELECT @row_num:=0;

-- SELECT rows ORDER BY duration
SELECT @row_num := @row_num + 1 ,
	CASE WHEN @row_num = @25_per THEN @25_val := DURATION ELSE 1 end,
	CASE WHEN @row_num = @50_per THEN @50_val := DURATION ELSE 1 end,
	CASE WHEN @row_num = @75_per THEN @75_val := DURATION ELSE 1 end,
	DURATION 
FROM website_visits 
ORDER BY DURATION LIMIT 125 ;

-- print out the results
SELECT @25_val, @50_val, @75_val;

