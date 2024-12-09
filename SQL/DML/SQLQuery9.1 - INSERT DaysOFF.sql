USE PD_318_DML;
GO

SET DATEFIRST 1;
--EXEC sp_NewYearDaysFor 2024;
--EXEC sp_MayHolidaysFor 2024;
--EXEC sp_SummerHolidaysFor 2024;


--DELETE FROM DaysOFF
--WHERE holiday = (SELECT holiday_id FROM Holidays WHERE holiday_name = N'Holidays')

SELECT
	--[date],
	--DATENAME(WEEKDAY, [date]) AS N'Weekday',
	holiday_name AS N'Holiday',
	COUNT(holiday) AS N'Amount of holidays'
FROM DaysOFF JOIN Holidays ON (holiday = holiday_id)
WHERE holiday_name LIKE '%Summer%'
GROUP BY holiday_name




