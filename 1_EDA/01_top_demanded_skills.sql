/* Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
-Focus on South African job market
- Why? Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work

*/
SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id 
INNER JOIN skills_dim AS sd
    ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
    AND jpf.job_country = 'South Africa'
GROUP BY sd.skills
ORDER BY demand_count DESC
LIMIT 10;

/*
Here's a breakdown of the mmost in demand skills for data engineers in the South African remote job market:
SQL and Python are the most sought-after skills, with 174 and 156 job postings respectively. 
Cloud platforms like AWS and Azure also show significant demand, with 120 and 98 postings. 
Big data technologies such as Spark and Kafka are also in demand, indicating the importance of handling large datasets. 
Additionally, workflow orchestration tools like Airflow, containerization with Docker, and data warehousing with Redshift are valuable skills for remote data engineering roles. 
Java remains relevant as well, highlighting the need for versatile programming capabilities in this field.

┌──────────┬──────────────┐
│  skills  │ demand_count │
│ varchar  │    int64     │
├──────────┼──────────────┤
│ sql      │          174 │
│ python   │          156 │
│ aws      │          120 │
│ azure    │           98 │
│ spark    │           73 │
│ kafka    │           52 │
│ airflow  │           49 │
│ docker   │           48 │
│ redshift │           48 │
│ java     │           48 │
└──────────┴──────────────┘
  10 rows       2 columns

*/


