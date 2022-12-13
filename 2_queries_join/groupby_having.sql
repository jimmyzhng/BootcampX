SELECT count(assignment_submissions.*) as total_submissions
FROM assignment_submissions;

-- If we wanted to count total submissions for EACH student individually, with student name
-- We want to apply the count() function to groups of data, rather than the entire query -- use count() for each student name

-- Also, only look for currently enrolled students (end date is null)
SELECT students.name as name, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name;

-- Having: is like WHERE, but works on aggregated data (ie. works on the count of assignment submissions)
-- Now, we want to filter those with less than 100 submissions
SELECT students.name as name, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;

-- Having clause is evaluatedbefore select, so we cannot use the 'total_submissions' alias