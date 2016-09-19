create database MagazineCMS
go
use MagazineCMS
go
create table Admin_User(
	User_id   INT PRIMARY KEY identity(1,1),
    User_name nvarchar(20),
	uPassword nvarchar(60),
	gender    CHAR CONSTRAINT user_check CHECK (gender IN ('F','M')),
    DOB       nvarchar(10),
    Role_id   nvarchar(50),
    address   nvarchar(100),
    phone     nvarchar(20),
    mail      nvarchar(100)
);
go
create table faculty(
	faculty_id   nvarchar(20) PRIMARY KEY,
    faculty_name nvarchar(100),
	Student_Number int,
    MC_id     INT ,
    Years   nvarchar(30),
	FOREIGN KEY (MC_id) REFERENCES Admin_User(User_id)
);
go
create table students(
	studentid  INT PRIMARY KEY identity(1,1),
	User_name nvarchar(20),
	uPassword nvarchar(60),
	gender    CHAR CONSTRAINT student_gender CHECK (gender IN ('F','M')),
    DOB       nvarchar(10),
	faculty_id  nvarchar(20),
	FOREIGN KEY (faculty_id ) REFERENCES faculty(faculty_id)
);
go
create table contributions(
	con_id INT PRIMARY KEY identity(1,1),
	studentid  INT,
	submitted_at datetime,
	updated_at datetime,
	ispublice  CHAR CONSTRAINT check_publice CHECK (ispublice IN ('Y','N')),
	FOREIGN KEY (studentid) REFERENCES students(studentid)
);
go
create table contributions_file(
	file_id int primary key identity,
	con_id INT,
	file_path nvarchar(max),
	file_size int,
	create_at datetime,
	FOREIGN KEY (con_id) REFERENCES contributions(con_id)
);

