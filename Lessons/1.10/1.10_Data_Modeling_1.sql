SELECT 
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM 
    job_postings_fact
LIMIT 10;

SELECT 
    * 
FROM 
    company_dim
WHERE 
    name IN ('Facebook', 'Google', 'Amazon')


SELECT *
FROM skills_dim
LIMIT 5;

--Querying information Schema for tables information
SELECT *
FROM information_schema.tables
WHERE table_catalog = 'data_jobs';

SELECT *
FROM information_schema.table_constraints;

