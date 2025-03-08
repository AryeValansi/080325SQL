



--Project 1--

--Creating new Database--

use master

create database SalesDB

use SalesDB


--drop tables
/*
drop table SpecialOfferProduct
drop table CurrencyRate
drop table ShipMethod
drop table NewAddress
drop table CreditCard
drop table SalesOrderDetail
drop table SalesTerritory
drop table Customer
drop table SalesPerson
drop table SalesOrderHeader

*/
--Creating new tables--

create table SpecialOfferProduct
( SpecialOfferID INT IDENTITY(1,1),
ProductID INT NOT NULL,
ModifiedDate DATETIME DEFAULT getdate() not null,
CONSTRAINT sop_ProductID_SpecialOfferID_PK PRIMARY KEY (ProductID,SpecialOfferID)
)
INSERT INTO SpecialOfferProduct (ProductID,ModifiedDate)
VALUES (2001,'2020-01-01'),
(2002,'2020-03-05'),
(2003,'2020-12-12'),
(2004,'2021-04-05'),
(2005,'2021-05-06'),
(2006,'2021-11-07'),
(2007,'2022-05-09'),
(2008,'2023-01-02'),
(2009,'2023-12-26'),
(2010,default)





create table CurrencyRate
( CurrencyRateID INT IDENTITY(10,5) PRIMARY KEY NOT NULL,
CurrencyRateDate DATETIME DEFAULT GETDATE() NOT NULL,
FromCurrencyCode NCHAR(3) NOT NULL,
ToCurrencyCode NCHAR(3) NOT NULL,
AverageRate MONEY NOT NULL,
EndOfDayRate MONEY NOT NULL,
ModifiedDate DATETIME DEFAULT GETDATE() NOT NULL,
CONSTRAINT CR_CurrencyRateDate_CK CHECK(YEAR(CurrencyRateDate)>=2020),
CONSTRAINT CR_FromCurrencyCode_CK CHECK(LEN(FromCurrencyCode)<=3),
CONSTRAINT CR_ToCurrencyCode_CK CHECK(LEN(ToCurrencyCode)<=3),
CONSTRAINT CR_AverageRate_CK CHECK(ROUND(AverageRate,3)>0),
CONSTRAINT CR_EndOfDayRate_CK CHECK(ROUND(EndOfDayRate,3)>0)
)

INSERT INTO CurrencyRate (CurrencyRateDate,FromCurrencyCode,ToCurrencyCode,AverageRate,EndOfDayRate,ModifiedDate)
VALUES ('2020-01-01','EUR','NIS',4.123,4.13, '2020-01-01'),
('2020-03-05','EUR','USD',1.12,1.09,'2020-03-05'),
('2020-12-12','EUR','AUD',1.58,1.66 ,'2020-12-12' ),
('2021-04-05','EUR','GBP',0.87,0.86 ,'2021-04-05'),
('2021-05-06','EUR','BRL',6.07,6.10,'2021-05-06'),
('2021-11-07','EUR','JPY',160.72,160.63,'2021-11-07'),
('2022-05-09','EUR','RUB',94.61,94.63,'2022-05-09'),
('2023-01-02','EUR','CZK',25.11,25.27,'2023-01-02'),
('2023-12-26','EUR','USD', 1.07, 1.08,'2023-12-26'),
(default,'EUR','NIS',4.1,4.15,default)




create table ShipMethod
( ShipMethodID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Name NVARCHAR(50) NOT NULL,
ShipBase MONEY NOT NULL,
ShipRate MONEY NOT NULL,
ModifiedDate DATETIME DEFAULT GETDATE() NOT NULL,
CONSTRAINT SM_ShipBase_CK CHECK(ROUND(ShipBase,3)>0),
CONSTRAINT SM_ShipRate_CK CHECK(ROUND(ShipRate,3)>0),
)

INSERT INTO ShipMethod (Name,ShipBase,ShipRate,ModifiedDate)
VALUES ('XRQ TRUCK GROUND',3.95,0.99,'2020-01-01'),
('ZY-EXPRESS', 9.95, 1.99,'2020-03-05'),
('OVERSEAS-DELUXE', 29.95, 2.99,'2020-12-12'),
('OVERNIGHT J-FAST', 21.95, 1.29,'2021-04-05'),
('CARGO TRANSPORT 5', 8.99,1.49, '2021-05-06'),
('Mediterranean Shg Co', 20.24,3.25,'2021-11-07' ),
('Maersk',18.85,2.63,'2022-05-09' ),
('CMA CGP Group',15.72, 1.85, '2023-01-02'),
('Cosca Group' ,12.86,1.75,'2023-12-26'),
('Evergreen Line',8.43,0.87,default)



create table NewAddress
(AddressID INT Primary Key IDENTITY(1,1) NOT NULL,
AddressLine1 NVARCHAR(60) NOT NULL,
AddressLine2 NVARCHAR(60) ,
City NVARCHAR(30) NOT NULL,
StateProvinceID INT NOT NULL,
PostalCode NVARCHAR(15) NOT NULL,
ModifiedDate DATETIME DEFAULT GETDATE() NOT NULL,
)

INSERT INTO NewAddress(AddressLine1,AddressLine2,City,StateProvinceID, PostalCode, ModifiedDate)
VALUES ('6387 Scenic Avenue', NULL,'Bothell', 79 , 98011, '2020-01-01'),
('636 Vine Hill Way',NULL,'Portland',58,97205, '2020-03-05'),
('6657 Sand Pointe Lane', NULL, 'Seattle', 79, 98104, '2020-12-12'),
('80 Sunview Terrace',NULL,'Duluth',36,55802,'2021-04-05'),
('9178 Jumping St.',NULL,'Dallas', 73, 75201, '2021-05-06'),
('5725 Glaze Drive',NULL, 'San Francisco',9,94109, '2021-11-07'),
('2487 Riverside Drive',null,'Nevada',74,84407, '2022-05-09'),
('9228 Via Del Sol', NULL, 'Phoenix', 6, 85004, '2023-01-02'),
('8291 Crossbow Way',NULL, 'Memphis', 72, 38103, '2023-12-26'),
('9707 Coldwater Drive', NULL,'Orlando', 15, 32804, default)



create table CreditCard
( CreditCardID INT Primary Key IDENTITY (1,1) NOT NULL,
CardType NVARCHAR(50) NOT NULL,
CardNumber NVARCHAR(25) NOT NULL,
ExpMonth TINYINT NOT NULL,
ExpYear SMALLINT NOT NULL,
ModifiedDate DATETIME DEFAULT GETDATE() NOT NULL,
CONSTRAINT CC_CardNumber_CK CHECK(LEN(CardNumber)=14),
CONSTRAINT CC_ExpMonth_CK CHECK(ExpMonth<=12),
CONSTRAINT CC_ExpYear_CK CHECK(ExpYear>2023)
)

INSERT INTO CreditCard(CardType,CardNumber,ExpMonth,ExpYear,ModifiedDate)
VALUES ('VISA',24560987736554,8,2024,'2020-01-01'),
('VISA',90871234567891,1,2024,'2020-03-05'),
('ISRACARD', 35244678114571,6,2024, '2020-12-12'),
('ISRACARD',75589054637905,2,2024,'2021-04-05'),
('SUPERIORCARD',55556333798473,5,2024, '2021-05-06'),
('VISA',55556779365170,4,2024,'2021-11-07'),
('VISA',11116739347695,10,2024,'2022-05-09'),
('VISA',55553665516951, 7 ,2024, '2023-01-02'),
('ISRACARD',55551100991160, 12 , 2024,'2023-12-26'),
('ISRACARD', 11115652257330, 11,2025, default)



create table SalesOrderDetail
( SalesOrderID INT NOT NULL,
SalesOrderDetailID INT NOT NULL,
CarrierTrackingNumber NVARCHAR(25),
OrderQty SMALLINT NOT NULL,
ProductID INT NOT NULL, 
SpecialOfferID INT IDENTITY(1,1) NOT NULL,
UnitPrice MONEY NOT NULL,
UnitPriceDiscount MONEY DEFAULT 0 NOT NULL,
ModifiedDate DATETIME DEFAULT GETDATE() NOT NULL,
CONSTRAINT SOD_SalesOrderID_SalesOrderDetailID_PK PRIMARY KEY (SalesOrderID,SalesOrderDetailID),
CONSTRAINT SOD_CarrierTrackingNumber_CK CHECK(LEN(CarrierTrackingNumber)<=15),
CONSTRAINT SOD_ProductID_SpecialOfferID_FK FOREIGN KEY(ProductID,SpecialOfferID) REFERENCES SpecialOfferProduct (ProductID,SpecialOfferID)
)

INSERT INTO SalesOrderDetail(SalesOrderID,SalesOrderDetailID,CarrierTrackingNumber,OrderQty,ProductID, UnitPrice, UnitPriceDiscount, ModifiedDate)
VALUES(3500,1,'1998-8243-US',5,2001,352,default,'2020-01-01'),
(3501,2,'1437-2824-BB',4,2002,288,default,'2020-03-05'),
(3502,3,'7055-9804-8E',3,2003,450,default,'2020-12-12'),
(3503,4,'1210-5685-CN',1,2004,2025,default,'2021-04-05'),
(3504,5,'4546-2795-FK',2,2005,750,default,'2021-05-06'),
(3505,6,'0280-8425-U7',2,2006,888,default,'2021-11-07'),
(3506,7,'4072-7004-O9',3,2007,657,default,'2022-05-09'),
(3507,8,'2881-0346-JK',7,2008,125,0.15,'2023-01-02'),
(3508,9,'4140-5096-HE',4,2009,258,0.05,'2023-12-26'),
(3509,10,'5010-5808-TN',3,2010,687,default, default)                                    



create table SalesTerritory
( TerritoryID INT Primary Key IDENTITY(1,1) NOT NULL,
Name NVARCHAR(50) NOT NULL,
CountryRegionCode nvarchar(3) NOT NULL,
[Group] NVARCHAR(50) NOT NULL,
SalesYTD MONEY NOT NULL,
SalesLastYear MONEY NOT NULL,
CostYTD MONEY NOT NULL,
CostLastYear MONEY NOT NULL,
ModifiedDate DATETIME DEFAULT GETDATE() NOT NULL,
CONSTRAINT ST_SalesYTD_CK CHECK(FLOOR(SalesYTD)>0),
CONSTRAINT ST_SalesLastYear_CK CHECK(CEILING(SalesLastYear)>0)
)

INSERT INTO SalesTerritory(Name,CountryRegionCode,[Group],SalesYTD,SalesLastYear,CostYTD,CostLastYear,ModifiedDate)
VALUES('Northwest','US','North America',7887186.8,3298694.5,0,0,'2020-01-01'),
('Northeast','US','North America',2402176.8,3607148.9,0,0,'2020-03-05'),
('Central','US','North America',3072175.2,3205014.1,0,0,'2020-12-12'),
('Southwest','US','North America',10510853.8,5366575.7,0,0,'2021-04-05'),
('Southeast','US','North America',2538667.5,3925071.4,0,0,'2021-05-06'),
('Canada','CA','North America',6771829.2,5693988.8,0,0,'2021-11-07'),
('France','FR','Europe',4772398.3,2396539.7,0,0,'2022-05-09'),
('Germany','DE','Europe',3805202.3,1307949.8,0,0,'2023-01-02'),
('Australia','AU','Pacific',5977814.9,2278548.9,0,0,'2023-12-26'),
('United Kingdom','GB','Europe',5012905.4,1635823.4,0,0,default)

create table SalesPerson
(BusinessEntityID INT IDENTITY (200,1) PRIMARY KEY NOT NULL,
TerritoryID INT,
SalesQuota MONEY,
Bonus MONEY NOT NULL,
CommissionPct SMALLMONEY NOT NULL,
SalesYTD MONEY NOT NULL,
SalesLastYear MONEY NOT NULL,
ModifiedDate DATETIME DEFAULT GETDATE() NOT NULL,
CONSTRAINT SP_SalesQuota_CK CHECK(ROUND(SalesQuota,2)>0),
CONSTRAINT SP_SalesYTD_CK CHECK(FLOOR(SalesYTD)>0),
CONSTRAINT SP_SalesLastYear_CK CHECK(CEILING(SalesLastYear)>0),
CONSTRAINT SP_TerritoryID_FK FOREIGN KEY (TerritoryID) References SalesTerritory (TerritoryID)
)

INSERT INTO SalesPerson(TerritoryID,SalesQuota,Bonus,CommissionPct,SalesYTD,SalesLastYear,ModifiedDate)
VALUES(1,250000,2500,0.014,3763178.2,1750406.5,'2020-01-01'),
(2,200000,2000,0.015,4251368.5,1439156.3,'2020-03-05'),
(3,250000,2500,0.015,3189418.4,1997186.2,'2020-12-12'),
(4,200000,500,0.01,1453719.5,1620276.9,'2021-04-05'),
(5,300000,6700,0.01,2315185.6,1849640.9,'2021-05-06'),
(6,250000,5000,0.01,1352577.1,1927059.2,'2021-11-07'),
(7,250000,3550,0.01,2458535.6,2073505.9,'2022-05-09'),
(8,250000,5000,0.015,2604540.7172,2038234.6549,'2023-01-02'),
(9,null,0,0,1573012.9,1502022.6,'2023-12-26'),
(10,300000,3900,0.019,1576562.2,1496789.4,default)


create table Customer
( CustomerID INT Primary Key IDENTITY(1,1) NOT NULL,
PersonID INT,
StoreID INT,
TerritoryID INT,
ModifiedDate DATETIME DEFAULT GETDATE() NOT NULL,
CONSTRAINT C_TerritoryID_FK FOREIGN KEY (TerritoryID) References SalesTerritory (TerritoryID)
)

INSERT INTO Customer(PersonID,StoreID,TerritoryID,ModifiedDate)
VALUES(NULL,732,1,'2020-01-01'),
(NULL,448,2,'2020-03-05'),
(NULL,398,3,'2020-12-12'),
(NULL,521,4,'2021-04-05'),
(NULL,165,5,'2021-05-06'),
(NULL,290,6,'2021-11-07'),
(NULL,379,7,'2022-05-09'),
(NULL,888,8,'2023-01-02'),
(NULL,915,9,'2023-12-26'),
(NULL,635,10,default)



create table SalesOrderHeader
(SalesOrderID INT Primary Key NOT NULL,
RevisionNumber TINYINT NOT NULL,
OrderDate DATETIME NOT NULL,
DueDate DATETIME NOT NULL,
ShipDate DATETIME,
Status TINYINT NOT NULL,
CustomerID INT NOT NULL,
SalesPersonID INT,
TerritoryID INT,
BillToAddressID INT NOT NULL,
ShipToAddressID INT NOT NULL,
ShipMethodID INT NOT NULL,
CreditCardID INT,
CreditCardApprovalCode VARCHAR(15),
CurrencyRateID INT,
SubTotal MONEY NOT NULL,
TaxAmt MONEY NOT NULL,
Freight MONEY NOT NULL,
AddressID INT NOT NULL,
CONSTRAINT SOH_SubTotal_CK CHECK(ROUND(SubTotal,2)>0),
CONSTRAINT SOH_TaxAmt_CK CHECK(ROUND(TaxAmt,2)>0),
CONSTRAINT SOH_Freight_CK CHECK(ROUND(Freight,2)>0),
CONSTRAINT SOH_AddressID_FK FOREIGN KEY (AddressID) REFERENCES NewAddress (AddressID),
CONSTRAINT SOH_ShipMethodID_FK FOREIGN KEY (ShipMethodID) REFERENCES ShipMethod (ShipMethodID),
CONSTRAINT SOH_CurrencyRateID_FK FOREIGN KEY (CurrencyRateID) REFERENCES CurrencyRate (CurrencyRateID),
CONSTRAINT SOH_CreditCardID_FK FOREIGN KEY (CreditCardID) REFERENCES CreditCard (CreditCardID),
CONSTRAINT SOH_CustomerID_FK FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
CONSTRAINT SOH_TerritoryID_FK FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory (TerritoryID),
CONSTRAINT SOH_SalesPersonID_FK FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson (BusinessEntityID)
)

INSERT INTO SalesOrderHeader(SalesOrderID,RevisionNumber,OrderDate,DueDate,ShipDate,Status,CustomerID,SalesPersonID,TerritoryID,
BillToAddressID,ShipToAddressID,ShipMethodID,CreditCardID,CreditCardApprovalCode,CurrencyRateID,SubTotal,TaxAmt,Freight,AddressID)

VALUES(3500,3,'2019-12-17','2019-12-24','2020-01-01',5,1,NULL,1,25643,25643,1,1,'242387Vi34223',10,548.98,43.92,13.72,1),
(3501,3,'2020-02-21','2020-02-28','2020-03-05',5,2,NULL,2,26568,26568,2,2,'1242859Vi61993',15,2384.07,190.73,59.6,2),
(3502,3,'2020-11-26','2020-12-05','2020-12-12',5,3,NULL,3,27090,27090,3,3,'242864Vi83167',20,2419.06,193.52,60.47,3),
(3503,3,'2021-03-22','2021-03-29','2021-04-05',5,4,NULL,4,23543,23543,4,4,'116821Vi31804',25,27.28,2.18,0.68,4),
(3504,3,'2021-04-24','2021-04-30','2021-05-06',5,5,NULL,5,22550,22550,5,5,'117556Vi63808',30,29.93,2.39,0.74,5),
(3505,3,'2021-10-24','2021-10-30','2021-11-07',5,6,NULL,6,28760,28760,6,6,'317865Vi24853',35,4.99,0.39,0.12,6),
(3506,3,'2022-04-27','2022-05-02','2022-05-09',5,7,NULL,7,16300,16300,7,7,'118418Vi62713',40,62.98,5.04,1.57,7),
(3507,3,'2022-12-21','2022-12-28','2023-01-02',5,8,NULL,8,27067,27067,8,8,'219707Vi43885',45,2478.34,198.26,61.96,8),
(3508,3,'2022-12-12','2023-12-19','2023-12-26',5,9,NULL,9,18947,18947,9,9,'1219866Vi76405',50,848.47,67.87,21.21,9),
(3509,3,'2024-08-01','2024-08-08','2024-08-15',5,10,NULL,10,12548,12548,10,10,'820300Vi17658',55,2349.98,187.99,58.75,10)

ALTER TABLE SalesOrderDetail  ADD CONSTRAINT FK_SalesOrderDetail_SalesOrderID FOREIGN KEY (SalesOrderID)
REFERENCES SalesOrderHeader (SalesOrderID)
