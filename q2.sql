-- What are the top 5 skills required for data scientist?
SELECT
    skills_dim.skills,
    COUNT(*) AS frq

FROM 
    job_postings_fact
JOIN 
    skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
-- Now skills_job_dim have both job_title and job id -> join for skills 
JOIN 
    skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Scientist'
    -- or ILIKE '%Data Scientist%' for case sensitive
GROUP BY
    skills_dim.skills
ORDER BY    
    frq DESC
LIMIT 5; 