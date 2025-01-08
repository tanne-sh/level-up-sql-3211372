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