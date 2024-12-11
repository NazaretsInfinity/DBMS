USE PD_318_DML;
GO

SET DATEFIRST 1;
--EXEC sp_NewYearDaysFor 2024;
--EXEC sp_MayHolidaysFor 2024;
--EXEC sp_SummerHolidaysFor 2024;


PRINT(dbo.GetEasterDate(2025));
PRINT(DATENAME(WEEKDAY, dbo.GetEasterDate(2025)));


SELECT
	[date],
	DATENAME(WEEKDAY, [date]) AS N'Weekday',
	holiday_name AS N'Holiday'
	--COUNT(holiday) AS N'Amount of holidays'
FROM DaysOFF JOIN Holidays ON (holiday = holiday_id)
--WHERE holiday_name LIKE '%Summer%'
--GROUP BY holiday_name




