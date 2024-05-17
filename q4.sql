-- 4. What are the top 10 companies offered work from home jobs?
SELECT 
    company_dim.name,
    COUNT(job_postings_fact.job_id) AS job_count
FROM 
    company_dim
JOIN 
    job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
WHERE 
    job_postings_fact.job_work_from_home = 'True'
GROUP BY 
    company_dim.name
ORDER BY 
    job_count DESC
LIMIT 10;