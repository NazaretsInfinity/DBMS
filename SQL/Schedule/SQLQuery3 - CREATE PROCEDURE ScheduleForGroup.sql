USE PD_318_DML;
GO

ALTER PROCEDURE sp_ScheduleForGroup
		@group_name		NVARCHAR(16),
		@discipline_name NVARCHAR(150) 
AS
BEGIN
		DECLARE @group AS INT = (SELECT group_id FROM Groups WHERE group_name = @group_name);
		DECLARE @discipline AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE  @discipline_name);

		SELECT 
	[Date]				 =	[date],
	[Day of week]		 =  DATENAME(WEEKDAY, [date]),
	[Time]				 =	[time],
	[Group]				 =	group_name,
	[Discipline]         = discipline_name,
	[Teacher] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name, N'')),
	[Subject] = [subject],
	[Status] = IIF(spent = 1, N'Passed', N'Planned')
FROM Schedule, Groups, Teachers, Disciplines
WHERE [group]			 = group_id
AND	discipline			 = discipline_id
AND teacher				 = teacher_id
AND [group]				 = @group
AND [discipline]		 = @discipline
;
END
