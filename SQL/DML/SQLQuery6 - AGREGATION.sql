USE PD_318_DML;

SELECT 
      --COUNT(direction_name)
	  --group_name	AS N'Group',
	  direction_name AS N'Direction',
	  COUNT(group_id) AS N'Amount of groups'
	  --COUNT(student_id)  AS N'Amount of students'
FROM		Groups, Directions
WHERE		direction = direction_id
GROUP BY	direction_name 
HAVING  COUNT(group_id) <  3
;