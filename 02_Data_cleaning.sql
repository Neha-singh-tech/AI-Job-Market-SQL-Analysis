-- File: 02_Data_cleaning.sql
-- Project: AI Job Market SQL Analysis
-- Description: Cleans raw dataset by handling
-- null values, removing duplicates, and
-- standardizing data formats.

use Data_Analyst_Project
select * from AI_job_market

-- Check Total Records
   select count(*) as Total_Data_Size from AI_job_market
-- To check Columns Data Type
   Exec sp_help AI_job_market
   
-- checks for Null Values   
   select * from AI_job_market 
   where country is null 
      or salary_usd is null 
	  or experience_level is null 
	  or salary_percentile is null ;

-- Null Values Removes (If exists)
   delete from AI_job_market
   where salary_usd is null 
	  or experience_level is null 
	  or salary_percentile is null ;

--Replace Null Values with Default value
   update AI_job_market 
   set country = 'Unkown'
   where country is null;

--- Remove Duplicate Records 
--- Logical duplicate check					 
select job_role,country, salary_usd , COUNT(*) as Dulpicate_Count From AI_job_market
group by job_role ,country,salary_usd
having count(*)>1;

--- Checking Exact Duplicates
-- Step 1: Total rows
SELECT COUNT(*) AS total_rows
FROM AI_job_market;

-- Step 2: Distinct rows
   select count(*) as Distinct_rows 
   from (select distinct * from AI_job_market )
   as temp;
--Remove Extra Spaces
 UPDATE AI_job_market
 SET country = LTRIM(RTRIM(country)),
 job_role = LTRIM(RTRIM(job_role)),
 ai_specialization = LTRIM(RTRIM(ai_specialization))
 
 --Standardize Text Format
 UPDATE AI_job_market
 set country = UPPER(left(country,1))+ LOWER(SUBSTRING(country,2,len(country)))


Select* into AI_job_market_cleaned
from AI_job_market
order by id

select * from AI_job_market_cleaned
--Validate Salary Values
 select * from AI_job_market_cleaned
 where salary_usd <=0

