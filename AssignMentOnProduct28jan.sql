use WFA3DotNet

--1.Creation of Table Product
create table Product
(
ProductID int IDENTITY(1,1) PRIMARY KEY,
Description varchar(30) NOT NULL,
SetQty int NOT NULL DEFAULT 1,
Rate DECIMAL(10,2),
CONSTRAINT CHK_Product CHECK ((Rate>=18 AND Rate<=5000) AND (SetQty=1 OR SetQty=5 OR SetQty=10))
)


--2.Inserting the values
insert into Product values('Dell',1,3000.9)
insert into Product values('HP',5,300.9)
insert into Product values('Razer',1,2000.9)
insert into Product values('Microsoft',1,3000.9)
insert into Product values('Msi',5,3000.9)
insert into Product values('Asus',10,1000.9)
insert into Product values('Acer',1,2000.9)
insert into Product values('Lenova',1,3000.9)
insert into Product values('Hp',5,2000.9)
insert into Product values('Dell',1,3000.9)
insert into Product values('Microsoft',10,1000.9)
insert into Product values('Apple',1,3000.9)
insert into Product values('Mac Book',1,1000.9)
insert into Product values('Acer',1,3000.9)
insert into Product values('HP',1,1000.9)
insert into Product values('Microsoft',1,3000.9)
insert into Product values('Acer',1,1000.9)
insert into Product values('Msi',1,100.9)
insert into Product values('Dell',1,2000.9)
insert into Product values('Hp',1,300.45)

select * from Product

drop table product

--3.Update all the rates with 10% rate hike.
update Product SET Rate=Rate *0.1 from Product  --problem


--4.Delete last record by providing the ProductID.
delete from Product where ProductID=(select ProductID from Product ORDER BY ProductID DESC )  --problem


--5.Alter the above table and add the following column.
alter table Product ADD MarginCode char(1) CHECK(MarginCode='A' OR MarginCode='B' OR MarginCode=null)


--6.Update few records to set MarginCode to A and some records MarginCode to B
update Product SET MarginCode ='A' where setQty=5


--6.Update few records to set MarginCode to A and some records MarginCode to B
update Product SET MarginCode ='B' where setQty=10


--7.Update all the SetQty to 10 for all Items which have MarginCode A and whose original SetQty is 1.
update Product SET SetQty=10 where MarginCode ='A' AND SetQty=1
