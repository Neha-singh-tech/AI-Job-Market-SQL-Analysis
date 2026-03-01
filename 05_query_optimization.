-- File: 05_Indexes.sql
-- Project: AI Job Market SQL Analysis
-- Description: Creating indexes to improve query
-- performance on frequently used columns.

------------------------Add performance optimization indexes---------------------------------------
use Data_Analyst_Project
select * from AI_job_market_cleaned

create Index Idx_country 
on AI_job_market_cleaned (country)

create Index Idx_Salary

on AI_job_market_cleaned (Salary_usd)
