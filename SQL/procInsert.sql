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

----HANV -----
---1. Add/update/delete/setAssignMM/AssignMC


drop procedure usp_deleteUsers
go
create procedure usp_deleteUsers
@userName nvarchar(255)
as
begin
delete dbo.Users from dbo.Users where @userName =userName;
end
go

drop procedure usp_editUsers
go
create procedure usp_editUsers
@u_name nvarchar(255),
@u_pass nvarchar(255),
@gender nvarchar(255),
@dob date,
@email nvarchar(255),
@address nvarchar (255),
@phone nvarchar(255),
@roleID int
as 
begin
update dbo.Users
set 
userPass =ISNULL(@u_pass,userPass),
gender = ISNULL(@gender,gender),
dob = ISNULL(@dob,dob),
email = ISNULL(@email,email),
address = ISNULL(@address,address),
phone = ISNULL(@phone,phone),
@roleID = ISNULL(@roleID,@roleID)
from dbo.Users
where userName= @u_name
end 
go

----End 1.-----


drop procedure usp_addUsers
go
create procedure usp_addUsers
@u_name nvarchar(255) ,
@u_pass nvarchar(255) ,
@gender  nvarchar(255) ,
@dob date ,
@email nvarchar(255),
@address nvarchar(255),
@phone nvarchar (255),
@roleID int
as 
begin 
	insert into Users(userName,userPass,gender,dob,email,address,phone,roleID) values (@u_name,@u_pass,@gender,@dob,@email,@address,@phone,@roleID);
end
go


drop procedure usp_addOverall_process
go
create procedure usp_addOverall_process
	@op_year date ,
	@mm_ID int,	
	@op_startDate datetime,
	@op_endDate datetime
as
begin
 insert into Overall_process values(@op_year,@mm_ID,@op_startDate,@op_endDate);
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
go
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

drop procedure usp_getAllOverall_process
go
create procedure usp_getAllOverall_process
as
begin
select * from Overall_process,Users where Users.userID=Overall_process.mm_ID
end



drop procedure usp_getOverall_process
go
create procedure usp_getOverall_process
@mm_ID int
as
begin
select*from Overall_process where mm_ID=@mm_ID
end

drop procedure usp_getFaculties_by_ID
go
create procedure usp_getFaculties_by_ID
@mc_ID int
as
begin
select*from Faculties where mc_ID=@mc_ID
end


drop procedure usp_getFaculties_by_oID
go
create procedure usp_getFaculties_by_oID
@op_ID int
as
begin
select*from Faculties where op_ID=@op_ID
end


drop procedure usp_getArticles_by_Fa1
go
create procedure usp_getArticles_by_Fa1
@articleFaculty int
as
begin
select*from Articles where articleFaculty=@articleFaculty and articleStatus='Approved'
end
go


drop procedure usp_getArticles_by_Fa
go
create procedure usp_getArticles_by_Fa
@articleFaculty int
as
begin
select*from Articles where articleFaculty=@articleFaculty
end
go


drop procedure usp_updateStatus
go
create procedure usp_updateStatus
@articleID int,
@articleStatus VARCHAR(30)
as
begin
update Articles set articleStatus=@articleStatus where articleID=@articleID
end
go

drop procedure usp_addcomment
go
create procedure usp_addcomment
@articleID int,
@commentContent nvarchar(255),
@commentAuthor int
as
begin
insert into comment values(@articleID,@commentContent,@commentAuthor);
end
go


drop procedure usp_showcommet
go
create procedure usp_showcommet
@articleID int
as
begin
select*from comment,Users where articleID=@articleID and comment.commentAuthor=Users.userID;
end
go


