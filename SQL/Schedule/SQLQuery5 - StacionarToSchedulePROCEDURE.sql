USE PD_318_DML;
GO

CREATE PROCEDURE sp_SetScheduleForStacionar
	@group_name			AS NVARCHAR(16),
	@discipline_name	AS NVARCHAR(150),
	@teacher_last_name  AS NVARCHAR(150),
	@start_date			AS DATE

AS 
BEGIN 

	SET DATEFIRST 1;
	
	
	DECLARE @time				AS TIME		= (SELECT learning_time FROM Groups WHERE group_name = @group_name);
	DECLARE @group				AS INT		=  (SELECT group_id FROM Groups WHERE group_name = @group_name)
	DECLARE @discipline			AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE (@discipline_name))	
	DECLARE @teacher			AS INT		= (SELECT teacher_id FROM Teachers WHERE last_name = @teacher_last_name)
	
	
	
	DECLARE @date				AS DATE	    = @start_date
	DECLARE @number_of_lessons	AS SMALLINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline)
	DECLARE @number_of_lesson	AS SMALLINT  = 1
	
	
	WHILE(@number_of_lesson < @number_of_lessons)
	BEGIN 		
		
	
	
		IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [date] = @date AND [time] = @time AND [group] = @group AND discipline = @discipline)
		BEGIN
			INSERT Schedule 	([date], [time], [group], discipline, teacher, spent)
			VALUES	    	    ( @date,  @time,  @group, @discipline, @teacher, IIF(@date < GETDATE(), 1, 0))
		END
		SET @number_of_lesson = @number_of_lesson + 1
	
	
	
		IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [date] = @date AND [time] = DATEADD(MINUTE, 90 ,@time) AND [group] = @group AND discipline = @discipline)
		BEGIN
			INSERT Schedule 	([date], [time], [group], discipline, teacher, spent)
			VALUES	    	    ( @date,  DATEADD(MINUTE, 90 ,@time),  @group, @discipline, @teacher, IIF(@date < GETDATE(), 1, 0))
		END 
		SET @number_of_lesson = @number_of_lesson + 1
	
		SET @date = DATEADD(DAY, IIF(DATEPART(DW,@date)= 1 OR DATEPART(DW,@date) = 3, 2 ,3 ), @date)
	END
END