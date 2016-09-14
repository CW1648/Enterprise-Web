use MagazineCMS
go

drop procedure addStudent
go
CREATE  PROCEDURE addStudent
@User_name nvarchar(20),
@uPassword nvarchar(60),
@DOB nvarchar(10)
AS
BEGIN
   insert into students(User_name,uPassword,DOB) values(@User_name,@uPassword,@DOB);
END;
go

create procedure selectStudent
as 
begin
select * from students;
end
go
exec selectStudent


--insert Admin Data
insert into Admin_User values('admin001','12345','F','1/1/94','1','hanoi','09999999','mra@mail.com')
insert into Admin_User values('admin001','12345','F','1/1/94','1','hanoi','09999999','mra@mail.com')


--insert faculty Data
insert into faculty values('fc001','Chemistry',100,1,'2016')
insert into faculty values('fc002','Math',50,1,'2012')
insert into faculty values('fc003','Science',70,1,'2013')

--insert students
insert into students values('stud001','12345','F','1/1/2012','fc001');
insert into students values('stud002','12345','M','21/12/2014','fc002');
insert into students values('stud003','12345','F','4/1/2013','fc003');





