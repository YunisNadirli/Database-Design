create database DbCarShop2

use DbCarShop2

create table Mark(
colID int primary key identity,
colName varchar(25),
)

create table Model(
colID int primary key identity,
colName varchar(25),
colVehicleCount int,
colMarkID int foreign key references Mark(colID)
)

create table Color(
colID int primary key identity,
colName varchar(25)
)

create table Motor(
colID int primary key identity,
colName varchar(25)
)

create table MotorType(
colID int primary key identity,
colName varchar(25),
)

create table Car(
colID int primary key identity,
colModel int foreign key references Model(colID),
colMotor int foreign key references Motor(colID),
colMotorType int foreign key references MotorType(colID),
colColor int foreign key references Color(colID),
colPrice float,
colDriveKM int
)

create procedure procAddMark
	@name varchar(25)
as
begin 
	if(@name is not null)
	begin 
		insert into Mark(colName)
		values (@name)
	end
	else 
	begin 
		Select 'Null value'
	end
end

create procedure procAddModel
	@name varchar(25),@count int,@mark int
as
begin 
	if(@name is not null and @count is not null and @mark is not null)
	begin 
		insert into Model(colName,colVehicleCount,colMarkID)
		values (@name,@count,@mark)
	end
	else 
	begin 
		Select 'Null value'
	end
end

create procedure procAddColor
	@name varchar(25)
as
begin 
	if(@name is not null)
	begin 
		insert into Color(colName)
		values (@name)
	end
	else 
	begin 
		Select 'Null value'
	end
end

create procedure procAddMotor
	@name varchar(25)
as
begin 
	if(@name is not null)
	begin 
		insert into Motor(colName)
		values (@name)
	end
	else 
	begin 
		Select 'Null value'
	end
end

create procedure procAddMotorType
	@name varchar(25)
as
begin 
	if(@name is not null)
	begin 
		insert into MotorType(colName)
		values (@name)
	end
	else 
	begin 
		Select 'Null value'
	end
end

create procedure procAddCar
	@model int, @motor int, @motorType int,
	@color int, @price float, @driveKM int
as
begin
	if(@model is not null and @motor is not null and @motorType is not null
	and @color is not null and @price is not null and @driveKM is not null)
	begin 
		insert into Car(colModel,colMotor,
		colMotorType,colColor,colPrice,colDriveKM)
		values(@model,@motor,@motorType,@color,@price,@driveKM)
end


create view ShowCar
as
select * from
Car t1 inner join Model t2
on t1.colModel = t2.colID
inner join Mark t3
on t2.colMarkID = t3.colID
inner join Color t4 
on t1.colColor = t4.colID
inner join Motor t5
on t1.colMotor = t5.colID
inner join MotorType t6
on t1.colMotorType = t6.colID


