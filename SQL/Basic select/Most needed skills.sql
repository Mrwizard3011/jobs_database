/*
Find the count of the number of remote job posting per skill
    - Display top 5 skills by their demand in remote jobs
    - Include skill_id, name, count of postings requite per skill
*/

WITH remote_job_skills AS (
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = 1
    GROUP BY
        skill_id
)

SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count  
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;

/*
Results:
"skill_id","skill_name","skill_count"
2,"sql","3660"
0,"python","3645"
69,"aws","1462"
1,"r","1304"
160,"tableau","1240"

*/