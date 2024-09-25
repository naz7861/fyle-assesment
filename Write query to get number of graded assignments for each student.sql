SELECT 
    student_id,
    COUNT(assignment_id) AS graded_assignments_count
FROM 
    assignments
GROUP BY 
    student_id;
