CREATE DATABASE AcademySQL
ON --Define properties of file of database
(
    NAME = AcademySQL,
    FILENAME = 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AcademySQL.mdf',
    SIZE       = 8 MB, 
    MAXSIZE    = 500 MB,
    FILEGROWTH = 8 MB
)
LOG ON -- properties of transaction log file
(
     NAME = AcademySQL_LOG,
	 FILENAME = 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AcademySQL_LOG.mdf',
	 SIZE = 8 MB,
	 MAXSIZE = 500 MB,
	 FILEGROWTH = 8 MB
)