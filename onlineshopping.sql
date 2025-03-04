CREATE DATABASE Onlineshopping;
USE Onlineshopping;

CREATE TABLE Customer(
CustomerID INT IDENTITY PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL,
Address VARCHAR(200) NOT NULL,
);
CREATE TABLE Orders(
OrderID INT IDENTITY PRIMARY KEY,
CustomerID INT NOT NULL,
OrderDate DATETIME DEFAULT GETUTCDATE(),
TotalAmount DECIMAL(10,2) NOT NULL,
Status VARCHAR(20)NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE Product (
ProductID INT IDENTITY PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
    Category VARCHAR(100),
    Description VARCHAR(100),
    Price DECIMAL(10,2) NOT NULL,
	);

	CREATE TABLE Supplier (
    SupplierID INT IDENTITY PRIMARY KEY ,
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100) NOT NULL,
);

CREATE TABLE Supply (
    SupplierID INT,
    ProductID INT,
    PRIMARY KEY (SupplierID, ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) ,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ,
);
CREATE TABLE OrderDetails (
    OrderDetailID INT  IDENTITY PRIMARY KEY ,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ,
);
ALTER TABLE Product
ADD Rating INT DEFAULT 0;

SELECT* from Product;

ALTER TABLE Product 
ADD CONSTRAINT DF_PRODUCT_CATEGORY DEFAULT 'new' FOR category;

ALTER TABLE Product 
DROP COLUMN Rating;

UPDATE Orders 
SET OrderDate = GETUTCDATE() 
WHERE OrderID > 0;

DELETE FROM Product 
WHERE Name IS NOT NULL 
AND Name <> 'Null';




