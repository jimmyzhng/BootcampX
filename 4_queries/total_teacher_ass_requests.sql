SELECT name, count(assistance_requests.*)
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY name;