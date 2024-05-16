# Introduction 
Welcome to the Job Market Analysis Project! In today's rapidly evolving job market, understanding the dynamics that drive employment opportunities, compensation, and employer benefits is crucial for job seekers and human resources professionals alike. This project aims to delve deep into these aspects, providing insights into in-demand skills, top-paying job titles, and the competitive offers provided by various companies.

# Background
### This project is built to answer the following questions:

1. What are the top 10 high-paying jobs in 2023?

2. What are the top 5 skills required for data scientist?

3. What are the top 10 companies offered jobs without a degree?

4. What are the top 10 companies offered work from home jobs?

5. What are the average salaries offered by each company for the 'DA' position 

# Data and Tools Used
## Data
This project leverages data curated by Luke Barousse, which encompasses a broad spectrum of job market dynamics.

## Tools Used
* SQL 
* PostgreSQL 
* Visual Studio Code 
* Git and GitHub

# The Analysis 
## 1. Top 10 high-paying jobs in 2023
This SQL script fetches the highest-paying job for each title from the 2023 job postings, focusing on those with non-null salaries. It ranks these jobs within their respective titles by salary in descending order and selects the top one from each group. Finally, it lists the top 10 highest salaries, showing only the best-paid position for each unique job title.

```
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
```
![Average Yearly Salaries for Top 10 High-Paying Jobs in 2023](q1.png)
_Bar graph visualizing the salary for the top 10 salaries; ChatGPT generated this graph from the SQL query results._

As shown, the graph provides a clear comparison of the salaries across various job roles, with "Data Scientist" being the highest paid and "Cloud Engineer" at the lower end of the top 10 scale for this dataset. The salary range is varied from $280,000 to $960,000. 
