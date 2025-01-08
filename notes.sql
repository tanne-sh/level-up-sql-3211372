-- This file is intended for notes
-- and for demonstrating how to work
-- with SQLite in Codespaces.

-- These two statements operate on the 
-- restaurant.db SQLite database.
SELECT * FROM Dishes;
SELECT * FROM Customers;
SELECT FirstName, LastName, Email
FROM Customers
ORDER BY LastName;
CREATE TABLE AnniversaryAttendees (
CustomerID INTEGER,
PartySize INTEGER
);
CREATE TABLE AnniverAttend (
CustomerID INTEGER,
PartySize INTEGER
);

DROP TABLE AnniversaryAttendees;

SELECT Type, Name, Price, Description
FROM Dishes 
ORDER BY Price;

SELECT Type, Name, Price, Description
FROM Dishes 
WHERE Type = 'Appetizer' OR Type = 'Beverage'
ORDER BY Type;

SELECT Type, Name, Price, Description
FROM Dishes 
WHERE Type != 'Beverage'
ORDER BY Type;

INSERT INTO Customers ( FirstName, LastName, Email, 
Address, City, State, Phone, Birthday)
VALUES ( 'Anna', 'Smith', 'asmith@samoca.org','479 Lapis Dr.', 
'Memphis', 'TN', '555) 555-1212', '1973-07-21');

SELECT * FROM Customers ORDER BY CustomerID DESC;