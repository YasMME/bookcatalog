--fresh DB
DROP OWNED BY bookuser CASCADE;

--Current setup does not allow multiple authors of the same name,
--to avoid needing compound primary key
--Authors(_name, birthyear, deathyear)
CREATE TABLE Authors (
    name TEXT NOT NULL PRIMARY KEY,
    birthyear SMALLINT,
    deathyear SMALLINT
);

--only allows 1 book per year with a title
--Books(_title, year_, language)
CREATE TABLE Books (
    title TEXT NOT NULL,
    year SMALLINT NOT NULL,
    language TEXT, 
    PRIMARY KEY (title, year)
);

--Locations(_name)
CREATE TABLE Locations (
    name TEXT PRIMARY KEY
);

--WrittenBy(_title, year, author_)
--allows multiple authors for the same book
CREATE TABLE WrittenBy (
    title TEXT NOT NULL,
    year SMALLINT NOT NULL,
    author TEXT NOT NULL,
    FOREIGN KEY (title, year) REFERENCES Books(title, year),
    FOREIGN KEY (author) REFERENCES Authors(name),
    PRIMARY KEY (title, year, author)
);

--OnShelf(_title, year_, shelf)
--a book can only be in one location
CREATE TABLE OnShelf (
    title TEXT NOT NULL,
    year SMALLINT NOT NULL,
    shelf TEXT NOT NULL,
    PRIMARY KEY (title, year)
);
