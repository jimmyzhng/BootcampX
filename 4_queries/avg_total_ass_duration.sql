SELECT avg(total_duration) as avg_total_dur
FROM (SELECT cohorts.name as name, SUM(completed_at-started_at) as total_duration
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name) as total_cohort_duration;