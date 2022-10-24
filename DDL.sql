create database [BakmiWM]

use BakmiWM

create table [MsPosition]
(
	[PositionID] char (5) primary key check ((PositionID) like 'SP[0-9][0-9][0-9]'),
	[PositionName] varchar(50)
)

create table [MsStaff](
	[StaffID] char(5) primary key check ((StaffID) like 'SF[0-9][0-9][0-9]'),
	[PositionID] char (5) foreign key references MsPosition(PositionID),
	[StaffName] varchar(255),
	[StaffGender] varchar (20),
	[StaffDOB] date,
	[StaffPhoneNumber] char(12) check ((StaffPhoneNumber) like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[StaffEmail] varchar (255) check ((StaffEmail) like '%@%'),
	[StaffAddress] varchar (255),
	[StaffSalary] int
)

create table [MsCategory](
	[CategoryID] char (5) primary key check ((CategoryID) like 'MC[0-9][0-9][0-9]'),
	[CategoryName] varchar(255)
)

create table [MsMenu](
	[MenuID] char (5) primary key check ((MenuID) like 'ME[0-9][0-9][0-9]'),
	[CategoryID] char (5) foreign key references MsCategory(CategoryID),
	[MenuName] varchar(255),
	[PriceMenu] int
)

create table [MsCustomer](
	[CustomerID] char (5) primary key check((CustomerID) like 'CU[0-9][0-9][0-9]'),
	[CustomerName] varchar (255),
	[CustomerGender] varchar (20),
	[CustomerPhoneNumber] char (12) check((CustomerPhoneNumber) like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[CustomerEmail] varchar (255) check((CustomerEmail) like '%@%'),
	[CustomerAddress] varchar (255)
)

create table [MsMenuTransaction](
	[MenuTransactionID] char (5) primary key check((MenuTransactionID) like 'MT[0-9][0-9][0-9]'),
	[StaffID] char (5) foreign key references MsStaff(StaffID),
	[CustomerID] char(5) foreign key references MsCustomer(CustomerID),
	[TransactionDate] date
)

create table [MsMenuTransactionDetail](
	[MenuTransactionID] char (5) foreign key references MsMenuTransaction(MenuTransactionID),
	[MenuID] char (5) foreign key references MsMenu(MenuID),
	[MenuQuantity] int
)

create table [MsSouvenir](
	[SouvenirID] char (5) primary key check((SouvenirID) like 'SO[0-9][0-9][0-9]'),
	[souvenirName] varchar(255),
	[BuyPrice] int,
	[SellPrice] int
)

create table [MsSouvenirTransaction](
	[SouvenirTransactionID] char(5) primary key check((SouvenirTransactionID) like 'ST[0-9][0-9][0-9]'),
	[StaffID] char (5) foreign key references MsStaff(StaffID),
	[CustomerID] char (5) foreign key references MsCustomer(CustomerID),
	[TransactionDate] date
)

create table [MsSouvenirTransactionDetail](
	[SouvenirTransactionID] char(5) foreign key references MsSouvenirTransaction(SouvenirTransactionID),
	[SouvenirID] char (5) foreign key references MsSouvenir(SouvenirID),
	[Quantity] int
)