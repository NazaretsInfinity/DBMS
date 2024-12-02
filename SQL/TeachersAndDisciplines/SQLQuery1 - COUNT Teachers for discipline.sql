USE PD_318_DML

SELECT 
	[Discipline] = discipline_name,
	[Amount of teachers] = COUNT(teacher_id)

FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE teacher		= teacher_id
AND discipline		= discipline_id

GROUP BY discipline_name
ORDER BY [Amount of teachers] DESC
;