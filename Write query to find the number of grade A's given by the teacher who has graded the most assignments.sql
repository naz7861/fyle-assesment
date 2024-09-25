WITH TeacherAssignmentCounts AS (
    SELECT 
        teacher_id,
        COUNT(assignment_id) AS total_assignments
    FROM 
        assignments
    GROUP BY 
        teacher_id
),
MaxTeacher AS (
    SELECT 
        teacher_id
    FROM 
        TeacherAssignmentCounts
    WHERE 
        total_assignments = (SELECT MAX(total_assignments) FROM TeacherAssignmentCounts)
)
SELECT 
    COUNT(*) AS grade_a_count
FROM 
    assignments
WHERE 
    teacher_id IN (SELECT teacher_id FROM MaxTeacher)
    AND grade = 'A';
