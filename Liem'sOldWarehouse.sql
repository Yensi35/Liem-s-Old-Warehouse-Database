/* Rules for staff table :
1.Every staff hired must have a personal information like name, gender, date of birth, address, email, phone number, and salary.
2.Every staff has an identification number :'STXXX' -> XXX : number between 0-9
3.Staff gender must be either ‘Male’ or ‘Female’.
4.Staff email must contains ‘@’. */

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
	StaffPhoneNumber VARCHAR(15) NOT NULL,
	StaffSalary BIGINT NOT NULL
)

INSERT INTO Staff
	VALUES  ('ST001','Yensi','FEMALE','1999-01-21','Perum.Duri Kosambi Baru,Blok D No.12,Jakarta','yensiliem@gmail.com','087809373308',4000000),
		('ST002','Michael','MALE','1988-05-12','Sunter Jaya,No.11,Jakarta','michaell@gmail.com','08120495873401',3500000),
		('ST003','Jonathan','MALE','1989-02-20','Boulevard Barat,No.22a,Jakarta','Jonathan22@gmail.com','087809658345',4000000),
		('ST004','Jovina Lawrence','FEMALE','1997-02-05','Danau Sunter Barat,No.10,Jakarta','Lawrencia11@gmail.com','081236590766',3500000),
		('ST005','Nicholle','MALE','2001-09-23','Muara Bahari,No.24,Jakarta','nichollee@gmail.com','082199837422',4000000),
		('ST006','Kevin','MALE','1998-10-21','Green Apartment,Jakarta','kevin@gmail.com','081298736496',3500000),
		('ST007','Dinda','FEMALE','1997-11-28','Kebayoran Baru, Jakarta','dinda@gmail.com','087800635418',4000000),
		('ST008','Lydia Putri','FEMALE','1998-01-10','Kemanggisan,Jakarta','lydia@gmail.com','081200938471',3000000),
		('ST009','Nicholas','MALE','1998-02-23','Ancol Selatan 2,Jakarta','nicholas@gmail.com','082199073648',3500000),
		('ST010','Sri Ratna','FEMALE','1998-10-29','Kelapa Gading,Jakarta','sriratna@gmail.com','0821945634532',4000000)

SELECT*FROM Staff

/*Rules for Category Table :
1. Every category has their own category name
2. Identification number : 'CTXXX' -> XXX : number between 0-9*/

CREATE TABLE Category(
	CategoryID CHAR (5) PRIMARY KEY NOT NULL
	CHECK (CategoryID LIKE 'CT[0-9][0-9][0-9]'),
	CategoryName VARCHAR (20) NOT null,
)

INSERT INTO Category
	VALUES	('CT001', 'Beverage'),
		('CT002', 'Household Needs'),
		('CT003', 'Food')

SELECT* FROM Category

/*Rules for Item Table :
1. Every item supplied from factories or distributed to distributors have its own name, supply price, distribute price, stock, material and description
2. Every item has an identification number : 'ITXXX' -> XXX : number between 0-9
3. Every item has their own category
4. Check the item stock so that the stock cannot be empty */

CREATE TABLE Item(
	ItemID CHAR (5) PRIMARY KEY NOT NULL
	CHECK(ItemID LIKE'IT[0-9][0-9][0-9]'),
	CategoryID CHAR (5) NOT NULL
	REFERENCES Category(CategoryID),
	ItemName VARCHAR (100) NOT NULL,
	SupplyPrice BIGINT NOT NULL,
	DistributePrice BIGINT NOT NULL,
	Stock INT NOT NULL,
	Material VARCHAR (50) NOT NULL,
	ItemDescription VARCHAR (20) NOT NULL DEFAULT 'No Description'
)

INSERT INTO Item (ItemID, CategoryID, ItemName, SupplyPrice, DistributePrice, Stock, Material)
	VALUES  
		('IT001','CT001','Ultra Milk Vanila 150 ML',1500000,2000000,50, 'Liquid'),
		('IT002','CT001','Sirup ABC Jeruk 200 ML',14500000,15500000,70,'Liquid'),
		('IT003','CT001','Sirup ABC Leci 200 ML',14500000,15500000,50,'Liquid'),
		('IT004','CT001','Sirup ABC Anggur 200 ML',14500000,15500000,10,'Liquid'),
		('IT005','CT001','Sirup ABC Mangga 200 ML',14500000,15500000,50,'Liquid'),
		('IT006','CT001','Sirup ABC Markisa 200 ML',14500000,15500000,30,'Liquid'),
		('IT007','CT001','Nescafe Mocca 150 ML',13500000,14000000,350,'Liquid'),
		('IT008','CT001','Nescafe Original 150 ML',13000000,13500000,200,'Liquid'),
		('IT009','CT001','Nescafe Latte',13500000,14000000,350,'Liquid'),
		('IT010','CT001','Ultra Milk Chocolate 150 ML',1500000,2000000,50,'Liquid'),
		('IT011','CT002','Kapur Bagus 20 GR',10000000,10500000,750,'Solid'),
		('IT012','CT002','Sunlight 100 ML',7000000,8000000,150,'Liquid'),
		('IT013','CT002','Sunlight Lemon 100 ML',7000000,8000000,50,'Liquid'),
		('IT014','CT002','Kamper Bagus 20 GR',2500000,3000000,50,'Solid'),
		('IT015','CT002','Wipol 100 ML',2250000,3250000,750,'Liquid'),
		('IT016','CT002','Vanish 100 ML',10000000,10500000,350,'Liquid'),
		('IT017','CT002','Rinso 100 ML',13000000,13500000,200,'Liqud'),
		('IT018','CT002','Rinso 150 ML',10000000,10500000,100,'Liquid'),
		('IT019','CT002','Kamper Bagus 10 GR',10000000,1500000,450,'Solid'),
		('IT020','CT002','Wipol 150 ML',2000000,2500000,10,'Liquid'),
		('IT021','CT003','Malkist Original 100 GR',2250000,3250000,750,'Solid'),
		('IT022','CT003','Malkist Abon 100 GR',10500000,11000000,350,'Solid'),
		('IT023','CT003','Indomie Soto',3000000,3500000,100,'Solid'),
		('IT024','CT003','Indomie Kari',3000000,3500000,50,'Solid'),
		('IT025','CT003','Indomie Goreng',3000000,3500000,200,'Solid')

SELECT * FROM Item

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
	FactoryRating DECIMAL (2,1) NOT NULL
	CONSTRAINT chk CHECK (FactoryRating >= 0 AND FactoryRating <= 5),
	StartDate DATE NOT NULL
)

SELECT * FROM Factory

INSERT INTO Factory
	VALUES	
		('FC001','PT.Ultrajaya','Bogor,Kenanga Street','Daniel',4.0,'2001-03-04'),
		('FC002','PT.ABC Jaya','Jakarta,Melati Street','Ivana Annisa',4.2,'1999-10-05'),
		('FC003','PT.Nestle Indonesia','Tangerang,Balikpapan Street','Daffa',4.0,'2021-12-08'),
		('FC004','PT.Bagus Indonesia','Tangerang,Juanda Street','Silvia',4.5,'1998-11-02'),
		('FC005','PT.Unilever Indonesia','Jakarta, Angkasa Street','Nathaniel',4.0,'2000-12-01'),
		('FC006','PT.Mayora Indah','Jakarta, Grogol Baru Street','Mike',3.0,'2002-01-02'),
		('FC007','PT.Indofood CBP','Tangerang, Kartini Karya Street','Budi',4.0,'1999-01-10'),
		('FC008','PT.Suryamas','Bandung, Anggrek Street','Jovan',4.3,'2001-10-01'),
		('FC009','PT.Jaya Indah ','Bekasi, Indah Street','Mike',3.7,'2002-01-02'),
		('FC010','PT.Indofood CBP Tangerang','Tangerang, Baru Street','Budi',4.1,'1999-01-10')

/*Rules for Distributor Table :
1. Every distributor that distribute items from the warehouse must already completed their company and personal information like name,
   address, company name, location, email, and phone number.
2. Every distributor has an identification number : 'DIXXX' -> XXX : number between 0-9
3. Distributor’s email must contain ‘@’.
4. Distributor’s company name must ends with ‘ Company’. */

CREATE TABLE Distributor(
DistributorID CHAR (5) PRIMARY KEY NOT NULL
CHECK (DistributorID LIKE 'DI[0-9][0-9][0-9]'),
DistributorName VARCHAR (30) NOT NULL,
DistributorAddress VARCHAR (100) NOT NULL,
CompanyName VARCHAR (50) NOT NULL
CHECK(CompanyName LIKE '%Company'),
DistributorLocation VARCHAR (100) NOT NULL,
DistributorEmail VARCHAR (30) NOT NULL
CHECK(DistributorEmail LIKE'%@%'),
DistributorPhoneNumber VARCHAR (14) NOT NULL
)

INSERT INTO Distributor
	VALUES  
		('DI001','Jordan Tandy','Kemang, Jakarta','Indomaret Company','Blok D Tower Jaya No.1C, Jakarta','Jordan.DIM@gmail.com','082190876153'),
		('DI002','Melisa','Palmerah, Jakarta','Giant Company','Gedung Plaza Pasifik No.3A, Jakarta','Melisa_GSP@gmail.com','087800182731'),
		('DI003','Yensi','Sunter Karya, Jakarta','Alfamart Company','Sunter Karya Barat 3 No.4D, Jakarta','Yensi.AlfS@gmail.com','082111769845'),
		('DI004','Dina','Kemanggisan, Jakarta','Giant Company','Ruko Taman Sari Blok D4, Jakarta','Dina_GSP@gmail.com','08211827310912'),
		('DI005','Vina Angelita','Sunter Agung, Jakarta','Alfamart Company','Sunter Agung Barat No.11A, Jakarta','VinaAng.AlfS@gmail.com','087809981721'),
		('DI006','Michael','PIK, Jakarta','Giant Company','Tower AG No.3A, Jakarta','Michael_GSP@gmail.com','087898716281'),
		('DI007','Tony Sanjaya','Kemang, Jakarta','Alfamart Company','Tower Kemang Lt.1C, Jakarta','ToniSan.AlfS@gmail.com','082198192817'),
		('DI008','Elisabeth','Cakung, Jakarta','Alfamart Company','Jln.Pengangsaan 3 No.11B, Jakarta','Elisabeth.AlfS@gmail.com','082109837134'),
		('DI009','Vera','Palmerah, Jakarta','Giant Company','Jln.Jaya 1, Jakarta','Vera_GSP@gmail.com','087800182731'),
		('DI010','Dimas','Pluit, Jakarta','Alfamart Company','Jln.Pluit Sakti 3, Jakarta','Dimas.AlfS@gmail.com','082111769845')
		
/*Rules for SupplyTransaction Table :
1. Every supply transaction made with the supplier have all the information about staff, factory, transaction date, items purchased, and the quantity of each item.
2. Every supply transaction has an identification number : 'SUXXX' -> XXX : number between 0-9 */

CREATE TABLE SupplyTransactionHeader(
	SupplyID CHAR (5) PRIMARY KEY NOT NULL
	CHECK(SupplyID LIKE'SU[0-9][0-9][0-9]'),
	StaffID CHAR (5) NOT NULL
	REFERENCES Staff(StaffID),
	FactoryID CHAR (5) NOT NULL
	REFERENCES Factory(FactoryID),
	SupplyTransactionDate DATE NOT NULL

)

INSERT INTO SupplyTransactionHeader
	VALUES  
		('SU001','ST001','FC001','2018-12-10'),
		('SU002','ST002','FC002','2018-12-13'),
		('SU003','ST002','FC008','2018-12-13'),
		('SU004','ST002','FC002','2018-12-15'),
		('SU005','ST002','FC008','2018-12-16'),
		('SU006','ST002','FC002','2018-12-16'),
		('SU007','ST003','FC003','2019-01-11'),
		('SU008','ST003','FC003','2019-01-11'),
		('SU009','ST003','FC003','2019-01-11'),
		('SU010','ST001','FC001','2019-01-11'),
		('SU011','ST004','FC004','2019-01-12'),
		('SU012','ST005','FC005','2019-01-12'),
		('SU013','ST005','FC005','2019-01-12'),
		('SU014','ST004','FC004','2019-01-13'),
		('SU015','ST005','FC005','2019-01-13'),
		('SU016','ST005','FC005','2019-01-13'),
		('SU017','ST005','FC005','2019-01-13'),
		('SU018','ST005','FC005','2019-01-13'),
		('SU019','ST004','FC004','2019-01-14'),
		('SU020','ST005','FC005','2019-01-14'),
		('SU021','ST006','FC009','2019-01-15'),
		('SU022','ST006','FC006','2019-01-15'),
		('SU023','ST007','FC007','2019-01-15'),
		('SU024','ST007','FC010','2019-01-15'),
		('SU025','ST007','FC010','2019-01-15')

CREATE TABLE SupplyTransactionDetail(
	SupplyID CHAR (5)  NOT NULL FOREIGN KEY
	REFERENCES SupplyTransactionHeader(SupplyID),
	ItemID CHAR (5) NOT NULL FOREIGN KEY
	REFERENCES Item(ItemID),
	PurchasedQty INT NOT NULL
	PRIMARY KEY (SupplyID , ItemID)
)

INSERT INTO SupplyTransactionDetail
	VALUES  
		('SU001','IT001',150),
		('SU002','IT002',500),
		('SU003','IT003',500),
		('SU004','IT006',500),
		('SU005','IT005',500),
		('SU006','IT006',500),
		('SU007','IT007',1000),
		('SU008','IT008',1000),
		('SU009','IT009',1000),
		('SU010','IT010',200),
		('SU011','IT011',2000),
		('SU012','IT012',700),
		('SU013','IT013',700),
		('SU014','IT014',500),
		('SU015','IT015',1500),
		('SU016','IT017',1000),
		('SU017','IT017',2000),
		('SU018','IT018',1000),
		('SU019','IT019',1000),
		('SU020','IT001',200),
		('SU021','IT021',1500),
		('SU022','IT022',1000),
		('SU023','IT023',2000),
		('SU024','IT020',2000),
		('SU025','IT025',2000)

/* Rules for DistributeTransaction Table :
1. Every distribute transaction made by the distributor have all the information about staff, distributor, distribution city, 
   transaction date, items distributed, and the quantity of each item.
2. Every distribute transaction has an identification number : 'DTXXX' -> XXX: number between 0-9 */

CREATE TABLE DistributionTransactionHeader(
	DistributeID CHAR (5) PRIMARY KEY NOT NULL
	CHECK(DistributeID LIKE'DT[0-9][0-9][0-9]'),
	StaffID CHAR (5) NOT NULL
	REFERENCES Staff(StaffID),
	DistributorID CHAR (5) NOT NULL
	REFERENCES Distributor(DistributorID),
	DistributionCity VARCHAR (30) NOT NULL,
	TransactionDate DATE NOT NULL,
)

INSERT INTO DistributionTransactionHeader
	VALUES
			('DT001','ST008','DI001','Jakarta','2019-02-03'),
			('DT002','ST008','DI001','Jakarta','2019-02-03'),
			('DT003','ST008','DI001','Jakarta','2019-02-03'),
			('DT004','ST008','DI001','Jakarta','2019-02-04'),
			('DT005','ST008','DI001','Jakarta','2019-02-04'),
			('DT006','ST008','DI001','Jakarta','2019-02-04'),
			('DT007','ST008','DI001','Jakarta','2019-02-04'),
			('DT008','ST009','DI002','Jakarta','2019-02-05'),
			('DT009','ST009','DI002','Jakarta','2019-02-05'),
			('DT010','ST009','DI002','Jakarta','2019-02-05'),
			('DT011','ST010','DI003','Jakarta','2019-02-05'),
			('DT012','ST010','DI003','Jakarta','2019-02-05'),
			('DT013','ST010','DI003','Jakarta','2019-02-05'),
			('DT014','ST008','DI001','Jakarta','2019-02-06'),
			('DT015','ST008','DI001','Jakarta','2019-02-06'),
			('DT016','ST008','DI001','Jakarta','2019-02-06'),
			('DT017','ST008','DI001','Jakarta','2019-02-06'),
			('DT018','ST008','DI001','Jakarta','2019-02-06'),
			('DT019','ST009','DI002','Jakarta','2019-02-06'),
			('DT020','ST009','DI002','Jakarta','2019-02-06'),
			('DT021','ST009','DI002','Jakarta','2019-02-06'),
			('DT022','ST010','DI003','Jakarta','2019-02-06'),
			('DT023','ST010','DI003','Jakarta','2019-02-06'),
			('DT024','ST010','DI003','Jakarta','2019-02-06'),
			('DT025','ST010','DI003','Jakarta','2019-02-06')

CREATE TABLE DistributionTransactionDetail(
	DistributeID CHAR (5) NOT NULL FOREIGN KEY
	REFERENCES DistributionTransactionHeader(DistributeID),
	ItemID CHAR (5)  NOT NULL FOREIGN KEY
	REFERENCES Item(ItemID),
	DistributeQty INT NOT NULL
	PRIMARY KEY (DistributeID , ItemID)
)

INSERT INTO DistributionTransactionDetail
	VALUES ('DT001','IT001',30),
		   ('DT002','IT002',45),
		   ('DT003','IT003',100),
		   ('DT004','IT004',20),
		   ('DT005','IT005',150),
		   ('DT006','IT006',200),
		   ('DT007','IT002',60),
		   ('DT008','IT008',45),
		   ('DT009','IT009',150),
		   ('DT010','IT010',100),
		   ('DT011','IT001',20),
		   ('DT012','IT012',60),
		   ('DT013','IT013',125),
		   ('DT014','IT014',150),
		   ('DT015','IT015',250),
		   ('DT016','IT016',250),
		   ('DT017','IT017',100),
		   ('DT018','IT020',10),
		   ('DT019','IT019',350),
		   ('DT020','IT021',15),
		   ('DT021','IT021',15),
		   ('DT022','IT022',50),
		   ('DT023','IT020',10),
		   ('DT024','IT024',150),
		   ('DT025','IT025',100)
