USE MASTER
IF EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'Gorm' )
DROP DATABASE Gorm
GO



CREATE DATABASE Gorm; 
GO 
USE Gorm

create table Person
(navn nvarchar (25),
vejnavn nvarchar (25),
postnr int,
bynavn nvarchar (25),
id int primary key identity (1,1),
tlf nvarchar (25),
kategori int,
)
go 


create table Vare
(vareid int,
nummer int ,
varenavn nvarchar (25),
hoejde int,
vaegt int,
pris int,
dato int,
datotil int,
)
go 


create table Ordre
(ordreid int,
dato nvarchar (25),
tid int,
antal int,
totalpris int,
betalingsfrist nvarchar (25),
rabatruppe int,
vareid int,
)
go

insert into Person values 
('Bo', 'kirkevej', 4000,'Roskilde', '30405060', 3),
('ib', 'kirkevej', 4000, 'Roskilde', '20222234', 2),
('Karin','kirkevej',4000 , 'Roskilde','20222334' ,3 ),
('Karin', 'lærkevej',3000 , 'Ølstykke', '50501212' ,2 ),
('Tulle', 'lærkevej',3000 , 'Ølstykke','50501213' ,1 ),
('Bodil', 'fuglevej',2200 , 'Frederiksberg','50501214' ,2 )

insert into Vare values

(1,2020, 'Banan', 12, 100, 10, 101082, 101182),
(2,1010,'Æble',4,100,10,101082,101182),
(3,1030,'Letmælk',20,1000,7,121287,181287),
(4,1030,'Sødmælk',20,800,8,121206,181206),
(5,1030,'ø.letmælk',20,1000,9,121206,181206),
(6,1030,'ø.sødmæk',20,1000,10,101105,161105),
(7,1010,'Skummemælk',20,1000,6,101105,161105)

insert into Ordre values
(1,'14-02-05', 12,4,48,'20-12-2006',3,1),
(2,'14-02-05',12,5,60,'21-12-2006',3,1),
(3,'14-12-05',12,2,14,'22-12-2006',3,3),
(4,'14-02-05',12,3,24,'23-12-2006',3,4),
(5,'15-09-06',12,77,693,'24-12-2006',4,5)
--opgave 6
select * from Person where bynavn = 'Roskilde'
--opgave 7
select  navn from Person where kategori = 1
--opgave 8
select navn, bynavn from Person where kategori = 2 
--opgave 9
select * from ordre where vareid = 1
-- opgave 10
select * from Ordre, vare where ordre.vareid = 1 and Vare.vareid = 1
--opgave 11
select ordre.* FROM Ordre
INNER JOIN Vare ON Ordre.vareid = Vare.vareid where Ordre.vareid != 1

--opgave 12
select ordre.* FROM Ordre
INNER JOIN Vare ON Ordre.vareid = Vare.vareid where Ordre.vareid != 1 AND ordre.vareid < 5 AND Vare.vaegt > 900
--opgave 13
alter table Ordre
ADD PId int
Truncate Table Ordre
go
insert into Ordre values
(1,'14-02-05', 12,4,48,'20-12-2006',3,1,5),
(2,'14-02-05',12,5,60,'21-12-2006',3,1,5),
(3,'14-12-05',12,2,14,'22-12-2006',3,3,1),
(4,'14-02-05',12,3,24,'23-12-2006',3,4,3),
(5,'15-09-06',12,77,693,'24-12-2006',4,5,6)

select * from Ordre where Ordre.PId = 1

select ordre.* from Ordre, Person where Ordre.PId = Person.id
