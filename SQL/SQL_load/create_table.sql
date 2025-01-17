CREATE TABLE company_dim (
    company_id INTEGER,
    name VARCHAR(100),
    link VARCHAR(128),
    link_google VARCHAR(256),
    thumbnail VARCHAR(128)
)
;

CREATE TABLE job_postings_fact (
    job_id INTEGER,
    company_id INTEGER,
    job_title_short VARCHAR(32),
    job_title VARCHAR(128),
    job_location VARCHAR(70),
    job_via VARCHAR(96),
    job_schedule_type VARCHAR(40),
    job_work_from_home INTEGER,
    search_location VARCHAR(40),
    job_posted_date TIMESTAMP,
    job_no_degree_mention INTEGER,
    job_health_insurance INTEGER,
    job_country VARCHAR(40),
    salary_rate VARCHAR(4),
    salary_year_avg REAL,
    salary_hour_avg REAL
)
;

CREATE TABLE skills_dim (
    skill_id INTEGER,
    skills VARCHAR(16),
    type VARCHAR(16)
)
;

CREATE TABLE skills_job_dim (
    job_id INTEGER,
    skill_id INTEGER
)