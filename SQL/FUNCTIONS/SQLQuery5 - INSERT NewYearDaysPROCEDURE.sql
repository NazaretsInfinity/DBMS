USE PD_318_DML;
GO

ALTER PROCEDURE sp_NewYearDaysFor
	@year AS INT
AS 
BEGIN
	DECLARE @start_date		AS DATE		 = dbo.GetLastMonthOfYear(@year - 1);
	DECLARE @date		AS DATE		 = @start_date
	DECLARE @holiday		AS SMALLINT  = (SELECT holiday_id FROM holidays WHERE holiday_name = N'Holidays');
	WHILE (DATEDIFF(DAY,@start_date, @date) <= 14)
	BEGIN
		IF NOT EXISTS (SELECT day_off_id FROM DaysOFF WHERE [date] = @date)
		BEGIN
			INSERT DaysOFF ([date], holiday)
			VALUES		   (@date,  @holiday)
		END
		SET @date = DATEADD(DAY, 1, @date)
	END
END
