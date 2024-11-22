

create database BookShop_test

use BookShop_test

create table tblLanguage(
colID int primary key identity,
colName varchar(25)
)

create table tblPrintingPress(
colID int primary key identity,
colName varchar(45),
colPhone char(10),
colGmail varchar(80) check(colGmail like '%@%')
)

create table tblBookCover(
colID int primary key identity,
colName varchar(25)
)

create table tblGenre(
colID int primary key identity,
colName varchar(25)
)

create table tblBook(
colID int primary key identity,
colName varchar(80) not null, 
colDescription varchar(255),
colPageNumber tinyint check (colPageNumber>0),
colPrice float check (colPrice>0),
colStock int check (colStock>0),
colYear char(4),
colBookCover int foreign key references tblBookCover(colID),
colGenre int foreign key references tblGenre(colID),
colLanguage int foreign key references tblLanguage(colID),
colPrintingPress int foreign key references tblPrintingPress(colID)
)

create table tblAuthor(
colID int primary key identity,
colName varchar(45),
colSurname varchar(55),
colBirthYear char(4),
colDeathYear char(4)
)

create table tblTranslator(
colID int primary key identity,
colName  varchar(45),
colSurname varchar(50)
)

create table tblBookAuthor(
colID int primary key identity,
colBookID int foreign key references tblBook(colID),
colAuthorID int foreign key references tblAuthor(colID)
)

create table tblBookTranslator(
colID int primary key identity,
colBookID int foreign key references tblBook(colID),
colTranslatorID int foreign key references tblTranslator(colID)
)


create procedure procAddAuthor
	@name varchar(45), @surname varchar(55),
	@birth char(4), @death char(4)
as
begin
	if(@name is not null and @surname is not null)
	begin
		insert into tblAuthor(colName,colSurname,colBirthYear,colDeathYear)
		values (@name, @surname, @birth, @death)
	end
	else 
	begin 
		select 'name or surname is null'
	end
end

create procedure procAddLanguage
	@name varchar(25)
as
begin 
	if(@name is not null)
	begin 
	insert into tblLanguage(colName)
	values (@name)
	end
	else 
	begin
		select 'Value is null'
	end
end

create procedure procAddGenre
	@name varchar(25)
as
begin 
	if(@name is not null)
	begin 
	insert into tblGenre(colName)
	values (@name)
	end
	else 
	begin
		select 'Value is null'
	end
end

create procedure procAddBookCover
	@name varchar(25)
as
begin 
	if(@name is not null)
	begin 
	insert into tblBookCover(colName)
	values (@name)
	end
	else 
	begin
		select 'Value is null'
	end
end

create procedure procAddPrintingPress
	@name varchar(25), @phone char(10),
	@gmail varchar(80)
as
begin 
	if(@name is not null)
	begin 
	insert into tblPrintingPress(colName,colPhone,colGmail)
	values (@name,@phone,@gmail)
	end
	else 
	begin
		select 'Name of printing press is null'
	end
end

create procedure procAddTranslator
	@name varchar(45), @surname varchar(50)
as
begin 
	if(@name is not null)
	begin 
	insert into tblLanguage(colName)
	values (@name)
	end
	else 
	begin
		select 'Value is null'
	end
end

create view viewBook
as
select t1.colName,t1.colDescription,t1.colPageNumber, 
t1.colPrice, t1.colStock, t1.colYear,t2.colName,
t3.colName, t4.colName, t5.colName
from tblBook t1 inner join tblGenre t2
on t1.colGenre = t2.colID
inner join tblLanguage t3 
on t3.colID = t1.colLanguage
inner join tblBookCover t4
on t1.colBookCover = t4.colID
inner join tblPrintingPress t5 
on t1.colPrintingPress = t5.colID