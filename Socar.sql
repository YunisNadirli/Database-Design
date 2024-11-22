create database OilCompanyDB;

use OilCompanyDB;

create table Filial(
FilialID int primary key identity,
FilialName varchar(40),
FilialAdress varchar(80),
BarelCapacity int
); 


create table Sobe(
SobeID int primary key identity,
Sobe varchar(80)
)

create table Pese(
PeseID int primary key identity,
Pese varchar(80),
SobeID int foreign key references Sobe(SobeID)
);



create table Isci(
IsciID int primary key identity,
IsciName varchar(45),
IsciSurname varchar(45),
IsciFatherName varchar(45),
IsciMaas float,
IsciPhone char(10),
IsciGmail varchar(80),
IsciBirthday datetime,
IsciStartTime datetime,
PeseID int foreign key references Pese(PeseID)
);
