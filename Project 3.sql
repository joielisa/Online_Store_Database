--Create Tables

USE OnlineClothesStore  --this is the name of the database I created
CREATE TABLE Customers
(
	CustomerID VARCHAR(250) PRIMARY KEY,
	CustomerName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL UNIQUE
)

USE OnlineClothesStore
DROP TABLE IF EXISTS Products
CREATE TABLE Products
(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(250) NOT NULL UNIQUE,
	ProductBrand VARCHAR(250)NOT NULL,
	Price DECIMAL(4,2) NOT NULL,
	QuantityInStock INT NOT NULL

)

USE OnlineClothesStore

CREATE TABLE Orders
(
	CustomerID VARCHAR(250) NOT NULL, 
	ProductID INT NOT NULL, --REFERENCES PRODUCTS(ProductID),
	OrderDate DATETIME
	CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)
--Now that the tables are made, I am going to populate the table with data

INSERT INTO Customers
	VALUES ('A11', 'Jennifer Holmes', '435 Connecticut Street, USA','jholmes1234511@techemail.com'),
		   ('A12', 'Jessica Harris', '2054 Highway 199, USA', 'jess_harri@nowhere.com'),
		   ('A13', 'David Smith', '4188 Washington Street, USA','luvsumds@yahoo.com')

INSERT INTO Products
	VALUES (001, 'Black Tennis Boots', 'TennisBrand',79.99,100),
		   (002, 'Felsam Black Hoodie', 'Felsam', 49.95,6),
		   (003, 'Felsam Tank', 'Felsam',15.00,8)

--Now I need to check if the company has a customer called “Jonathan Rivers” registered

SELECT 
	*
FROM 
	OnlineClothesStore..Customers
WHERE 
	CustomerName = 'Jonathan Rivers'

--Now I need to retrive the email of Jennifer Holmes

SELECT 
	CustomerName, Email
FROM
	OnlineClothesStore..Customers
WHERE 
	CustomerName = 'Jennifer Holmes';

-- Now I need to populate the Orders table

INSERT INTO Orders
	VALUES ('A11', 3, '20201123 00:00:00'),
		   ('A11', 2, '20201023 00:00:00'),
		   ('A13', 2, '20220508 13:22:42'),
		   ('A11', 1, '20201023 00:00:00'),
		   ('A12', 3, '20211223 09:00:00');

-- a query to retrieve all orders for a specific customer

SELECT
	OrderDate
FROM 
	OnlineClothesStore..Orders
WHERE 
	CustomerID = 'A11'
GROUP BY 
	OrderDate;

-- update the quantity of a product in stock.

UPDATE Products
SET
	QuantityInStock = 16
WHERE 
	ProductID = 2
 

