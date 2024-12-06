USE PD_318_DML;
GO

EXEC	 sp_SetScheduleForStacionar N'PV_318', N'%ADO.NET%', N'Ковтун', '2024-12-02';
EXEC	 sp_ScheduleForGroup 'PV_318', '%MS SQL Server%'