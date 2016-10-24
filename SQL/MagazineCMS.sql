create database MagazineCMS
go
use MagazineCMS
go
create table Roles(
	roleID int primary key identity(1,1),
	roleName nvarchar(255) not null
)
go
create table Users(
	userID int primary key identity(1,1),
	userName nvarchar(255) not null, 
	userPass nvarchar(255) not null,
	gender CHAR CONSTRAINT user_check CHECK (gender IN ('F','M')), /* kiem tra gioi tinh */
	dob date not null,
	email nvarchar(255) not null,
	address nvarchar(255),
	phone nvarchar(255),
	roleID int,
	foreign key (roleID) references Roles(roleID) /* user phai co 1 trong so cac role co san cua bang Roles */
)
go
create table Overall_process (
	op_ID int primary key identity(1,1),
	op_year date not null, /* nam hoc */
	mm_ID int not null,
	foreign key (mm_ID) references Users(userID), /* MM phai la 1 user */
	op_startDate datetime not null,
	op_endDate datetime not null /* han chot, sau ngay nay se ko the edit duoc article nua */
)
go
create table Faculties(
	facultyID int primary key identity(1,1),
	facultyName nvarchar(255) not null,
	academicYear datetime not null, /* nam hoc */
	mc_ID int not null,
	foreign key (mc_ID) references Users(userID), /* MM phai la 1 user */
	op_ID int not null,
	foreign key (op_ID) references Overall_process(op_ID), /* Faculty nay phai nam trong 1 Overall process (1 nam hoc nao do) */
	fa_startDate datetime not null,
	fa_endDate datetime not null /* han chot nhan article, sau ngay nay se ko the submit duoc article nua */
)
go
drop table Articles
drop table comment
create table Articles(
	articleID int primary key identity(1,1),
	articleTitle nvarchar(255) not null,
	articleContent text not null,
	articlePicture nvarchar(max),
	articleAuthor int,	foreign key (articleAuthor) references Users(userID), /* author phai la 1 user */
	articleFaculty int,
	foreign key (articleFaculty) references Faculties(facultyID), /* article phai thuoc ve 1 faculty nao do */
	articleStatus VARCHAR(30), /* check trang thai, chi co the la Submitted hoac Approved */
	submitted_at datetime,
	updated_at datetime,	
)
go
create table comment(
	comment_id int primary key identity,
	articleID int,
	foreign key (articleID) references Articles(articleID),
	commentContent nvarchar(255),
	commentAuthor int,
	foreign key (commentAuthor) references Users(userID) /* nguoi viet comment phai la 1 user */
)




insert into Roles values('Administrator');/* id =1 */
insert into Roles values('Student');/* id =2 */
insert into Roles values('Marketing Coordinator');/* id =3 */
insert into Roles values('Marketing Manager');/* id =4 */
insert into Roles values('Guest');

select*from Users

insert into Users values('test','123456','M', GETDATE(),'chiasd94@gmail.com',null,null,1);
insert into Users values('test1','123456','M', GETDATE(),'chiasd94@gmail.com',null,null,3);
insert into Users values('test2','123456','M', GETDATE(),'chiasd94@gmail.com',null,null,4);
insert into Users values('test3','123456','M', GETDATE(),'chiasd94@gmail.com',null,null,4);
insert into Users values('test4','123456','M', GETDATE(),'chiasd94@gmail.com',null,null,2);
insert into Users values('test5','123456','M', GETDATE(),'chiasd94@gmail.com',null,null,2);
insert into Users values('test6','123456','M', GETDATE(),'chiasd94@gmail.com',null,null,2);
insert into Users values('test7','123456','M', GETDATE(),'chiasd94@gmail.com',null,null,2);
insert into Users values('test9','21232f297a57a5a743894a0e4a801fc3','M', GETDATE(),'chiasd94@gmail.com',null,null,5);
insert into Users values('test10','21232f297a57a5a743894a0e4a801fc3','M', GETDATE(),'chiasd94@gmail.com',null,null,1);
insert into Users values('test11','21232f297a57a5a743894a0e4a801fc3','M', GETDATE(),'chiasd94@gmail.com',null,null,2);

update Users set userPass='21232f297a57a5a743894a0e4a801fc3' where userPass='123456';

insert into Overall_process values(GETDATE(),3,GETDATE(),'2016-11-11');



select*from Faculties
insert into Faculties values('faculty1',GETDATE(),2,1,GETDATE(),'2016-11-01');
insert into Faculties values('faculty2',GETDATE(),2,1,GETDATE(),'2016-11-01');


drop procedure usp_getAllUser
go
create procedure usp_getAllUser
as
begin
	select*from  Users
end

exec usp_getAllUser

select*from Articles


select * from Articles where articleID = 1
