--Getting the total amount of incomplete assignments for Ibrahim
--This way we only need to join students with submissions

SELECT (
  SELECT count(assignments)
  FROM assignments
)-count(assignment_submissions) as total_incomplete
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

-- If it returns a single value, can be used in our SELECT statement

SELECT (
  SELECT count(*)
  FROM table_name
) as total, other_column
FROM other_table_name
ORDER BY total;

-- A select statement can be used as a data source for another select statement

-- Finding Average of total student: use a nested select
SELECT avg(total_students) as avg_students
FROM ( SELECT count(students) as total_students, cohorts.name as cohort
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
) as totals_table;

-- Search within a result IN

-- This gives us all completed assignments by Ibrahim
SELECT assignment_id
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

-- This returns (1, 2, 3, 4, 5, ...)
-- To find all incomplete assignments, we:
SELECT assignments.name
FROM assignments
WHERE id NOT IN ( SELECT assignment_id
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel');
