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