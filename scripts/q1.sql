-- Find top10 high-paying jobs 
SELECT 
    job_title_short,
    job_posted_date,
    salary_year_avg
FROM ( -- Logic: salary_year_avg sorted in desc order -> rank 1st of ea. job title to represent
    SELECT 
        job_title_short,
        job_posted_date,
        salary_year_avg,
        ROW_NUMBER() OVER (
            PARTITION BY job_title_short 
            ORDER BY salary_year_avg DESC
            ) AS rn
    FROM 
        job_postings_fact
    WHERE
        EXTRACT(YEAR FROM job_posted_date) = 2023
        AND salary_year_avg IS NOT NULL
) AS a
WHERE rn = 1
ORDER BY salary_year_avg DESC
LIMIT 10;
