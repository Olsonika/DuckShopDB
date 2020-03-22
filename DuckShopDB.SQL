DROP DATABASE IF EXISTS DuckShopDB;
CREATE DATABASE DuckShopDB;
USE DuckShopDB;

CREATE TABLE Users (
    UserID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Password varchar(15),
    PhoneNumber varchar(15),
    Email varchar(100) NOT NULL,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
    Street varchar(100) NOT NULL,
    City varchar(100) NOT NULL,
    Country varchar(50) NOT NULL
);

CREATE TABLE Product (
    ProductID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductName varchar(50) NOT NULL,
    Price int NOT NULL,
    Descrption varchar(255),
    ProductPhoto LONGBLOB NOT NULL,
    Category varchar(255)
);

CREATE TABLE Orders (
    OrderID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserID int NOT NULL,
    ProductID int NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    TotalPrice varchar(255),
    OrderDate date
);

CREATE TABLE Company (
    CompanyName varchar(50) NOT NULL PRIMARY KEY,
    Owner varchar(100),
    About varchar(255),
    Logo LONGBLOB NOT NULL
);

CREATE TABLE News (
    NewsID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Article varchar(255),
    PhotoNews LONGBLOB NOT NULL,
    NewsDate date
);

CREATE TABLE ProductsInOrder (
    UserID int NOT NULL,
    OrderID int NOT NULL,
    CONSTRAINT PK_ProductsInOrder PRIMARY KEY (UserID, OrderID),
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
)