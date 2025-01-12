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

SELECT * FROM Customers;

SELECT * FROM Reservations;

SELECT Customers.FirstName, Customers.LastName, Reservations.Date,
Reservations.PartySize
FROM Reservations
JOIN Customers ON Customers.CustomerID = Reservations.CustomerID
WHERE Customers.LastName LIKE 'St%'
AND PartySize = 4
ORDER BY Reservations.Date DESC;

SELECT * 
FROM Customers
WHERE Email = 'smac@kinetecoinc.com';

INSERT INTO Customers
(FirstName, LastName, Email, Phone) VALUES
('Sam', 'McAdams', 'smac@kinetecoinc.com', '(555)-125-125-33');

SELECT * 
FROM Customers
WHERE Email = 'smac@kinetecoinc.com';

INSERT INTO Reservations
(CustomerID, Date, PartySize) VALUES
(102, '2022-08-12 18:00', 5);

SELECT Customers.FirstName, Customers.LastName, Customers.Email, Reservations.Date, 
Reservations.PartySize
FROM Customers
JOIN Reservations ON Customers.CustomerID = Reservations.CustomerID
WHERE Email = 'smac@kinetecoinc.com';

SELECT CustomerID, FirstName, LastName, Phone
FROM Customers
WHERE Address = '6939 Elka Place' AND LastName = 'Hundey';

INSERT INTO Orders (CustomerID, OrderDate)
VALUES (70, '2022-09-22 14:00:00')

SELECT *
FROM Orders
WHERE CustomerID = 70
ORDER BY OrderDate DESC;

INSERT INTO OrdersDishes (OrderID,DishID) VALUES
(1001, (SELECT DishID FROM Dishes WHERE Name = 'House Salad')),
(1001, (SELECT DishID FROM Dishes WHERE Name = 'Mini Cheeseburgers')),
(1001, (SELECT DishID FROM Dishes WHERE Name = 'Tropical Blue Smoothie'));

SELECT *
FROM Dishes
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID 
WHERE OrdersDishes.DishID = 1001;

SELECT SUM(Dishes.Price)
FROM Dishes
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID
WHERE OrdersDishes.OrderID = 1001;

SELECT DishID
