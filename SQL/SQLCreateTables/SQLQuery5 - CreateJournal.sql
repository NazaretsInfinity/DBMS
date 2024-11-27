USE AcademySQL;
GO 
CREATE TABLE Schedule
(
lesson_id  BIGINT        PRIMARY	KEY IDENTITY(1,1), 
[date]	   DATE			 NOT NULL,
[time]	   TIME			 NOT NULL, 
[group]	   INT			 NOT NULL CONSTRAINT FK_Schedule_Groups FOREIGN KEY REFERENCES Groups(group_id),
						 
discipline SMALLINT      NOT NULL CONSTRAINT FK_Schedule_Disciplines FOREIGN KEY REFERENCES Disciplines(discipline_id),
						 
teacher    INT			 NOT NULL CONSTRAINT FK_Teacher_Disciplines FOREIGN KEY REFERENCES Teachers(teacher_id),

[subject]  NVARCHAR(256) NULL,
spent      BIT           NOT NULL
);

CREATE TABLE AttendanceAndGrades
(
 student	INT			 CONSTRAINT FK_Grades_Students FOREIGN KEY REFERENCES Students(student_id),
 lesson		BIGINT		 CONSTRAINT FK_Grades_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id),
 PRIMARY KEY(student,lesson),
 present	BIT		NOT NULL,
 grade_1	TINYINT NULL	CONSTRAINT CK_Grade_1 CHECK(grade_1 > 0 AND grade_1 <=12),
 grade_2	TINYINT NULL	CONSTRAINT CK_Grade_2 CHECK(grade_2 > 0 AND grade_2 <=12)
);

CREATE TABLE Exams
(
student		INT			CONSTRAINT FK_Exams_Student FOREIGN KEY REFERENCES Students(student_id),
lesson		BIGINT		CONSTRAINT FK_Exams_Lesson FOREIGN KEY REFERENCES Schedule(lesson_id),
PRIMARY KEY(student,lesson),
grade		TINYINT		CONSTRAINT CK_Exam_Grade CHECK(grade > 0 AND grade <= 12)
);
CREATE TABLE AssignedHomeworks
(
homework_id	 BIGINT PRIMARY KEY IDENTITY(1,1),
lesson		 BIGINT NOT NULL CONSTRAINT FK_AHW_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id),
task		 NVARCHAR(MAX) NOT NULL,
deadline	 DATE NOT NULL 
CONSTRAINT CK_Deadline CHECK(DATEDIFF(DAY, CONVERT(DATE, GETDATE()), deadline) >=3 AND DATEDIFF(DAY, CONVERT(DATE,GETDATE()),deadline) < 32) 
);

CREATE TABLE CompletedHomeworks
(
student		INT		CONSTRAINT FK_CHW_Students FOREIGN KEY REFERENCES Students(student_id),
homework	BIGINT	CONSTRAINT FK_CHW_Homework FOREIGN KEY REFERENCES AssignedHomeworks(homework_id),
PRIMARY KEY(student, homework),
report		NVARCHAR(MAX) NOT NULL, 
grade		TINYINT NOT NULL CONSTRAINT CK_HW_Grade CHECK(grade > 0 AND grade <= 12), 
report_date DATE NOT NULL 
);