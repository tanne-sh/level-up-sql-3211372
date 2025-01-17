SELECT *
FROM Books
WHERE Title = 'Dracula';

SELECT Count (Books.Title)
FROM Books
WHERE Books.Title = 'Dracula';

SELECT Count (Books.Title)
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
WHERE Books.Title = 'Dracula'
  AND Loans.ReturnedDate IS NULL;

SELECT 
  (SELECT Count (Books.Title) 
    FROM Books
    WHERE Title = 'Dracula') - 
  (SELECT Count (Books.Title)
    FROM Loans
    JOIN Books ON Loans.BookID = Books.BookID
    WHERE Books.Title = 'Dracula'
    AND Loans.ReturnedDate IS NULL)
AS AvailableCopies;

INSERT INTO Books(Title, Author, Published, Barcode)
VALUES ('Dracula', 'Bram Stoker', '1897', '4819277482'),
('Gulliver’s Travels into Several Remote Nations of the World', 
'Jonathan Swift', '1729', '4899254401');

SELECT *
FROM Books
ORDER BY BookID DESC
LIMIT 5;

INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate)
VALUES (
  (SELECT BookID
   FROM Books
   WHERE Barcode = '2855934983'),
   (SELECT PatronID
   FROM Patrons
   WHERE Email = 'jvaan@wisdompets.com'),
   2022-08-25,
   2022-09-08 
    );

    INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate)
VALUES (
  (SELECT BookID
   FROM Books
   WHERE Barcode = '4043822646'),
   (SELECT PatronID
   FROM Patrons
   WHERE Email = 'jvaan@wisdompets.com'),
   2022-08-25,
   2022-09-08 
    );

SELECT *
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
WHERE PatronID = (
  SELECT PatronID
  FROM Patrons
  WHERE Email = 'jvaan@wisdompets.com');

SELECT Loans.DueDate, Books.Title, Patrons.FirstName, Patrons.Email
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
JOIN Patrons ON Loans.PatronID = Patrons.PatronID
WHERE Loans.DueDate = '2022-07-13'
AND Loans.ReturnedDate IS NULL;