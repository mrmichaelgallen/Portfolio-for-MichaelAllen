CREATE DATABASE dbOregonLibrary

CREATE TABLE BOOK
(
BookID INT Primary Key NOT NULL,
Title varchar(150) NULL,
PublisherName Varchar(150) Foreign Key REFERENCES PUBLISHER (PublisherName) NOT NULL,
)

SELECT * FROM BOOK

CREATE TABLE PUBLISHER
(
PublisherName varchar(150) Primary Key NOT NULL,
[Address] varchar(150) NULL,
Phone Varchar(15)
)

SELECT * FROM PUBLISHER

CREATE TABLE BOOK_AUTHORS
(
BookID INT Foreign Key REFERENCES BOOK (BookID) NOT NULL,
AuthorName varchar(150) Null
)

SELECT * FROM BOOK_AUTHORS

INSERT INTO BOOK_AUTHORS
VALUES 
(1,'F. Scott Fitzgerald'),
(2,'Nathaniel Hawthorne'),
(3,'Mark Twain'),
(4,'John Steinbeck'),
(5,'Harper Lee'),
(6,'J.D. Salinger'),
(7,'John Steinbeck'),
(8,'Zora Neale Hurston'),
(9,'Arthur Miller'),
(10,'Tim O''Brien'),
(11,'Kate Chopin'),
(12,'Edith Wharton'),
(13,'Ray Bradbury'),
(14,'Lorraine Hansberry'),
(15,'Stephen Crane'),
(16,'Sandra Cisneros'),
(17,'Upton Sinclair'),
(18,'John Knowles'),
(19,'Ernest Hemingway'),
(20,'Ayn Rand'),
(21,'Ernest Hemingway'),
(22,'William Faulkner'),
(23,'Alice Walker'),
(24,'Ernest Hemingway'),
(25,'Sue Monk Kidd'),
(26,'Ralph Ellison'),
(27,'Richard Wright'),
(28,'Willa Cather'),
(29,'Frederick Douglass'),
(30,'Toni Morrison'),
(31,'John Hersey'),
(32,'Herman Melville'),
(33,'Ken Kesey'),
(34,'Richard Wright'),
(35,'Rudolfo Anaya'),
(36,'Arthur Miller'),
(37,'Truman Capote'),
(38,'Ernest J. Gaines'),
(39,'Kurt Vonnegut Jr.'),
(40,'Barbara Kingsolver'),
(41,'Toni Morrison'),
(42,'William Faulkner'),
(43,'Mark Twain'),
(44,'Joseph Heller'),
(45,'Chaim Potok'),
(46,'John Steinbeck'),
(47,'Maya Angelou'),
(48,'Henry David Thoreau'),
(49,'Barbara Kingsolver'),
(50,'Herman Melville'),
(51,'James McBride'),
(52,'Stephen Crane'),
(53,'Toni Morrison'),
(54,'Henry James'),
(55,'Pat Frank'),
(56,'Jamaica Kincaid'),
(57,'Jack London'),
(58,'Charles Frazier'),
(59,'Walter Dean Myers'),
(60,'Ernest Hemingway'),
(61,'Ayn Rand'),
(62,'Jon Krakauer'),
(63,'James Fenimore Cooper'),
(64,'John Irving'),
(65,'Tim O''Brien'),
(66,'Cormac McCarthy'),
(67,'Toni Morrison'),
(68,'Esmeralda Santiago'),
(69,'Jhumpa Lahiri'),
(70,'Sherman Alexie'),
(71,'Cormac McCarthy'),
(72,'Leslie Marmon Silko'),
(73,'Mitch Albom'),
(74,'Erin Gruwell'),
(75,'Dalton Trumbo'),
(76,'Conrad Richter'),
(77,'Willa Cather'),
(78,'Karen Hesse'),
(79,'Frank Norris'),
(80,'Sherman Alexie'),
(81,'Cristina Garcia'),
(82,'Julia Alvarez'),
(83,'Malcolm X with Alex Haley'),
(84,'Ernest J. Gaines'),
(85,'Sandra Cisneros'),
(86,'Harriette Anrow'),
(87,'Kaye Gibbons'),
(88,'August Wilson'),
(89,'Ernest J. Gaines'),
(90,'Jeanette Walls'),
(91,'Tim OBrien'),
(92,'Julia Alvarez'),
(93,'Octavia E. Butler'),
(94,'Louisa May Alcott'),
(95,'Tennessee Williams'),
(96,'Michael Dorris'),
(97,'Thornton Wilder'),
(98,'James Baldwin'),
(99,'Langston Hughes'),
(100,'James Baldwin'),
(101,'Michael Allen'),
(102,'Stephen King')


CREATE TABLE LIBRARY_BRANCH
(
BranchID INT Primary Key NOT NULL,
BranchName varchar(150) Null,
[Address] varchar(150) NULL,
)

SELECT * FROM LIBRARY_BRANCH

CREATE TABLE BORROWER
(
CardNo INT Primary Key NOT NULL,
Name varchar(150) Null,
[Address] varchar(150) NULL,
Phone Varchar(15)
)

SELECT * FROM BORROWER

CREATE TABLE BORROWER
(
CardNo INT Primary Key NOT NULL,
Name varchar(150) Null,
[Address] varchar(150) NULL,
Phone Varchar(15)
)

SELECT * FROM BORROWER


CREATE TABLE BOOK_COPIES
(
BookID INT Foreign Key REFERENCES BOOK (BookID) NOT NULL,
BrandID INT Foreign Key REFERENCES LIBRARY_BRANCH (BranchID) NOT NULL,
No_Of_Copies INT NOT Null
)

SELECT * FROM BOOK_COPIES

CREATE TABLE BOOK_LOANS
(
BookID INT Foreign Key REFERENCES BOOK (BookID) NOT NULL,
BrandID INT Foreign Key REFERENCES LIBRARY_BRANCH (BranchID) NOT NULL,
CardNO INT Foreign Key REFERENCES BORROWER (CardNO) NOT NULL,
DateOut DATE NOT NULL,
DateDue DATE NOT NULL
)

-- How many copies of The Lost Tribe are at Sharpstown Library

CREATE PROC Search_TheLostTribeAtSharpstown
AS

	SELECT BranchName, Title, No_Of_Copies 
	FROM LIBRARY_BRANCH AS Branch 
	inner join BOOK_COPIES AS Copy ON Branch.BranchID = Copy.BranchID 
	inner join BOOK ON Copy.BookID = BOOK.BookID
	Where Title = 'The Lost Tribe'
	AND BranchName = 'Sharpstown'

-- How many copies of The Lost Tribe are at each Library

CREATE PROC Search_TheLostTribeAtAllLibraries
AS

	SELECT BranchName, Title, No_Of_Copies 
	FROM LIBRARY_BRANCH AS Branch 
	inner join BOOK_COPIES AS Copy ON Branch.BranchID = Copy.BranchID 
	inner join BOOK ON Copy.BookID = BOOK.BookID
	Where Title = 'The Lost Tribe'

-- Retrieve the names of all borrowers who do not have any books checked out


CREATE PROC Search_BorrowersWithNoBooksCheckedOut
AS

	SELECT *
	FROM BORROWER AS BOR 
	left join BOOK_LOANS AS LOAN ON BOR.CardNo = LOAN.CardNO
	Where LOAN.CardNO IS NULL

-- For each book that is loaned out from "Sharpstown" list DueDate is today, retrieve book title, borrower's name and address

CREATE PROC Search_SharpstownBooksDueToday
AS

	SELECT BRAN.BranchName, BOOK.Title, BOR.Name, BOR.[address], LOAN.DateDue
	FROM BORROWER AS BOR 
	inner join BOOK_LOANS AS LOAN ON BOR.CardNo = LOAN.CardNO
	inner join BOOK ON BOOK.BookID = LOAN.BookID
	inner join LIBRARY_BRANCH AS BRAN ON BRAN.BranchID = LOAN.BranchID 
	Where DateDue = '2015-06-08' AND BRAN.BranchID = '1'

-- For each library branch, retrieve the branch name and the total number of books loaned out from that branch

CREATE PROC Search_NumberOfBooksCheckedOutAtEachLibrary
AS

	SELECT Count(BranchName) AS Total_Books, BRAN.BranchName 
	FROM LIBRARY_BRANCH AS BRAN
	inner join BOOK_LOANS AS LOAN ON BRAN.BranchID = LOAN.BranchID
	Group by Bran.BranchName

-- Retrieve the names, addresses, and numbers of books checked out for all borrowers who have morethan five books checked out

CREATE PROC Search_BorrowersThatHaveMoreThanFiveBooksCheckedOut
AS

	SELECT BOR.Name, BOR.[Address], Count(LOANS.CardNo) AS Total
	FROM BOOK_LOANS AS LOANS 
	inner join BORROWER AS BOR ON BOR.CardNo = LOANS.CardNO
	Group by BOR.Name, BOR.[Address]
	HAVING count(LOANS.CardNO) > 5

-- For each book authored by "Stephen King", retrieve the title, and the number of copies at the "Central" library

CREATE PROC Search_CentralLibraryNumberofCopiesOfStephenKingBooks
AS

	SELECT Author.AuthorName, Book.Title, Branch.BranchName, Num.No_Of_Copies
	FROM BOOK_AUTHORS AS Author
	inner join BOOK ON BOOK.BookID = Author.BookID
	inner join BOOK_COPIES AS NUM ON Author.BookID = NUM.BookID
	inner join LIBRARY_BRANCH AS Branch ON Num.BranchID = Branch.BranchID
	Where Author.AuthorName = 'Stephen King' AND Branch.BranchName = 'Central'

-- Tables for Oregon Library by Michael Allen

SELECT * FROM BOOK
SELECT * FROM BOOK_LOANS
SELECT * FROM BOOK_COPIES
SELECT * FROM BORROWER
SELECT * FROM LIBRARY_BRANCH
SELECT * FROM PUBLISHER
SELECT * FROM BOOK_AUTHORS


-- Stored Procedures #1

Search_TheLostTribeAtSharpstown

-- Stored Procedures #2

Search_TheLostTribeAtAllLibraries

-- Stored Procedures #3

Search_BorrowersWithNoBooksCheckedOut

-- Stored Procedures #4

Search_SharpstownBooksDueToday

-- Stored Procedures #5

Search_NumberOfBooksCheckedOutAtEachLibrary

-- Stored Procedures #6

Search_BorrowersThatHaveMoreThanFiveBooksCheckedOut

-- Stored Procedures #7

Search_CentralLibraryNumberofCopiesOfStephenKingBooks