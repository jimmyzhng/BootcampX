SELECT cohorts.name as name, avg(completed_at - started_at) as avg_ass_time
FROM assistance_requests 
JOIN students ON student_id = students.id
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY avg_ass_time;
