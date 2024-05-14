SELECT * 
FROM company_dim
LIMIT 10;

SELECT salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
LIMIT 1000;

SELECT * 
FROM skills_dim
LIMIT 10;

SELECT * 
FROM skills_job_dim
LIMIT 10;