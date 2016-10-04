use MagazineCMS
go

select * from dbo.Users

drop procedure usp_Login
go
create procedure usp_Login
	@user_name varchar(50),
	@uPassword varchar(50)
as
Begin
	select userPass, userName, roleID from Users where userName = @user_name and userPass = @uPassword;
end
go

drop procedure usp_addUsers
go
create procedure usp_addUsers
@u_name nvarchar(255) ,
@u_pass nvarchar(255) ,
@gender  nvarchar(255) ,
@dob date ,
@email nvarchar(255),
@address nvarchar(255),
@phone nvarchar (255) 
as 
begin 
	insert into Users(userName,userPass,gender,dob,email,address,phone) values (@u_name,@u_pass,@gender,@dob,@email,@address,@phone);
end
go

drop procedure usp_addFaculties
go
create procedure usp_addFaculties
@facultyName nvarchar(255),
@academicYear datetime,
@mc_Id int,
@op_id int,
@fa_startDate datetime,
@fa_endDate datetime
as
begin
 insert into Faculties values(@facultyName,@academicYear,@mc_Id,@op_id,@fa_startDate,@fa_endDate);
 end 
 go



