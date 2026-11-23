SELECT *
FROM company_dim
LIMIT 10;

/*Find the top 10 companies for posting jobs.
  They must have >3000 job postings.
  Limit to US jobs*/

SELECT 
    cd.name AS company_name,
    COUNT(jpf.job_id) as postings_count
FROM job_postings_fact jpf
LEFT JOIN company_dim as cd
    ON jpf.company_id = cd.company_id
WHERE jpf.job_country = 'United States'
GROUP BY cd.name
HAVING COUNT(jpf.job_id) > 3000
ORDER BY postings_count DESC
LIMIT 10;
