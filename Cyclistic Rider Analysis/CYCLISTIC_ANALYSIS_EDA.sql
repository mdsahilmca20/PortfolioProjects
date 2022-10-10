-- CREATING DATABASE

CREATE DATABASE CYCLISTIC_DATABASE_2019;

USE CYCLISTIC_DATABASE_2019;

-- CREATING TABLE FOR JANUARY 2021 TRIP DATA
CREATE TABLE TRIP1(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);

-- CREATING TABLE FOR FEBRUARY 2021 TRIP DATA

CREATE TABLE TRIP2(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);

-- CREATING TABLE FOR MARCH 2021 TRIP DATA

CREATE TABLE TRIP3(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);

-- CREATING TABLE FOR APRIL 2021 TRIP DATA

CREATE TABLE TRIP4(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);

SELECT * FROM TRIP4;

-- CREATING TABLE FOR MAY 2021 TRIP DATA

CREATE TABLE TRIP5(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);

SELECT *FROM TRIP5;
-- CREATING TABLE FOR JUNE 2021 TRIP DATA

CREATE TABLE TRIP6(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);

SELECT *FROM TRIP6;
-- CREATING TABLE FOR JULY 2021 TRIP DATA

CREATE TABLE TRIP7(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);


-- CREATING TABLE FOR AUGUST 2021 TRIP DATA

CREATE TABLE TRIP8(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);

-- CREATING TABLE FOR SEPTEMBER 2021 TRIP DATA

CREATE TABLE TRIP9(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);

-- CREATING TABLE FOR OCTOBER 2021 TRIP DATA

CREATE TABLE TRIP10(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);

-- CREATING TABLE FOR NOVEMBER 2021 TRIP DATA

CREATE TABLE TRIP11(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);

-- CREATING TABLE FOR DECEMBER 2021 TRIP DATA

CREATE TABLE TRIP12(
ride_id	varchar(100) primary key,
rideable_type varchar(100),
started_at varchar(100),
ended_at varchar(100),
start_station_name varchar(100),
start_station_id varchar(100),
end_station_name varchar(100),
end_station_id varchar(100),
start_lat varchar(100),
start_lng varchar(100),
end_lat varchar(100),
end_lng varchar(100),
member_casual varchar(100)
);


-- COMBINING TABLES TRIP1, TRIP2, TRIP3, ......,TRIP12  FOR 2021 TRIP DATA AS A WHOLE

CREATE TABLE TRIP_2021 AS SELECT * FROM
(SELECT * FROM TRIP1)
UNION
(SELECT * FROM TRIP2)
UNION
(SELECT * FROM TRIP3)
UNION
(SELECT * FROM TRIP4)
UNION
(SELECT * FROM TRIP5)
UNION
(SELECT * FROM TRIP6)
UNION
(SELECT * FROM TRIP7)
UNION
(SELECT * FROM TRIP8)
UNION
(SELECT * FROM TRIP9)
UNION
(SELECT * FROM TRIP10)
UNION
(SELECT * FROM TRIP11)
UNION
(SELECT * FROM TRIP12);


SELECT * FROM TRIP_2021;

------------------------------------------- RETREIVE MONTHLY RIDE COUNT


--SELECT CONVERT_TIMEZONE('Asia/Kolkata',TO_TIMESTAMP(STARTED_AT)) FROM TRIP_2021;

--SELECT TO_TIMESTAMP(STARTED_AT) FROM TRIP_2021;

--SELECT EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) AS MTH FROM TRIP_2021;

--SELECT MONTHNAME(TO_TIMESTAMP(STARTED_AT)) AS MTH FROM TRIP_2021;


SELECT MONTHNAME(TO_TIMESTAMP(STARTED_AT)) AS MONTH, COUNT(*) AS TOTAL_RIDE 
FROM TRIP_2021 GROUP BY MONTHNAME(TO_TIMESTAMP(STARTED_AT)) ORDER BY COUNT(*) DESC;


------------------------------------------- RETREIVE RIDE COUNT DAYNAME WISE

SELECT DAYNAME(TO_TIMESTAMP(STARTED_AT)) AS DAY, COUNT(*) AS TOTAL_RIDE 
FROM TRIP_2021 GROUP BY DAYNAME(TO_TIMESTAMP(STARTED_AT)) ORDER BY COUNT(*) DESC;


------------------------------------------- RETREIVE RIDE COUNT QUARTER WISE

SELECT QUARTER(TO_TIMESTAMP(STARTED_AT)) AS QUARTER, COUNT(*) AS TOTAL_RIDE 
FROM TRIP_2021 GROUP BY QUARTER(TO_TIMESTAMP(STARTED_AT)) ORDER BY COUNT(*) DESC;


------------------------------------------- RETREIVE RIDE COUNT DAY WISE

SELECT TO_DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE, COUNT(*) AS TOTAL_RIDE 
FROM TRIP_2021 GROUP BY TO_DATE(TO_TIMESTAMP(STARTED_AT)) ORDER BY TO_DATE(TO_TIMESTAMP(STARTED_AT));


-------------------------------------------- RETREIVE RIDE COUNT RIDER TYPE WISE

SELECT MEMBER_CASUAL AS RIDER_TYPE, COUNT(*) AS TOTAL_RIDE FROM TRIP_2021 GROUP BY MEMBER_CASUAL ORDER BY COUNT(*) DESC;



-------------------------------------------WHOLE YEAR RIDE COUNT(MEMBER AND CASUAL) BY DATE, QUARTER,  MONTH AND DAY 



SELECT
TO_DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE,
QUARTER(TO_TIMESTAMP(STARTED_AT)) AS QUARTER,
MONTHNAME(TO_TIMESTAMP(STARTED_AT)) AS MONTH,
DAYNAME(TO_TIMESTAMP(STARTED_AT)) AS DAY,
COUNT(*) AS TOTAL_RIDE,
COUNT(CASE WHEN MEMBER_CASUAL='member' THEN RIDE_ID END) AS MEMBER_RIDER_COUNT,
COUNT(CASE WHEN MEMBER_CASUAL='casual' THEN RIDE_ID END) AS CASUAL_RIDER_COUNT
FROM TRIP_2021 
GROUP BY 
TO_DATE(TO_TIMESTAMP(STARTED_AT)),
QUARTER(TO_TIMESTAMP(STARTED_AT)),
MONTHNAME(TO_TIMESTAMP(STARTED_AT)),
DAYNAME(TO_TIMESTAMP(STARTED_AT))
ORDER BY TO_DATE(TO_TIMESTAMP(STARTED_AT));


-------------------------------------------- RETREIVE RIDE COUNT BIKE TYPE WISE

SELECT RIDEABLE_TYPE AS BIKE_TYPE, COUNT(*) AS TOTAL_RIDE FROM TRIP_2021 GROUP BY RIDEABLE_TYPE ORDER BY COUNT(*) DESC;

-------------------------------------------- RETRIEVE TRIP DURATION

SELECT TIMESTAMPDIFF(minute,STARTED_AT,ENDED_AT) AS DURATION_MINUTE FROM TRIP_2021;

-------------------------------------------- RETRIEVE TRIP DURATION RIDER TYPE WISE

SELECT MEMBER_CASUAL AS RIDER_TYPE,SUM(TIMESTAMPDIFF(minute,STARTED_AT,ENDED_AT))/60 AS DURATION_HOUR 
FROM TRIP_2021 GROUP BY MEMBER_CASUAL 
ORDER BY SUM(TIMESTAMPDIFF(minute,STARTED_AT,ENDED_AT))/60 DESC;


-------------------------------------------- RETRIEVE TRIP DURATION BY RIDER TYPE AND BIKE TYPE 

SELECT MEMBER_CASUAL AS RIDER_TYPE, RIDEABLE_TYPE AS BIKE_TYPE, SUM(TIMESTAMPDIFF(minute,STARTED_AT,ENDED_AT))/60 AS DURATION_HOUR 
FROM TRIP_2021 
GROUP BY MEMBER_CASUAL, RIDEABLE_TYPE
ORDER BY MEMBER_CASUAL, SUM(TIMESTAMPDIFF(minute,STARTED_AT,ENDED_AT))/60 DESC;


----------------------------------------- COVERED DISTANCE BY EACH RIDE


SELECT 
RIDE_ID,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES 
FROM TRIP_2021
WHERE DISTANCE_MILES IS NOT NULL
ORDER BY 1 DESC; 


---------------------------------- LOOKING FOR STATION NAMES FROM WHERE MAXIMUM RIDES START

SELECT 
START_STATION_NAME,
START_STATION_ID,
COUNT(*) AS TOTAL_RIDE
FROM TRIP_2021
GROUP BY START_STATION_ID,START_STATION_NAME
ORDER BY 3 DESC;


---------------------------------- LOOKING FOR STATION NAMES FROM WHERE MAXIMUM RIDES END


SELECT 
END_STATION_NAME,
END_STATION_ID,
COUNT(*) AS TOTAL_RIDE
FROM TRIP_2021
GROUP BY END_STATION_ID,END_STATION_NAME
ORDER BY 3 DESC;

-------------------------------- OBSERVE DATA WHERE TRIP DURATION IS 0 


--SELECT * FROM TRIP_2021 WHERE TIMESTAMPDIFF(minute,STARTED_AT,ENDED_AT)=0;

SELECT *,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT) AS DURATION_SECOND,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES 
FROM TRIP_2021 
WHERE STARTED_AT = ENDED_AT;




------------------------------------------ RETREIVING ONLY VALUABLE INFORMATION FOR DIFFEREN QUARTER, MONTH AND OTHER BASIC (FOR VISUALIZATION)
----- QUARTER1 RECORD
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 1
AND STARTED_AT != ENDED_AT;






-- QUARTER 2 MONTH 4 RECORD
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 2
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) = 4
AND STARTED_AT != ENDED_AT;

-- QUARTER 2 MONTH 5 RECORD
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 2
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) = 5
AND STARTED_AT != ENDED_AT;


-- QUARTER 2 MONTH 6 RECORD
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 2
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) = 6
AND STARTED_AT != ENDED_AT;

------------------------ QUARTER 3 MONTH 7 MEMBER RECORD

SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 3
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) = 7
AND MEMBER_CASUAL='member'
AND STARTED_AT != ENDED_AT;

-----QUARTER 3 MONTH 7 CASUAL
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 3
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) = 7
AND MEMBER_CASUAL='casual'
AND STARTED_AT != ENDED_AT;

----------QUARTER3 MONTH8 MEMBER
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 3
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) = 8
AND MEMBER_CASUAL='member'
AND STARTED_AT != ENDED_AT;

---------QUARTER 3 MONTH 8 CASUAL
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 3
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) = 8
AND MEMBER_CASUAL='casual'
AND STARTED_AT != ENDED_AT;

------QUARTER 3 MONTH 9 MEMBER
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 3
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) = 9
AND MEMBER_CASUAL='member'
AND STARTED_AT != ENDED_AT;

-----QUARTER 3 MONTH 9 CASUAL
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 3
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) = 9
AND MEMBER_CASUAL='casual'
AND STARTED_AT != ENDED_AT;

------QUARTER 4 MONTH 10
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 4
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) = 10
AND STARTED_AT != ENDED_AT;

--------QUARTER 4 MONTH 11,12
SELECT 
RIDE_ID,
RIDEABLE_TYPE AS BIKE_TYPE,
STARTED_AT AS START_DATE_TIME,
TIMESTAMPDIFF(second,STARTED_AT,ENDED_AT)/60 AS DURATION_MINUTE,
START_STATION_NAME,
END_STATION_NAME,
SQRT(POWER(69.1 * ( END_LAT - START_LAT),  2) + POWER(69.1 * ( START_LNG  - END_LNG )  * COS(END_LAT / 57.3), 2)) AS DISTANCE_MILES,
MEMBER_CASUAL AS RIDER_TYPE
FROM TRIP_2021 
WHERE QUARTER(TO_TIMESTAMP(STARTED_AT)) = 4
AND EXTRACT(MONTH FROM TO_TIMESTAMP(STARTED_AT)) IN (11,12)
AND STARTED_AT != ENDED_AT;