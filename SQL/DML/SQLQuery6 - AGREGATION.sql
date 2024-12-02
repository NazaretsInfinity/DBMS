USE AcademySQL;

SELECT 
      --COUNT(direction_name)
	  --group_name	AS N'Group',
	  direction_name AS N'Direction',
	  COUNT(DISTINCT group_id) AS N'Amount of groups',
	  COUNT(student_id)  AS N'Amount of students'
FROM		Groups, Directions, Students

WHERE		direction = direction_id
AND			[group] = group_id
GROUP BY	direction_name 
;