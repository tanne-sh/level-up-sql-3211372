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

SELECT CustomerID, FirstName, LastName, Email, Address
FROM Customers 
WHERE FirstName = 'Taylor'
AND LastName = 'Jenkins';

UPDATE Customers
SET Address = '74 Pine St.',
    City = 'New York',
    State = 'NY'
WHERE CustomerID = 26;

SELECT *
FROM Customers
WHERE CustomerID = 26;

SELECT * FROM Reservations
JOIN Customers ON Reservations.CustomerID = Customers.CustomerID
WHERE Customers.FirstName = 'Norby'
AND Reservations.Date > '2022-07-24';

DELETE FROM Reservations 
WHERE ReservationID = '2000';

-- or
UPDATE Reservations
SET Date = NULL WHERE ReservationID = 2000;

INSERT INTO AnniverAttend
(CustomerID, PartySize)
VALUES(
(SELECT CustomerID
FROM Customers
WHERE Email = 'atapley2j@kinetecoinc.com'), 4
);

SELECT * FROM AnniverAttend;

