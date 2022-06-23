create database proje2;

use proje2;

CREATE TABLE Customers (
CustomerID CHAR(5),
CompanyName varchar(30),
ContactName varchar(30),
ContactTitle varchar(30),
Adress varchar(30),
City varchar(30),
Region varchar(30),
PostaCode varchar(10),
Country varchar(30),
Phone varchar(30),
Fax varchar(30),
Primary Key(CustomerID)
);



CREATE TABLE Employees
(
EmployeeID int AUTO_INCREMENT,
FirstName varchar(20),
LastName varchar(20),
Title varchar(20),
TitleOfCourtesy varchar(20),
BirthDate varchar(20),
HireDate varchar(20),
Address varchar(20),
City varchar(20),
Region varchar(20),
PostaCode varchar(20),
Coutry varchar(20),
HomePage varchar(20),
ReportsTo int,
Salary 	int,
Primary Key(EmployeeID)
);



CREATE TABLE Region
(
RegionID int,
RegionDescription varchar(30),
Primary Key(RegionID)
);



CREATE TABLE Territories
(
TerritoryID int,
TerritoryDescription varchar(30),
RegionID int,
Primary Key(TerritoryID)
);



CREATE TABLE EmployeeTerritories
(
EmployeeID int,
TerritoryID int,
Primary Key(TerritoryID, EmployeeID),
Foreign Key (EmployeeID) REFERENCES Employees(EmployeeID),
Foreign Key (TerritoryID) REFERENCES Territories(TerritoryID)
);



CREATE TABLE Categories
(
CategoryID int,
CategoryName varchar(20),
Description varchar(100),
Primary Key(CategoryID)
);



CREATE TABLE Suppliers
(
SupplierID int,
CompanyName varchar(30),
ContactName varchar(30),
ContactTitle varchar(30),
Adress varchar(30),
City varchar(30),
Region varchar(30),
PostaCode varchar(10),
Country varchar(30),
Phone varchar(30),
Fax varchar(30),
HomePage varchar(20),
Primary Key(SupplierID)
);



CREATE TABLE Products
(
ProductID int,
ProductName varchar(30),
SupplierID int,
CategoryID int,
UnitPrice double,
Foreign Key (CategoryID) REFERENCES Categories(CategoryID),
Foreign Key (SupplierID) REFERENCES Suppliers(SupplierID)
);



CREATE TABLE Shippers
(
ShipperID int,
CompanyName varchar(30),
Phone varchar(30)
);



CREATE TABLE Orders
(
ShipVia tinyint,
OrderID int,
CustomerID CHAR(5),
EmployeeID int,
OrderDate date,
ShipName varchar(20),
Primary Key(OrderID),
Foreign Key(CustomerID) REFERENCES Customers(CustomerID),
-- Foreign Key(ShipVia) REFERENCES Shippers(ShipperID),
Foreign Key(EmployeeID) REFERENCES Employees(EmployeeID)
);



CREATE TABLE OrderDetails
(
OrderID int,
ProductID int,
UnitPrice int,
Quantity int,
Discount double,
Primary Key(OrderID, ProductID),
Foreign Key (OrderID) REFERENCES Orders(OrderID)
-- Foreign Key (ProductID) REFERENCES Products(ProductID)
);



CREATE TABLE CustomerDemographics(
CustomerTypeID char(4),
CustomerDesc varchar(20),
Primary Key (CustomerTypeID)
);



CREATE TABLE CustomerCustomerDemo
(
CustomerTypeID char(4),
CustomerID CHAR(5),
Primary Key (CustomerTypeID, CustomerID),
Foreign Key (CustomerTypeID) REFERENCES CustomerDemographics(CustomerTypeID),
Foreign Key (CustomerID) REFERENCES Customers(CustomerID)
);