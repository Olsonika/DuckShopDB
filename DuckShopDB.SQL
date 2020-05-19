DROP DATABASE IF EXISTS duckshop;
CREATE DATABASE duckshop;
USE duckshop;

CREATE TABLE Users (
    UserID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Username varchar(30),
    Password varchar(100) NOT NULL,
    PhoneNumber varchar(15),
    Email varchar(100),
    FirstName varchar(255),
    LastName varchar(255),
    Street varchar(100),
    City varchar(100),
    Country varchar(50)
);

CREATE TABLE Product (
    ProductID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductName varchar(50) NOT NULL,
    Price int NOT NULL,
    Descrption varchar(255),
    ProductPhoto LONGBLOB,
    code varchar(10)
);

CREATE TABLE Orders (
    OrderID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserID int NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    TotalPrice varchar(255),
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Company (
    CompanyName varchar(50) NOT NULL PRIMARY KEY,
    Owner varchar(100),
    About varchar(255),
    Logo LONGBLOB NULL
);

CREATE TABLE News (
    NewsID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Article varchar(255),
    PhotoNews LONGBLOB NULL,
    NewsDate date
);

CREATE TABLE ProductsInOrder (
    UserID int NOT NULL,
    OrderID int NOT NULL,
    CONSTRAINT PK_ProductsInOrder PRIMARY KEY (UserID, OrderID),
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    ProductID int NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

INSERT INTO Company (CompanyName, Owner, About)
VALUES ('Mother Duckin Shop', 'Duck Ducked', 'We are amazing, so but the duck!');

INSERT INTO News (Article)
VALUES ('Today we got a lot of ducks, so check them out!');

INSERT INTO Users (Password, PhoneNumber, Email, FirstName, LastName, Street, City, Country)
VALUES ('supersecure', '123456789', 'duck@duck.com', 'Arnold', 'Stallone', 'Armagedon 12', 'Esbjerg', 'Denmark');

INSERT INTO Orders (UserID, TotalPrice)
VALUES ('1', '987');

INSERT INTO Product (ProductName, Price, Descrption, code)
VALUES ('Duck', '120', 'Super duck!', 'D12');

INSERT INTO ProductsInOrder (OrderID, UserID, ProductID)
VALUES ('1', '1', '1')

