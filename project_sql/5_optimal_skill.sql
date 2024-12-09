SELECT
    skills,
    COUNT(skills_job_dim.skill_id) AS count,
    ROUND(AVG(salary_year_avg),0) AS average_salary
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
    count DESC,
    average_salary DESC
LIMIT 25;