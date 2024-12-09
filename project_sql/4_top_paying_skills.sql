/*
What are the top skills based on salary?
*/
SELECT
    skills,
    ROUND(AVG(salary_year_avg),00) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim
    ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short='Data Analyst'
GROUP BY 
    skills
ORDER BY
    average_salary DESC
LIMIT 10;

-- Same query but using CTEs

WITH skills_pay AS(
    SELECT
        skill_id,
        ROUND(AVG(salary_year_avg),0) AS salary
    FROM
        skills_job_dim
    INNER JOIN job_postings_fact
        ON job_postings_fact.job_id=skills_job_dim.job_id
    WHERE
        salary_year_avg IS NOT NULL AND
        job_title_short='Data Analyst'
    GROUP BY 
        skill_id
    ORDER BY
        salary DESC
    LIMIT 10
)

SELECT 
    skills,
    salary
FROM 
    skills_pay
INNER JOIN skills_dim 
    ON skills_pay.skill_id=skills_dim.skill_id
ORDER BY
    salary DESC

