USE PD_318_DML;
GO

SET DATEFIRST 1;
--EXEC sp_NewYearDaysFor 2024;
--EXEC sp_MayHolidaysFor 2024;
SELECT
	[date],
	DATENAME(WEEKDAY, [date]),
	holiday_name
FROM DaysOFF JOIN Holidays ON (holiday = holiday_id)
WHERE holiday = 6
