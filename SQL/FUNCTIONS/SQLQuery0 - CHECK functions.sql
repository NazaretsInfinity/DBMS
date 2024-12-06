USE PD_318_DML;
GO

PRINT(dbo.CountLessonsForGroups(N'PV_318', N'%ADO.NET%'));
PRINT(dbo.CountPassedLessons(N'PV_318', N'%ADO.NET%'));
PRINT(dbo.CountPlannedLessons(N'PV_318', N'%ADO.NET%'));