USE AcademySQL;

SELECT 

     [Teachers] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name, N'')),
	 discipline_name	AS N'Disciplines'
FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE 
teacher = 3 -- any ID ya need
AND teacher_id = teacher
AND discipline_id = discipline