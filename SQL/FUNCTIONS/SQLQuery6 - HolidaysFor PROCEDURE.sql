USE PD_318_DML;
GO

--CREATE PROCEDURE sp_HolidaysFor @year AS INT
--
--AS 
--BEGIN
	DECLARE @holiday_id AS TINYINT = (SELECT TOP 1 holiday_id FROM Holidays)
	WHILE(@holiday_id != 0)
		BEGIN


		SET @holiday_id = (SELECT TOP 1 LEAD(holiday_id, @holiday_id, 0) OVER(ORDER BY holiday_id) FROM Holidays)
		END
--END


