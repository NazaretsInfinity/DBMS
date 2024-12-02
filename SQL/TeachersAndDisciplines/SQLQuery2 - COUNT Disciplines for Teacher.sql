USE PD_318_DML;

SELECT
	[Full name] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name, N'')),
	COUNT(discipline_id) AS N'Amount of disciplines'

FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE discipline = discipline_id
AND teacher = teacher_id
GROUP BY last_name, first_name, middle_name 
ORDER BY  [Amount of disciplines] DESC
;