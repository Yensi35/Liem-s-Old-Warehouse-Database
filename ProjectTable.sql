
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

CREATE TABLE Category(
	CategoryID CHAR (5) PRIMARY KEY NOT NULL
	CHECK (CategoryID LIKE 'CT[0-9][0-9][0-9]'),
	CategoryName VARCHAR (20) NOT null
	CHECK(CategoryName IN ( 'Food','Household Needs','Beverage')),
)

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