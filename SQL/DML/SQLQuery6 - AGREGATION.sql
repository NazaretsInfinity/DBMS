USE AcademySQl;

SELECT 
      --COUNT(direction_name)
	  --group_name	AS N'Group',
	  direction_name AS N'Direction',
	  COUNT(group_id) AS N'Amount of groups',
	  COUNT(student_id)  AS N'Amount of students'
FROM		Groups, Directions, Students

WHERE		Groups.direction = Directions.direction_id
GROUP BY	direction_name 
;