
-- ***********************************************************
-- Create the website_visits table
-- ***********************************************************
--create database Sql_datascience
use Sql_datascience
DROP TABLE IF EXISTS `website_visits` ;

CREATE TABLE `website_visits` (
  `ID` int(11) NOT NULL,
  `CUSTOMER_NAME` varchar(255) DEFAULT NULL,
  `CUSTOMER_TYPE` int(11) DEFAULT NULL,
  `DATE_STARTED` datetime DEFAULT NULL,
  `DURATION` double DEFAULT NULL,
  `GENDER` varchar(45) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  `REVIEW_DURATION` double DEFAULT NULL,
  `RELATED_DURATION` double DEFAULT NULL,
  `PURCHASED` int(11) DEFAULT 0,
  `IS_MALE` int(11) DEFAULT NULL,
  `IS_FEMALE` int(11) DEFAULT NULL,
  `VIEWED_REVIEW` int(11) DEFAULT NULL,
  `VIEWED_RELATED` int(11) DEFAULT NULL,
  `AGE_RANGE` varchar(255) DEFAULT NULL,
  `SALARY_RANGE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
select * from website_visits

-- ***********************************************************
-- Disable checks for insert of every row. This makes loading
-- really fast
-- ***********************************************************

set unique_checks = 0;
set foreign_key_checks = 0;
set sql_log_bin=0;
set autocommit = 0;

-- ***********************************************************
-- Load the csv file
-- ***********************************************************

SET GLOBAL local_infile=ON;

LOAD DATA LOCAL INFILE  
	"C:\\Users\\Sushil\\Desktop\\Data science\\SQL\\Ex_Files_MySQL_Advanced_Tips\\Exercise Files\\website_visit_data.csv" 
INTO TABLE `website_visits`  
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n' 
	IGNORE 1 LINES
	(ID, CUSTOMER_NAME , CUSTOMER_TYPE, DATE_STARTED, DURATION,
		GENDER,AGE,SALARY,REVIEW_DURATION,RELATED_DURATION,PURCHASED );

SELECT * FROM website_visits;

-- ***********************************************************
-- Finally commit the transaction
-- ***********************************************************
commit;

-- ***********************************************************
-- Reset all the disabled flags.
-- ***********************************************************

set autocommit = 1;
set unique_checks = 1;
set foreign_key_checks = 1;
set sql_log_bin=1;
