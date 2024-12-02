USE PD_318_DML;
GO

SELECT 
	[Date] =	[date],
	[Time] =	[time],
	[Group] =	group_name,
	[Discipline] = discipline_name,
	[Teacher] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name, N'')),
	[Subject] = [subject],
	[Status] = IIF(spent = 1, N'Passed', N'Planned')
FROM Schedule, Groups, Teachers, Disciplines
WHERE [group] = group_id
AND		discipline = discipline_id
AND		teacher = teacher_id