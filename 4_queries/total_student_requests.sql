SELECT name, count(assistance_requests.*) as total_ass
FROM assistance_requests
JOIN students ON students.id = student_id
WHERE name = 'Elliot Dickinson'
GROUP BY name;