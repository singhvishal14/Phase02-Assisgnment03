create database Exercise_Db
use Exercise_Db
create table CompanyInfo(
CId int primary key,
CName nvarchar(50)
)
insert into CompanyInfo values(1,'SamSung')
insert into CompanyInfo values(2,'HP')
insert into CompanyInfo values(3,'Apple')
insert into CompanyInfo values(4,'Dell')
insert into CompanyInfo values(5,'Toshiba')
insert into CompanyInfo values(6,'Redmi')

create table ProductInfo(
PId int,
PName nvarchar(50),
PPrice decimal(10,2),
PMDate Date,
CId int foreign key references CompanyInfo(CId)
)
insert into ProductInfo values(101,'Laptop',55000.90,'12/12/2023',1)
insert into ProductInfo values(102,'Laptop',35000.90,'12/12/2023',2)
insert into ProductInfo values(103,'Mobile',15000.90,'12/12/2023',2)
insert into ProductInfo values(104,'Laptop',135000.90,'12/12/2012',3)
insert into ProductInfo values(105,'Mobile',65000.90,'12/03/2012',3)
insert into ProductInfo values(106,'Laptop',35000.90,'12/12/2012',5)
insert into ProductInfo values(107,'Mobile',35000.90,'12/01/2012',5)
insert into ProductInfo values(108,'Earpod',1000.90,'12/01/2012',3)
insert into ProductInfo values(109,'Laptop',85000.90,'12/12/2021',6)
insert into ProductInfo values(110,'Mobile',55000.90,'12/12/2020',1)

select * from CompanyInfo join ProductInfo on CompanyInfo.CId=ProductInfo.CId

select CName,Pname from CompanyInfo join ProductInfo on CompanyInfo.CId=ProductInfo.CId

select * from CompanyInfo cross join ProductInfo

create Table Products
(
PID int primary key,
PQ nvarchar(50) ,
PPrice float,
Discount float,
)
INSERT INTO Products VALUES (1, 'TV', 65600, 10)
INSERT INTO Products VALUES (2, 'Mobile', 26999, 15)
INSERT INTO Products VALUES (3, 'laptop ', 95000, 5)
CREATE FUNCTION CalculateDiscountedValue  --function
(
@price FLOAT,
 @discount FLOAT) --paasing Parameters
RETURNS FLOAT    --Return Type
AS
BEGIN
    DECLARE @discountedValue FLOAT; --Discounted Value
    SET @discountedValue = @price - (@price * @discount / 100)
    RETURN @discountedValue
END;
SELECT  PID,PPrice,Discount,dbo.CalculateDiscountedValue(PPrice, Discount) AS DiscountedPrice
FROM Products