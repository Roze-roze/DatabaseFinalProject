-- Create Database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Table: Authors
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthYear YEAR
);

-- Table: Categories
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

-- Table: Books
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    CategoryID INT,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublishedYear YEAR,
    CopiesAvailable INT DEFAULT 1,
    CONSTRAINT fk_Category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Table: Members
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE DEFAULT CURRENT_DATE
);

-- Table: Borrowings
CREATE TABLE Borrowings (
    BorrowingID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    BorrowDate DATE DEFAULT CURRENT_DATE,
    ReturnDate DATE,
    CONSTRAINT fk_Book FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT fk_Member FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Table: BookAuthors (Many-to-Many between Books and Authors)
CREATE TABLE BookAuthors (
    BookID INT NOT NULL,
    AuthorID INT NOT NULL,
    PRIMARY KEY (BookID, AuthorID),
    CONSTRAINT fk_BookAuthor_Book FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT fk_BookAuthor_Author FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
