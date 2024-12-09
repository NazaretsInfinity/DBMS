USE PD_318_DML;
GO

EXEC	 sp_SetScheduleForStacionar N'PV_318', N'%ADO.NET%', N'Ковтун', '2023-12-02';

--DELETE FROM Schedule
-- WHERE [group] = (SELECT group_id FROM Groups WHERE group_name = N'PV_318')
-- AND discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'%ADO.NET')

EXEC	 sp_ScheduleForGroup 'PV_318', '%ADO.NET%'

