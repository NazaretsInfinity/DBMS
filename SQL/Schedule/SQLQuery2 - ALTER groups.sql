USE PD_318_DML;
GO

--ALTER TABLE Groups 
--DROP COLUMN learning_form

INSERT Groups
			(group_name,  start_date, learning_time, direction)
VALUES		(N'PV_318', '2023-11-06', '18:30', 1)