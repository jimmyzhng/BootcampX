-- joining
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students JOIN cohorts ON cohort_id = cohorts.id;

-- inner join
-- Above is the same as an inner join
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students INNER JOIN cohorts ON cohorts.id = cohort_id;
-- Missing students with no cohort_id, so innerjoin only gives us rows where
-- there is a match between the two tables

-- outer join
 SELECT students.name as student_name, email, cohorts.name as cohort_name
bootcampx-# FROM students LEFT OUTER JOIN cohorts ON cohorts.id = cohort_id;
-- includes ALL students, even with no cohort_id ()
-- since students is left-side

SELECT students.name as student_name, email, cohorts.name as cohort_name
bootcampx-# FROM students right OUTER JOIN cohorts ON cohorts.id = cohort_id;
-- does NOT include students with no cohort_id. returns all cohorts

SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;
-- full outer returns everything, even when no match

-- We can omit the word OUTER when using outer join:
FROM students LEFT JOIN cohorts ON cohorts.id = cohort_id;
FROM cohorts RIGHT JOIN students ON cohorts.id = cohort_id;

-- Rollover students: If a student's start_date differs from cohort start_date
-- Eg. Student starts in one, gets sick, has to join another one
SELECT students.name as student_name, students.start_date as stud_start_date, 
cohorts.name as cohort_name, cohorts.start_date as cohort_start_date
FROM students JOIN cohorts ON cohorts.id = cohort_id
WHERE students.start_date != cohorts.start_date
ORDER BY cohorts.start_date;
