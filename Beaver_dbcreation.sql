/* Team Beaver : Yating Lu & Tu Nguyen*/
CREATE DATABASE BeaverStoreDb;
GO

USE BeaverStoreDb;
GO

/*Create the customer and order tables */
CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Street varchar (50) NOT NULL,
  City varchar (50) NOT NULL,
  State varchar (50) NOT NULL,
  Country varchar (50) NOT NULL);

  CREATE TABLE Orders (
  OrderID bigint NOT NULL PRIMARY KEY,
  CustomerID bigint NOT NULL,
  ProductID bigint NOT NULL,
  OrderDate DATE NOT NULL,
  OrderAmount numeric NOT NULL);

  CREATE TABLE Product (
  ProductID bigint NOT NULL PRIMARY KEY,
  ProductName varchar (50) NOT NULL,
  ProductCategory varchar (50) NOT NULL);

  CREATE TABLE OrderDetails (
  OrderID bigint NOT NULL,
  ProductID bigint NOT NULL,
  UnitPrice numeric NOT NULL,
  Quantity numeric NOT NULL,
  TotalDue numeric NOT NULL);

  /* Create the relationship: the first FK in Orders */
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customer 
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);
GO

/* create the relationship: the second FK in orders */
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
GO

/* create the relationship: the first FK in OrderDetails */
ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);
GO

/* create the relationship: the second FK in OrderDetails */
ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetails_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
GO

/* Add Customer Information */
INSERT INTO Customer(CustomerID, FirstName, LastName, Street, City, State, Country) VALUES 
(1, 'Jason', 'Lee' , 'Lucky St', 'Georgetown', 'MA', 'USA'),
(2, 'Evan', 'Lehrman', 'Brandon St', 'Boston', 'MA',  'USA'),
(3, 'Yating', 'Lu', 'Maple St', 'Hanoi','NULL', 'Vietnam'),
(4, 'Erica', 'Fishberg', 'Gordon St', 'Beijing City', 'NULL', 'China'),
(5, 'Jamie', 'Traverso', 'Pine Ave','Auburn', 'AL','USA'),
(6, 'Kyle', 'Waldron', 'Bryant St','Staten Island', 'NY', 'USA'),
(7, 'Nadira', 'Zahiruddin', 'Main St','Shenzhen', 'NULL', 'China'),
(8, 'Justin', 'Lee', 'Pinebank St', 'Newton', 'MA', 'USA' ),
(9, 'Christine', 'Lee', 'Minh Khai St','Hue', 'NULL', 'Vietnam'),
(10, 'Abbygail', 'Sardjono', 'Welleseley St','Church Hill', 'TX', 'USA');

/* Add Product Information */
INSERT INTO Product (ProductID, ProductCategory, ProductName) VALUES
(01, 'Beverage', 'Pepsi'),
(02, 'Beverage', 'Water'),
(03, 'Cooked Food', 'Ham Swiss'),
(04, 'Cooked Food', 'Salad'),
(05, 'Snack', 'Chips'),
(06, 'Snack', 'Chocolate'),
(07, 'Snack', 'Moon Cake'),
(08, 'Snack', 'Spicy Stick'),
(09, 'Beverage', 'Soymilk'),
(10, 'Frozen Desserts', 'Green Tea Ice Cream');

/* Add Order Information */
INSERT INTO Orders(CustomerID, ProductID, OrderID, OrderAmount, OrderDate) VALUES
(1, 01, 001, '18.90', '02-09-2013'),
(2, 02, 002, '12.50', '05-18-2013'),
(3, 03, 003, '23.00', '08-22-2014'),
(4, 04, 004, '19.90', '12-09-2014'),
(5, 05, 005, '13.50', '12-13-2014'),
(6, 06, 006, '25.00', '12-22-2014'),
(7, 07, 007, '20.90', '02-09-2015'),
(8, 08, 008, '24.50', '05-18-2015'),
(9, 09, 009, '25.00', '03-22-2016'),
(10, 10, 010, '16.90', '02-09-2016'),
(2, 10, 011, '10.50', '05-18-2016'),
(6, 05, 012, '20.00', '08-22-2016');



/* Add OrderDetails Information */
INSERT INTO OrderDetails(OrderID, ProductID, UnitPrice, Quantity, TotalDue) VALUES
(001, 01, '5.5','2', '20.5'),
(002, 02, '5.5','2', '10.1'),
(003, 03, '2.5','3', '30.1'),
(004, 04, '8.5','1', '34.2'),
(005, 05, '8.5','2', '23.2'),
(006, 06, '10.5', '3', '26.1'),
(007, 07, '2.5','2', '22.15'),
(008, 08, '5.5','3', '16'),
(009, 09, '2.5','2', '8.15'),
(010, 10, '2.5','1', '8.15'),
(011, 01, '5.5','2', '10.5'),
(012, 02, '5.5','3', '16.5'),
(001, 03, '5.5','1', '5.5'),
(002, 04, '2.5','2', '6.1');
