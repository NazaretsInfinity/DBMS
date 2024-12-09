USE PD_318_DML;
GO

EXEC sp_SetDaysOff 2024;

SELECT
	[date],
	DATENAME(WEEKDAY, [date]) AS N'Weekday',
	holiday_name AS N'Holiday'
	
FROM DaysOFF JOIN Holidays ON (holiday = holiday_id)


