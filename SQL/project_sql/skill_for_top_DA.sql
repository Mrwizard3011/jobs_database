/*
Select 100 top paying jobs 
Figure out the top skill in these jobs
*/
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 100
)

SELECT 
    skills,
    COUNT(SD.skill_id) AS skill_count

FROM
    top_paying_jobs TPJ
    INNER JOIN skills_job_dim SJD
    ON TPJ.job_id = SJD.job_id
    INNER JOIN skills_dim SD
    ON SJD.skill_id = SD.skill_id
GROUP BY SD.skill_id, SD.skills
ORDER BY skill_count DESC
 
/*
Result:
In top 100 paying jobs:
74 jobs require SQL
39 jobs require python
36 jobs require Tableau
35 jobs require Excel
*/