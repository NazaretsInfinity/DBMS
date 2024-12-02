USE PD_318_DML

SELECT 
	[FULL NAME] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name, N'')),
	[Discipline] = discipline_name

FROM Teachers,Disciplines, TeachersDisciplinesRelation

WHERE TeachersDisciplinesRelation.discipline = discipline_id
AND teacher = teacher_id
AND discipline_name LIKE N'%HTML%'
--AND last_name LIKE N'%Глазунов'
;