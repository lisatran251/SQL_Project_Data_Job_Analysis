/*
SELECT
    CASE 
        WHEN column_name = 'Value1' THEN 'description for value1'
        WHEN column_name = 'Value2' THEN 'description for value2'
        ELSE 'Other'
    END AS column_description 
FROM
    table_name; 

*/

-- SELECT  
--     COUNT(job_id) AS number_of_jobs,
--     CASE    
--         WHEN job_location = 'Anywhere' THEN 'Remote'
--         WHEN job_location = 'New York, NY' THEN 'Local'
--         ELSE 'On site'
    
--     END AS location_category 

-- FROM job_postings_fact

-- WHERE   
--     job_title_short = 'Data Analyst'

-- GROUP BY
--     location_category;

/*
Label new column as follows:
    - 'Anywhere' jobs as 'Remote'
    - 'New York, NY' jobs as 'Local'
    - Otherwise 'Onsite'
*/


-- -- Subqueries: nested inside a larger query, used in SELECT, FROM and WHERE
-- SELECT *
-- FROM ( -- Subquery starts here
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date) = 1
--     )
--     AS january_jobs;


-- -- CTE: define a temporary result set that you can reference, can reference with a SELECT, INSERT, UPDATE or DELETE
-- -- defined with WITH
-- WITH january_jobs AS (-- CTE starts here
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date) = 1
--     )

-- SELECT *
-- FROM january_jobs;

-- SELECT name AS company_name
-- FROM company_dim
-- WHERE company_id IN (
--     SELECT 
--         company_id 
--     FROM job_postings_fact
--     WHERE 
--         job_no_degree_mention = true
-- )

-- WITH january_jobs AS (
--     SELECT * 
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date) = 1 
-- )

-- SELECT *
-- FROM january_jobs; 

-- SELECT column_name 
-- FROM table_one 

-- UNION -- combine the two tables 

-- SELECT column_name 
-- FROM table_two; 

-- -- To get rid of duplicate rows 

WITH january_jobs AS (
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
), february_jobs AS (
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2 
)
SELECT
    job_title_short, company_id, job_location
FROM 
    january_jobs
UNION
SELECT 
    job_title_short, company_id, job_location
FROM 
    february_jobs;


