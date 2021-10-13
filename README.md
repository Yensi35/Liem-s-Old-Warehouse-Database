/*Liem-s-Old-Warehouse-Database
Liem’s Old Warehouse is your one stop warehouse which is run by the town tycoon, Liem. The warehouse can store literally anything. 
The warehouse got its supplies from the factory and distribute the items to the distributors.
Every staff that hired by Liem’s Old Warehouse have a task to receive any supplies that come from a partner factory and deals 
with any distributor that want to distribute any item that is available in the warehouse*/

// Create table

/* Rules for staff table :
1.Every staff hired must have a personal information like name, gender, date of birth, address, email, phone number, and salary. 
2.Every staff has an identification number : 'STXXX' -> XXX : number between 0-9
3.Staff gender must be either ‘Male’ or ‘Female’.
4.Staff email must contains ‘@’.
5.Staff phone must be numeric.
*/

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
	StaffSalary Varchar (20)NOT NULL
)

/*Rules for Category Table :
1. Every category has their own category name
2. Identification number  : 'CTXXX' -> XXX : number between 0-9

CREATE TABLE Category(
	CategoryID CHAR (5) PRIMARY KEY NOT NULL
	CHECK (CategoryID LIKE 'CT[0-9][0-9][0-9]'),
	CategoryName VARCHAR (20) NOT null
	CHECK(CategoryName IN ( 'Food','Household Needs','Beverage')),
)

/*Rules for Item Table :
1. Every item supplied from factories or distributed to distributors have its own name, supply price, distribute price, stock, material and description
2. Every item has an identification number : 'ITXXX' -> XXX : number between 0-9
3. Every item has their own category
4. Check the item stock so that the stock cannot be empty
*/

CREATE TABLE Item(
	ItemID CHAR (5) PRIMARY KEY NOT NULL
	CHECK(ItemID LIKE'IT[0-9][0-9][0-9]'),
	CategoryID CHAR (5) NOT NULL
	REFERENCES Category(CategoryID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	ItemName VARCHAR (100) NOT NULL,
	ItemQty	VARCHAR (50) NOT NULL,
	SupplyPrice VARCHAR (20) NOT NULL,
	DistributePrice VARCHAR (20) NOT NULL,
	Stock VARCHAR (100) NOT NULL,
	Material VARCHAR (100) NOT NULL,
	ItemDescription VARCHAR (100) DEFAULT 'No Description' NOT NULL
)

/*Rules for Factory Table :
1.Every factory that wants to supply their items must be registered in the warehouse. The registration requires the factory’s name, 
  address, supervisor, rating, and start date
2. Every factory has an identification number : 'FCXXX' -> XXX : number between 0-9
3. The name of the factory must be between 10 and 50 characters.
4. Factory address must ends with ‘ Street’.
5. Factory rating must be between 0-5 and the number can be decimal.
*/

CREATE TABLE Factory(
	FactoryID CHAR (5) PRIMARY KEY NOT NULL
	CHECK(FactoryID LIKE'FC[0-9][0-9][0-9]'),
	FactoryName VARCHAR (50) NOT NULL
	CHECK (LEN(FactoryName) Between 10 and 50),
	FactoryAddress VARCHAR (50) NOT NULL
	Check(FactoryAddress LIKE'%Street'),
	FactorySupervisor VARCHAR (30) NOT NULL,
	FactoryRating DECIMAL (2,1)
	CONSTRAINT chk_Ratings CHECK (FactoryRating >= 0 AND FactoryRating <= 5),
	StartDate VARCHAR (15)
)

/*Rules for SupplyTransaction Table :
1. Every supply transaction made with the supplier have all the information about staff, factory, transaction date, items purchased,
   and the quantity of each item.
2. Every supply transaction has an identification number : 'SUXXX' -> XXX : number between 0-9
*/

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
	SuppliedItemQty VARCHAR (15) NOT NULL
)

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
1. Every distributor that distribute items from the warehouse must already completed their company and personal
   information like name, address, company name, location, email, and phone number.
2. Every distributor has an identification number : 'DIXXX' -> XXX : number between 0-9
3. Distributor’s email must contain ‘@’.
4. Distributor’s company name must ends with ‘ Company’.
5. Distributor’s phone number must be numeric.
*/

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
1. Every distribute transaction made by the distributor have all the information about staff, 
   distributor, distribution city, transaction date, items distributed, and the quantity of each item.
2. Every distribute transaction has an identification number : 'DTXXX' -> XXX: number between 0-9

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
	

