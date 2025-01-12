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