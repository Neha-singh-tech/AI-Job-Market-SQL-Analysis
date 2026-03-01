-- File: 01_Create_And_Import_Data.sql
-- Project: AI Job Market SQL Analysis
-- Description: Creates database/table structure
-- and imports AI job market dataset from CSV file.


use Data_Analyst_Project
CREATE TABLE AI_job_market (
    id INT PRIMARY KEY,
    country VARCHAR(50),
    job_role VARCHAR(100),
    ai_specialization VARCHAR(100),
    experience_level VARCHAR(20),
    experience_years INT,
    salary_usd INT,
    bonus_usd INT,
    education_required VARCHAR(50),
    industry VARCHAR(50),
    company_size VARCHAR(20),
    interview_rounds INT,
    year INT,
    work_mode VARCHAR(20),
    weekly_hours DECIMAL(5,2),
    company_rating DECIMAL(3,2),
    job_openings INT,
    hiring_difficulty_score DECIMAL(10,2),
    layoff_risk DECIMAL(5,3),
    ai_adoption_score INT,
    company_funding_billion DECIMAL(10,2),
    economic_index DECIMAL(10,2),
    ai_maturity_years INT,
    offer_acceptance_rate DECIMAL(5,2),
    tax_rate_percent DECIMAL(5,2),
    vacation_days INT,
    skill_demand_score INT,
    automation_risk INT,
    job_security_score INT,
    career_growth_score INT,
    work_life_balance_score INT,
    promotion_speed INT,
    salary_percentile INT,
    cost_of_living_index DECIMAL(5,2),
    employee_satisfaction INT
);

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

BULK INSERT AI_job_market
FROM 'C:\Users\Radhika Neha\Downloads\global_ai_jobs.csv'
 WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
     );

