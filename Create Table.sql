/* Rules for staff table :
1.Every staff hired must have a personal information like name, gender, date of birth, address, email, phone number, and salary.
2.Every staff has an identification number :'STXXX' -> XXX : number between 0-9
3.Staff gender must be either ‘Male’ or ‘Female’.
4.Staff email must contains ‘@’.
5.Staff phone must be numeric. */

CREATE TABLE Staff(
	StaffID CHAR (5) PRIMARY KEY NOT NULL
	CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR (30) NOT NULL,
	StaffGender CHAR (6) Not null
	CHECK(StaffGender IN('MALE','FEMALE')),
	StaffDOB DATE NOT NULL,
	StaffAddress VARCHAR (100) NOT NULL,
	StaffEmail VARCHAR (30) NOT NULL
	CHECK(StaffEmail LIKE '%@%'),
	StaffPhoneNumber Numeric (14) NOT NULL,
	StaffSalary BIGINT NOT NULL
)

INSERT INTO Staff
	VALUES  ('ST001','Yensi','FEMALE','1999-01-21','Perum.Duri Kosambi Baru,Blok D No.12,Jakarta','yensiliem@gmail.com','087809373308',4000000),
		('ST002','Michael','MALE','1998-05-12','Sunter Jaya,No.11,Jakarta','michaell@gmail.com','08120495873401',3500000),
		('ST003','Jonathan','MALE','1998-02-20','Boulevard Barat,No.22a,Jakarta','Jonathan22@gmail.com','087809658345',4000000),
		('ST004','Jovina Lawrence','FEMALE','1997-02-05','Danau Sunter Barat,No.10,Jakarta','Lawrencia11@gmail.com','081236590766',3500000),
		('ST005','Nicholle','MALE','1995-09-23','Muara Bahari,No.24,Jakarta','nichollee@gmail.com','082199837422',4000000),
		('ST006','Kevin','MALE','1998-10-21','Green Apartment,Jakarta','kevin@gmail.com','081298736496',3500000),
		('ST007','Dinda','FEMALE','1997-11-28','Kebayoran Baru, Jakarta','dinda@gmail.com','087800635418',4000000),
		('ST008','Lydia Putri','FEMALE','1998-01-10','Kemanggisan,Jakarta','lydia@gmail.com','081200938471',3000000),
		('ST009','Nicholas','MALE','1998-02-23','Ancol Selatan 2,Jakarta','nicholas@gmail.com','082199073648',3500000),
		('ST010','Sri Ratna','FEMALE','1998-10-29','Kelapa Gading,Jakarta','sriratna@gmail.com','0821945634532',4000000)


/*Rules for Category Table :
1. Every category has their own category name
2. Identification number : 'CTXXX' -> XXX : number between 0-9*/

CREATE TABLE Category(
	CategoryID CHAR (5) PRIMARY KEY NOT NULL
	CHECK (CategoryID LIKE 'CT[0-9][0-9][0-9]'),
	CategoryName VARCHAR (20) NOT null
	CHECK(CategoryName IN ( 'Food','Household Needs','Beverage')),
)

INSERT INTO Category
	VALUES	('CT001', 'Beverage'),
		('CT002', 'Household Needs'),
		('CT003', 'Food')
	
/*Rules for Item Table :
1. Every item supplied from factories or distributed to distributors have its own name, supply price, distribute price, stock, material and description
2. Every item has an identification number : 'ITXXX' -> XXX : number between 0-9
3. Every item has their own category
4. Check the item stock so that the stock cannot be empty */

CREATE TABLE Item(
	ItemID CHAR (5) PRIMARY KEY NOT NULL
	CHECK(ItemID LIKE'IT[0-9][0-9][0-9]'),
	CategoryID CHAR (5) NOT NULL
	REFERENCES Category(CategoryID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	ItemName VARCHAR (100) NOT NULL,
	ItemQty	INT NOT NULL,
	SupplyPrice BIGINT NOT NULL,
	DistributePrice BIGINT NOT NULL,
	Stock INT NOT NULL,
	Material VARCHAR (50) NOT NULL,
	ItemDescription VARCHAR (20) DEFAULT 'No Description' NOT NULL
)

INSERT INTO Item
	VALUES  ('IT001','CT001','Ultra Milk Vanila 150 ML',200,1500000,2000000,50, 'Liquid',''),
		('IT002','CT001','Sirup ABC Jeruk 200 ML',500,14500000,15500000,70,'Liquid',''),
		('IT003','CT001','Sirup ABC Leci 200 ML',500,14500000,15500000,50,'Liquid',''),
		('IT004','CT001','Sirup ABC Anggur 200 ML',500,14500000,15500000,10,'Liquid',''),
		('IT005','CT001','Sirup ABC Mangga 200 ML',500,14500000,15500000,50,'Liquid',''),
		('IT006','CT001','Sirup ABC Markisa 200 ML',500,14500000,15500000,30,'Liquid',''),
		('IT007','CT001','Nescafe Mocca 150 ML', 1000,13500000,14000000,350,'Liquid',''),
		('IT008','CT001','Nescafe Original 150 ML',1000,13000000,13500000,200,'Liquid',''),
		('IT009','CT001','Nescafe Latte',1000,13500000,14000000,350,'Liquid',''),
		('IT010','CT001','Ultra Milk Chocolate 150 ML',200,1500000,2000000,50,'Liquid',''),
		('IT011','CT002','Kapur Bagus 20 GR',2000,10000000,10500000,750,'Solid',''),
		('IT012','CT002','Sunlight 100 ML',700,7000000,8000000,150,'Liquid',''),
		('IT013','CT002','Sunlight Lemon 100 ML',700,7000000,8000000,50,'Liquid',''),
		('IT014','CT002','Kamper Bagus 20 GR',500,2500000,3000000,50,'Solid',''),
		('IT015','CT002','Wipol 100 ML',1500,2250000,3250000,750,'Liquid',''),
		('IT016','CT002','Vanish 100 ML', 1000,10000000,10500000,350,'Liquid',''),
		('IT017','CT002','Rinso 100 ML',2000,13000000,13500000,200,'Liqud',''),
		('IT018','CT002','Rinso 150 ML',1000,10000000,10500000,100,'Liquid',''),
		('IT019','CT002','Kamper Bagus 10 GR',1000,10000000,1500000,450,'Solid',''),
		('IT020','CT002','Wipol 150 ML',200,2000000,2500000,30,'Liquid',''),
		('IT021','CT003','Malkist Original 100 GR',1500,2250000,3250000,750,'Solid',''),
		('IT022','CT003','Malkist Abon 100 GR', 1000,10500000,11000000,350,'Solid',''),
		('IT023','CT003','Indomie Soto',2000,3000000,3500000,100,'Solid',''),
		('IT024','CT003','Indomie Kari',2000,3000000,3500000,50,'Solid',''),
		('IT025','CT003','Indomie Goreng',2000,3000000,3500000,200,'Solid','')

/*Rules for Factory Table : 
1.Every factory that wants to supply their items must be registered in the warehouse. The registration requires the factory’s name, 
  address, supervisor, rating, and start date 
2. Every factory has an identification number : 'FCXXX' -> XXX : number between 0-9
3. The name of the factory must be between 10 and 50 characters.
4. Factory address must ends with ‘ Street’.
5. Factory rating must be between 0-5 and the number can be decimal. */

CREATE TABLE Factory(
	FactoryID CHAR (5) PRIMARY KEY NOT NULL
	CHECK(FactoryID LIKE'FC[0-9][0-9][0-9]'),
	FactoryName VARCHAR (50) NOT NULL
	CHECK (LEN(FactoryName) Between 10 and 50),
	FactoryAddress VARCHAR (50) NOT NULL
	Check(FactoryAddress LIKE'%Street'),
	FactorySupervisor VARCHAR (30) NOT NULL,
	FactoryRating DECIMAL (1,1)
	CONSTRAINT chk_Ratings CHECK (FactoryRating >= 0 AND FactoryRating <= 5),
	StartDate DATE 
)

INSERT INTO Factory
	VALUES	('FC001','PT.Ultrajaya Milk','Bogor,Kenanga Street','Daniel','4.0','2001-03-04'),
		('FC002','PT.ABC','Jakarta,Melati Street','Ivana Annisa','4.2','1999-10-05'),
		('FC003','PT.Nestle Indonesia','Tangerang,Balikpapan Street','Daffa','4.0','2021-12-08'),
		('FC004','PT.Bagus Indonesia','Tangerang,Juanda Street','Silvia','4.5','1998-11-02'),
		('FC005','PT.Unilever Indonesia','Jakarta, Angkasa Street','Nathaniel','4.0','2000-12-01'),
		('FC006','PPT.Mayora Indah','Grogol Street','Mike','3.0','2002-01-02'),
		('FC007','PT.Indofood CBP','Sunter Street','Budi','4.0','1999-01-10')
	
/*Rules for SupplyTransaction Table :
1. Every supply transaction made with the supplier have all the information about staff, factory, transaction date, items purchased, and the quantity of each item.
2. Every supply transaction has an identification number : 'SUXXX' -> XXX : number between 0-9 */

CREATE TABLE SupplyTransaction(
	SupplyID CHAR (5) PRIMARY KEY NOT NULL
	CHECK(SupplyID LIKE'SU[0-9][0-9][0-9]'),
	StaffID CHAR (5) NOT NULL
	REFERENCES Staff(StaffID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	FactoryID CHAR (5) NOT NULL
	REFERENCES Factory(FactoryID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	ItemID CHAR (5) NOT NULL
	REFERENCES Item(ItemID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	SupplyTransactionDate DATE NOT NULL,
	SuppliedItemQty INT NOT NULL
)

INSERT INTO SupplyTransaction
	VALUES  ('SU001','ST001','FC001','IT001','2019-01-10',150),
		('SU002','ST002','FC002','IT002','2019-01-10',500),
		('SU003','ST002','F002','IT003','2019-01-10',500),
		('SU004','ST002','F002','IT004','2019-01-10',500),
		('SU005','ST002','F002','IT005','2019-01-10',500),
		('SU006','ST002','F002','IT006','2019-01-10',500),
		('SU007','ST003','FC003','IT007','2019-01-11',1000),
		('SU008','ST003','FC003','IT008','2019-01-11',1000),
		('SU009','ST003','FC003','IT009','2019-01-11',1000),
		('SU010','ST001','FC001','IT010','2019-01-11',200),
		('SU011','ST004','FC004','IT011','2019-01-12',2000),
		('SU012','ST005','FC005','IT012','2019-01-12',700),
		('SU013','ST005','FC005','IT013','2019-01-12',700),
		('SU014','ST004','FC004','IT014','2019-01-13',500),
		('SU015','ST005','FC005','IT015','2019-01-13',1500),
		('SU015','ST005','FC005','IT016','2019-01-13',1000),
		('SU015','ST005','FC005','IT017','2019-01-13',2000),
		('SU015','ST005','FC005','IT018','2019-01-13',1000),
		('SU016','ST004','FC004','IT019','2019-01-14',1000),
		('SU017','ST005','FC005','IT020','2019-01-14',200),
		('SU018','ST006','FC006','IT021','2019-01-15'1500),
		('SU019','ST006','FC006','IT022','2019-01-15'1000),
		('SU020','ST007','FC007','IT023','2019-01-15'2000)
		('SU020','ST007','FC007','IT024','2019-01-15'2000)
		('SU020','ST007','FC007','IT025','2019-01-15'2000)
		
CREATE TABLE SupplyTransactionDetail(
	SupplyID CHAR (5)  NOT NULL
	REFERENCES SupplyTransaction(SupplyID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	FactoryID CHAR (5) NOT NULL
	REFERENCES Factory(FactoryID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
)

/*Rules for Distributor Table :
1. Every distributor that distribute items from the warehouse must already completed their company and personal information like name,
   address, company name, location, email, and phone number.
2. Every distributor has an identification number : 'DIXXX' -> XXX : number between 0-9
3. Distributor’s email must contain ‘@’.
4. Distributor’s company name must ends with ‘ Company’.
5. Distributor’s phone number must be numeric. */

CREATE TABLE Distributor(
DistributorID CHAR (5) PRIMARY KEY NOT NULL
CHECK (DistributorID LIKE 'DI[0-9][0-9][0-9]'),
DistributorName VARCHAR (30) NOT NULL,
DistributorAddress VARCHAR (100) NOT NULL,
CompanyName VARCHAR (50) NOT NULL
CHECK(CompanyName LIKE '%Company'),
DistributorLocation VARCHAR (100) NOT NULL,
DistributorEmail VARCHAR (30) NOT NULL
CHECK(DistributorEmail LIKE'%@'),
DistributorPhoneNumber Numeric (14) NOT NULL
)

/* Rules for DistributeTransaction Table :
1. Every distribute transaction made by the distributor have all the information about staff, distributor, distribution city, 
   transaction date, items distributed, and the quantity of each item.
2. Every distribute transaction has an identification number : 'DTXXX' -> XXX: number between 0-9 */

CREATE TABLE DistributeTransaction(
	DistributeID CHAR (5) PRIMARY KEY NOT NULL
	CHECK(DistributeID LIKE'DI[0-9][0-9][0-9]'),
	StaffID CHAR (5) NOT NULL
	REFERENCES Staff(StaffID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	DistributorID CHAR (5) NOT NULL
	REFERENCES Distributor(DistributorID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	ItemID CHAR (5)
	REFERENCES Item(ItemID) NOT NULL
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	DistributionCity VARCHAR (30) NOT NULL,
	TransactionDate DATE NOT NULL,
)

CREATE TABLE DistributeTransactionDetails(
	DistributorID CHAR (5)  NOT NULL
	REFERENCES DistributeTransaction(DistributeID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	DistributeID CHAR (5) NOT NULL
	REFERENCES DistributeTransaction(DistributeID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
	)
