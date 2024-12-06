USE PD_318_DML;
GO

ALTER FUNCTION CountPassedLessons
(
	@group_name AS NVARCHAR(16),
	@discipline_name AS NVARCHAR(150)
)
RETURNS TINYINT
AS
BEGIN
	RETURN 
	(
		SELECT 
		COUNT(spent) AS N'Passed lessons'
		FROM Schedule
		WHERE [group]	 = (SELECT group_id		 FROM Groups	  WHERE group_name		= @group_name)
		AND	  discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE @discipline_name)
		AND spent = 1
	)
END
GO

ALTER FUNCTION CountPlannedLessons
(
	@group_name AS NVARCHAR(16),
	@discipline_name AS NVARCHAR(150)
)
RETURNS TINYINT
AS
BEGIN
	RETURN 
	(
		SELECT 
		COUNT(spent) AS N'Passed lessons'
		FROM Schedule
		WHERE [group]	 = (SELECT group_id		 FROM Groups	  WHERE group_name		= @group_name)
		AND	  discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE @discipline_name)
		AND spent = 0
	)
END