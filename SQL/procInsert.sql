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
	select * from Users where userName = @user_name and userPass = @uPassword;
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

drop procedure usp_addArticles
go
create procedure usp_addArticles
@articleTitle nvarchar(255),
@articleContent text,
@articlePicture nvarchar(max),
@articleAuthor int,
@articleFaculty int,
@articleStatus VARCHAR,
@submitted_at datetime,
@updated_at datetime
as
begin
insert into Articles values(@articleTitle,@articleContent,@articlePicture,@articleAuthor,@articleFaculty,@articleStatus,@submitted_at,@updated_at);
end
go

drop procedure usp_getArticles
go
create procedure usp_getArticles
@articleAuthor int
as
begin
select*from Articles where articleAuthor=@articleAuthor
end
go

drop procedure usp_getFaculties
go
create procedure usp_getFaculties
as
begin
select*from Faculties
end
go
exec usp_getFaculties

drop procedure usp_updateArticles
go
create procedure usp_updateArticles
@articleID int,
@articleTitle nvarchar(255),
@articleContent nvarchar(255),
@articlePicture nvarchar(max),
@updated_at datetime
as
begin
update Articles set articleTitle=@articleTitle,articleContent=@articleContent,articlePicture=@articlePicture,
updated_at=@updated_at where articleID=@articleID
end
go

