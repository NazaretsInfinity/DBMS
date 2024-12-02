USE AcademySQL

SELECT
	discipline_name	AS N'Disciplines',
	COUNT(teacher_id) AS N'Amount of teachers'

FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE teacher_id = teacher
AND discipline_id = discipline
GROUP BY	discipline_name 

