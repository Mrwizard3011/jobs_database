COPY company_dim (
    company_id,
    name,
    link,
    link_google,
    thumbnail
)
FROM 'C:\Users\Dung Phan\Desktop\jobs_database\data\company_dim.csv'
DELIMITER ','
CSV HEADER
;


COPY job_postings_fact (
    job_id, 
    company_id, 
    job_title_short, 
    job_title, 
    job_location, 
    job_via, 
    job_schedule_type, 
    job_work_from_home, 
    search_location, 
    job_posted_date, 
    job_no_degree_mention, 
    job_health_insurance, 
    job_country, 
    salary_rate, 
    salary_year_avg, 
    salary_hour_avg
)
FROM 'C:\Users\Dung Phan\Desktop\jobs_database\data\job_postings_fact.csv'
DELIMITER ','
CSV HEADER
;

COPY skills_dim (
    skill_id,
    skills,
    type
)
FROM 'C:\Users\Dung Phan\Desktop\jobs_database\data\skills_dim.csv'
DELIMITER ','
CSV HEADER
;

COPY skills_job_dim (
    job_id,
    skill_id
)
FROM 'C:\Users\Dung Phan\Desktop\jobs_database\data\skills_job_dim.csv'
DELIMITER ','
CSV HEADER
;