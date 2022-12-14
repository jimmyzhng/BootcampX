SELECT assignments.id as id, assignments.name as name,
assignments.day as day, assignments.chapter as chapter, 
count(assistance_requests) as total_req
FROM assistance_requests
JOIN assignments ON assistance_requests.assignment_id = assignments.id
GROUP BY assignments.id
ORDER BY total_req DESC;