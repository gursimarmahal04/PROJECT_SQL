/*
What are the top in- demand skills for the data analyst
*/


WITH top_skills AS(
	SELECT 
		skill_id,
		COUNT(*) AS skill_count
	FROM
		skills_job_dim
	INNER JOIN job_postings_fact 
		ON skills_job_dim.job_id=job_postings_fact.job_id
	WHERE 
		job_title_short='Data Analyst'
	GROUP BY
		skill_id
)
SELECT
	skills,
	skill_count
FROM
	skills_dim
INNER JOIN top_skills 
	ON top_skills.skill_id=skills_dim.skill_id
ORDER BY 
	skill_count desc
LIMIT 5

