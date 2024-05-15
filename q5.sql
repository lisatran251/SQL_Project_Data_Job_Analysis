-- 5. What are the average salaries offered by each company for the 'DA' position 
SELECT
    company_dim.name AS company_name,
    AVG(job_postings_fact.salary_year_avg) AS avg_salary

FROM job_postings_fact

JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL

GROUP BY
    company_dim.name

ORDER BY
    avg_salary DESC

LIMIT 10; 