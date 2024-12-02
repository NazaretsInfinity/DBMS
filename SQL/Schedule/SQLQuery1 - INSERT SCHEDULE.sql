USE AcademySQL_FULL
GO



DECLARE @start_date			AS DATE	    = '2024-10-25'

DECLARE @time				AS TIME		= '18:30:00'
DECLARE @group				AS INT		=  (SELECT group_id FROM Groups WHERE group_name = 'PV_318')
DECLARE @discipline			AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE ('%MS SQL Server%'))

DECLARE @teacher			AS INT		= (SELECT teacher_id FROM Teachers WHERE first_name = N'Юыху')



DECLARE @date				AS DATE	    = @start_date
DECLARE @number_of_lessons	AS SMALLINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline)
DECLARE @number_of_lesson	AS SMALLINT  = 0

--PRINT(@teacher)
--PRINT(@group)
--PRINT(@discipline)
--PRINT(@number_of_lessons)

WHILE(@number_of_lesson < @number_of_lessons)
BEGIN 		
	INSERT Schedule 	([date], [time], [group], discipline, teacher, spent)
	VALUES	    	    ( @date,  @time,  @group, @discipline, @teacher, IIF(@date < GETDATE(), 1, 0))

	--PRINT(FORMATMESSAGE(N'%i, %s' , @number_of_lesson, DATENAME(dw, @date)))
	--PRINT(@date)

IF(@number_of_lesson%2 != 0)
		--IF(DATENAME(dw, @date) = 'Friday')
		IF(DATEPART(dw, @date) = 6)
			SET @date = DATEADD(dd, 3, @date)

		ELSE
			SET @date = DATEADD(dd, 2, @date)

SET @number_of_lesson = @number_of_lesson + 1
END

--SELECT * FROM Schedule