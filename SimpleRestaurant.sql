use Restaurant

create table TableNumbers(
TableId int primary key identity,
TableNumber int not null,
IsEmpty bit default(1)
)

create table Customers(
CustomerId int primary key identity,
CustomerName varchar(25) not null,
CustomerSurname varchar(35) not null,
CustomerPhone char(10),
TableNumber int foreign key references TableNumbers(TableId),
OrderTime DateTime
)



create procedure GetAllTableNumbers
as
begin  
	Select * from TableNumbers
end



create procedure CheckTable 
	@number int 
as 
begin
	Select IsEmpty from TableNumbers 
	where TableNumber = @number
end



create procedure AddReservation 
	@name varchar(25), @surname varchar(35),
	@phone char(10), @tableNumber int,
	@time datetime
as
begin 
	if(@name != null and @surname != null and @phone != null and @tableNumber != null and @time != null)
	begin 
		insert into Customers(CustomerName,CustomerSurname,CustomerPhone,TableNumber,OrderTime)
		values (@name,@surname,@phone,@tableNumber,@time)
	end 
end 


create procedure AddTableNumber
	@number int
as 
begin 
	if(@number != null)
	begin
		insert into TableNumbers(TableNumber)
		values(@number)
	end
end

create procedure DeleteTableNumber
	@number int
as 
begin 
	if(@number != null)
	begin
		delete TableNumbers
		where TableNumber
	end
end




