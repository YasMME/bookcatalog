--fresh DB
DROP OWNED BY bookuser CASCADE;

--Current setup does not allow multiple authors of the same name,
--to avoid needing compound primary key
--Authors(_name, birthyear, deathyear)
CREATE TABLE Authors (
    name TEXT NOT NULL PRIMARY KEY,
    birthyear SMALLINT NOT NULL,
    deathyear SMALLINT
);

--Publishers(_name, city, country)
CREATE TABLE Publishers (
    name TEXT NOT NULL PRIMARY KEY,
    city TEXT NOT NULL,
    country TEXT NOT NULL
);

--Books(_title, author_, year, publisher)
CREATE TABLE Books (
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    year SMALLINT NOT NULL,
    publisher TEXT NOT NULL,
    FOREIGN KEY (author) REFERENCES Authors(name),
    FOREIGN KEY (publisher) REFERENCES Publishers(name),
    PRIMARY KEY (title, author, year)
);

--Locations(_name)
CREATE TABLE Locations (
    name TEXT PRIMARY KEY
);

--OnShelf(_title, shelf)
CREATE TABLE OnShelf (
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    year SMALLINT NOT NULL,
    shelf TEXT NOT NULL,
    FOREIGN KEY (title, author, year) REFERENCES Books(title, author, year),
    FOREIGN KEY (shelf) REFERENCES Locations(name) 
);
