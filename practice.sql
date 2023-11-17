SELECT CustomerName, City, Country, FROM Customers;

SELECT * FROM Customers;

SELECT DISTINCT Country FROM Customers;

SELECT COUNT(DISTINCT Country) FROM Customers;

SELECT * FROM Customers WHERE Country='Mexico';

SELECT * FROM Customers WHERE CustomerID=1;

SELECT * FROM Customers WHERE Country='Germany' AND City='Berlin';

SELECT * FROM Customers WHERE City='Berlin' OR City='Stuttgart';

SELECT * FROM Customers WHERE Country='Germany' OR Country='Spain';

SELECT * FROM Custoemrs WHERE NOT Country='Germany';

SELECT * FROM Customers WHERE Country='Germany' AND (City='Berlin' OR City='Stuttgart');

SELECT * FROM Customers WHERE NOT Country='Germany' AND NOT Country='USA';

SELECT * FROM Customers ORDER BY Country;

SELECT * FROM Customers ORDER BY Country DESC;

SELECT * FROM Customers ORDER BY Country, CustomerName;

SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;

SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NULL;

SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NOT NULL;

SELECT * FROM Customers LIMIT 3;

SELECT * FROM Customers WHERE Country='Germany' LIMIT 3;

SELECT MIN(Price) AS SmallestPrice FROM Products;

SELECT MAX(Price) AS LargestPrice FROM Products;

SELECT COUNT(ProductID) FROM Products;

SELECT AVG(Price) FROM Products;

SELECT SUM(Quantity) FROM OrderDetails;

SELECT * FROM Customers WHERE CustomerName LIKE 'a%';

SELECT * FROM Customers WHERE CustomerName LIKE '%a';

SELECT * FROM Customers WHERE CustomerName LIKE '%or%';

SELECT * FROM Customers WHERE CustomerName LIKE '_r%';

SELECT * FROM Customers WHERE CustomerName LIKE 'a%o';

SELECT * FROM Customers WHERE CustomerName LIKE 'a__%';

SELECT * FROM Customers WHERE CustomerName NOT LIKE 'a%';

SELECT * FROM Customers WHERE City LIKE 'ber%';

SELECT * FROM Customers WHERE City LIKE '_ondon';

SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK');

SELECT * FROM Customers WHERE Country NOT IN ('Germany','France','UK');

SELECT * FROM Customers WHERE Country IN (SELECT Country FROM Suppliers);

SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;

SELECT * FROM Products WHERE Price BETWEEN 10 AND 20 AND Category NOT IN(1,2,3);

SELECT * FROM Products WHERE ProductName BETWEEN 'Carnavon Tigers' AND 'Mozzarella Di Giovanni' ORDER BY ProductName;

SELECT * FROM Products WHERE ProductName NOT BETWEEN 'Carnavon Tigers' AND 'Mozzarella Di Giovanni' ORDER BY ProductName;

SELECT * FROM Products WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

SELECT CustomerID AS ID, CustomerName AS Customer FROM Customers;

SELECT CustomerName AS Customer, ContactName AS "Contact Person" FROM Customers;

SELECT CustomerName, CONCAT_WS(', ', Address, PostalCode, City, Country) AS Address FROM Customers;

SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers AS c, Orders AS o WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName FROM ((Orders INNER JOIN Customers ON Orders.OrderID = Customers.CustomerID	) INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShippersID);

SELECT Customers.CustomerName, Orders.OrderID FROM Customers LEFT JOIN Orders ON Customers.CustomerID=Orders.CustomerID ORDER BY Customers.CustomerName;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName FROM Orders RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID ORDER BY Orders.OrderID;

SELECT Customers.CustomerName, Orders.OrderID FROM Customers CROSS JOIN Orders;

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City FROM Customers A, Customers B WHERE A.CustomerID <> B.CustomerID AND A.City = B.City ORDER BY A.City;

SELECT City FROM Customers UNION SELECT City FROM Suppliers ORDER BY City;

SELECT City FROM Customers UNION ALL SELECT City FROM Suppliers ORDER BY City;

SELECT City, Country FROM Customers WHERE Country='Germany' UNION SELECT City, Country FROM Suppliers WHERE Country='Germany' ORDER BY City;

SELECT City, Country FROM Customers WHERE Country='Germany' UNION ALL SELECT City, Country FROM Suppliers WHERE Country='Germany' ORDER BY City;

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country;

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC;

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID GROUP BY ShipperName;

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 5;

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 5 ORDER BY COUNT(CustomerID) DESC;

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID WHERE LastName='Davolio' OR LastName='Fuller' GROUP BY LastName HAVING COUNT(Orders.OrderID) > 25;

SELECT SupplierName FROM Suppliers WHERE EXISTS(SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

SELECT SupplierName FROM Suppliers WHERE EXISTS(SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND PRICE = 22);

SELECT ProductName FROM Products WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);

SELECT ProductName FROM Products WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity > 99);

SELECT ProductName FROM Products WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity > 1000);

SELECT ALL ProductName FROM Prodcuts WHERE TRUE;

SELECT ProductName FROM Products WHERE ProductID = ALL (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);

SELECT OrderID, Quantity, 
CASE 
WHEN Quantity > 30 THEN 'The quantity is greater than 30' 
WHEN Quantity = 30 THEN 'The quantity is 30' 
ELSE 'The quanity is under 30'
END AS QuantityText
FROM OrderDetails;

SELECT CustomerName, City, Country FROM Customers
ORDER BY (CASE 
WHEN City IS NULL THEN Country
ELSE City
END);

-- Select all:
SELECT * FROM Customers;

SELECT * FROM Customers; -- WHERE City='Berlin';

-- SELECT * FROM Customers;
SELECT * FROM Products;

/*Select all the columns
of all the records
in the Customers table:*/
SELECT * FROM Customers;

/*SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Categories;*/
SELECT * FROM Suppliers;

CREATE DATABASE testDB;

DROP DATABASE testDB;

CREATE TABLE Persons(
	PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

CREATE TABLE TestTable AS
SELECT customerName, contactName FROM Customers;

DROP TABLE Shippers;

TRUNCATE TABLE Shippers;

ALTER TABLE Customers ADD Email varchar(255);

ALTER TABLE Customers DROP COLUMN Email;

ALTER TABLE Customers MODIFY COLUMN Email varchar(255);

ALTER TABLE Customers MODIFY COLUMN DateOfBirth year;

ALTER TABLE Persons DROP COLUMN DateOfBirth;

CREATE TABLE Persons (
	ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

ALTER TABLE Persons
MODIFY Age int NOT NULL;

CREATE TABLE Persons (
	ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE(ID)
);

CREATE TABLE Persons (
	ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID, LastName)
);

ALTER TABLE Persons
ADD UNIQUE (ID);

ALTER TABLE Persons
ADD CONSTRAINT UC_Persons UNIQUE (ID, LastName);

ALTER TABLE Persons
DROP INDEX UC_Person;

CREATE TABLE Persons (
	ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

CREATE TABLE Persons (
	ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID, LastName)
);

ALTER TABLE Persons ADD PRIMARY KEY (ID);

ALTER TABLE Persons ADD CONSTRAINT PK_Persons PRIMARY KEY (ID, LastName);

ALTER TABLE Persons DROP PRIMARY KEY;

CREATE TABLE Orders ( 
	OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

CREATE TABLE Orders(
	OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders DROP FOREIGN KEY FK_PersonOrder;

CREATE TABLE Persons (
	ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

CREATE TABLE Persons (
	ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age >= 18 AND City = 'Sandness')
);


ALTER TABLE Persons ADD CHECK (Age >= 18);

ALTER TABLE Persons ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandness');

ALTER TABLE Persons DROP CHK_PersonAge;

CREATE TABLE Persons (
	ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sadness'
);

CREATE TABLE Orders (
	ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT CURRENT_DATE()
);

ALTER TABLE Persons ALTER City SET DEFAULT 'Sandness';

ALTER TABLE Persons ALTER City DROP DEFAULT;

CREATE INDEX idx_lastname ON Persons (LastName);

CREATE INDEX idx_pname ON Persons (LastName, FirstName);

ALTER TABLE Persons DROP INDEX idx_lastname;

ALTER TABLE Persons DROP INDEX idx_pname;

CREATE TABLE Persons ( 
	Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
);

ALTER TABLE Persons AUTO_INCREMENT = 100;

INSERT INTO Persons (FirstName, LastName) VALUES ('Lars', 'Monsen');

SELECT * FROM Orders WHERE OrderDate='2008-11-11';

SELECT * FROM Orders WHERE OrderDate='2008-11-11';

CREATE VIEW [Brazil Customers] AS SELECT CustomerName, ContactName FROM Customers WHERE Country='Brazil';

SELECT * FROM [Brazil Customers];

CREATE VIEW [Products Above Average Price] AS 
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

SELECT * FROM [Products Above Average Price];

CREATE OR REPLACE VIEW [Brazil Customers] AS 
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';

DROP VIEW [Brazil Customers];












