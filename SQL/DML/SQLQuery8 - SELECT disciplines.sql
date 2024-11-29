USE AcademySQL
SELECT 

	 discipline_name	AS N'Disciplines',
     [Teachers] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name, N''))
FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE 
--discipline = 1 -- Ane ID ya need.
discipline_name LIKE  N'%OOP C++%'
AND discipline_id = discipline
AND teacher_id = teacher