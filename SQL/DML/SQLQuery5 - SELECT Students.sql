USE PD_318_DML;

SELECT 
   -- last_name + ' ' +first_name + ' ' + middle_name AS N'FULL NAME',
      [FULL NAME] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name, N'')),
	--  birth_date						AS N'Date of birth',
	  [Age]								= DATEDIFF(DAY, birth_date, GETDATE()) / 365,
	  [group_name]                      AS N'Group',
	  direction_name                    AS N'Direction'
FROM  Students, Groups, Directions
WHERE Students.[group] = Groups.group_id
AND	  Groups.direction = Directions.direction_id
--AND direction_name LIKE N'%Graphic%'
--AND group_name = N'PD_321'
--AND direction_name = N'Graphic Design'
--ORDER BY birth_date ASC;
ORDER BY group_name


