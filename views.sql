--views
CREATE VIEW BookInfo AS (
    SELECT Books.title, Books.year, author, language
    FROM WrittenBy FULL OUTER JOIN Books
    ON ((Books.title = WrittenBy.title) AND (Books.year = WrittenBy.year)));


CREATE VIEW FullInfo AS (
    SELECT BookInfo.title, BookInfo.year, author, language, shelf AS location
    FROM OnShelf FULL OUTER JOIN BookInfo
    ON ((BookInfo.title = OnShelf.title) AND (BookInfo.year = OnShelf.year)));
 
