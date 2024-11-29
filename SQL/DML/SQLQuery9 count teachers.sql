USE AcademySQL

SELECT
	discipline_name	AS N'Disciplines',
	COUNT(teacher_id) AS N'Amount of teachers'

FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE teacher_id = teacher
AND discipline_id = discipline
GROUP BY	discipline_name 

--SELECT
--	[Teachers] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name, N'')),
--	COUNT(discipline_id)		AS N'Amount of Disciplines'
--
--FROM Teachers, Disciplines, TeachersDisciplinesRelation
--WHERE teacher = teacher_id
--AND discipline = discipline_id
--GROUP BY last_name, first_name, middle_name
