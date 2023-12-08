-- SALES AND REVENUE ANALYSIS

------------------------------------------------------------------------------------------------------------------------------------

-- Design a database for a retail company to manage sales transactions, customers, and products. 
-- Create SQL queries to analyze sales trends, customer purchasing behavior, and revenue performance.

-- SAMPLE CUSTOMER DATA

-- | CustomerID | FirstName | LastName | Email                | Phone         |
-- |------------|-----------|----------|----------------------|---------------|
-- | 1          | John      | Doe      | john.doe@email.com   | 123-456-7890  |
-- | 2          | Jane      | Smith    | jane.smith@email.com | 987-654-3210  |

-- SAMPLE PRODUCTS DATA

-- | ProductID | ProductName      | Price |
-- |-----------|------------------|-------|
-- | 101       | Laptop           | 800   |
-- | 102       | Smartphone       | 500   |
-- | 103       | Headphones       | 50    |

-- SAMPLE SALES DATA

-- | SaleID | CustomerID | ProductID | SaleDate            | Quantity |
-- |--------|------------|-----------|---------------------|----------|
-- | 1      | 1          | 101       | 2023-01-01 10:00:00 | 2        |
-- | 2      | 2          | 102       | 2023-01-02 14:30:00 | 1        |
-- | 3      | 1          | 103       | 2023-01-03 12:45:00 | 3        |

-- SAMPLE REVENUE DATA

-- | RevenueID | SaleID | TotalAmount |
-- |-----------|--------|-------------|
-- | 1         | 1      | 1600        |
-- | 2         | 2      | 500         |
-- | 3         | 3      | 150         |

------------------------------------------------------------------------------------------------------------------------------------

-- 1. Design a database for a retail company to manage customers.
CREATE TABLE CustomerData(
    CustomerID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50),
    PHONE INT
);

-- 2. Design a database for a retail company to manage products.
CREATE TABLE ProductsData(
    ProductID INT NOT NULL,
    ProductName VARCHAR(200),
    Price REAL
);

-- 3. Design a database for a retail company to manage sales transactions.
CREATE TABLE SalesData(
    SaleID INT NOT NULL PRIMARY KEY,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    SaleDate DATE NOT NULL,
    Quantity INT NOT NULL
);

SELECT floor(random()*10+1)::INT as Random;

Random Funtion Creation: Method 2
CREATE OR REPLACE FUNCTION randomGen(low INT, high INT)
    RETURNS INT AS
$$
BEGIN
    RETURN FLOOR(random()*(high-low+1)+low);
END;
$$ LANGUAGE 'plpgsql' STRICT;

INSERT INTO CustomerData(
    CustomerID,
    FirstName,
    LastName,
    Email,
    Phone
) VALUES
    (floor(random()*10+1)::INT, 'Suren', 'Ravi', 'suren@gmail.com', 267789),
    (floor(random()*10+1)::INT, 'Ravi', 'Suren', 'ravi@gmail.com', 2677769),
    (floor(random()*10+1)::INT, 'Watney', 'Mark', 'watney@gmail.com', 233789),
    (floor(random()*10+1)::INT, 'John', 'Mark', 'john@gmail.com', 244789);

SELECT * FROM CustomerData;

INSERT INTO ProductsData(
    ProductID,
    ProductName,
    Price
) VALUES
    (randomGen(0,100),'Vinyl sticker',30),
    (randomGen(0,100),'Acrylic sticker',50),
    (randomGen(0,100),'Vinyl sticker',30),
    (randomGen(0,100),'Glossy sheet',80);

SELECT * FROM ProductsData;

-- Generating Random Sales ID

CREATE OR REPLACE FUNCTION genSaleID(high INT,step INT)
    RETURNS INT AS
$$
BEGIN
    RETURN FLOOR(random()*high+step);
END;
$$ LANGUAGE 'plpgsql' STRICT;

-- Generating Random Sales Date between '2023-12-01 to 2023-12-08

CREATE OR REPLACE FUNCTION genSaleDate(startDate DATE, endDate DATE)
    RETURNS DATE AS
$$
BEGIN
    RETURN DATE();
END;
$$ LANGUAGE 'plpgsql' STRICT;

-- Generating Random Quantity Values

CREATE OR REPLACE FUNCTION genQuantity(val int, step int)
    RETURNS INT AS
$$
BEGIN
    RETURN FLOOR(random()*val+step);
END;
$$ LANGUAGE 'plpgsql' STRICT;


INSERT INTO SalesData(
    SaleID,
    CustomerID,
    ProductID,
    SaleDate,
    Quantity
) VALUES
    (genSaleID(50,1),CustomerData.CustomerID,ProductsData.ProductID,genSaleDate('2023-12-1','2023-12-8'),genQuantity(10,1));

-- SELECT * FROM SalesData;
