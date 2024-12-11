USE PD_318_DML;
GO

ALTER FUNCTION GetEasterDate
(
	@year AS INT
)
RETURNS DATE
AS
BEGIN 

	DECLARE @a AS INT = @year%19;
	DECLARE @b AS INT = @year%4;
	DECLARE @c AS INT = @year%7;

	DECLARE @k AS INT = @year/100;
	DECLARE @p AS INT = (13+8*@k)/25;
	DECLARE @q AS INT = @k/4;
	DECLARE @m AS INT = 15;
	DECLARE @n AS INT = 6;
	DECLARE @d AS INT = (19*@a + @m) % 30;
	DECLARE @e AS INT = (2*@b + 4*@c + 6*@d + @n)%7;
	DECLARE @f AS INT = @d+ @e;

	RETURN IIF(@f>26, DATEFROMPARTS(@year,05,@f-26), DATEFROMPARTS(@year, 04,4+@f));
END