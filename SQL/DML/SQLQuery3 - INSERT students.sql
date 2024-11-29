USE AcademySQL;

INSERT Students
				(last_name, first_name, middle_name, birth_date, [group])
VALUES
				(N'Chumachenko',N'Pavel',    N'Eugenievich',     '2002-09-15', 5),
				(N'Juravlyova', N'Natahlia', N'Alekseevna',      '1978-12-30', 5),
				(N'Sokolov',    N'Sergei',   N'Alexandrovich',   '2000-01-02', 5),
				(N'Egorov',     N'Eugene',   N'Alexandrovich',   '1986-02-06', 4),
				(N'Sivkov',     N'Nikita',   N'Sergeevich',      '1995-01-05', 3)
				
SELECT * FROM Students
