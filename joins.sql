-- Product Table
-- ProductID	ProductName	CategoryID	Price
-- 1	        Acrylic	        1	    1.8
-- 2	        Matte	        3	    1.9
-- 3	        Glossy      	2	    1.0

-- Category Table
-- CategoryID	CategoryName	Description
-- 1	        Stationary	    Printing, Papers, Stickers
-- 2	        Sheets  	    Book, Hardcover
-- 3	        Print     	    Softcover, Hardcover

-- Join Category Name with Product Table

CREATE TABLE product(
    ProductID INT PRIMARY KEY NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    CategoryID INT NOT NULL,
    Price DECIMAL(3,2) -- DECIMAL(total_digit, digit after decimal)
);

CREATE TABLE ProductCategory(
    CategoryID INT NOT NULL,
    CategoryName VARCHAR(50) NOT NULL,
    Description VARCHAR(200) NOT NULL
);

INSERT INTO product(ProductID,ProductName,CategoryID,Price) VALUES
    (1,'Acrylic Sheet',1,1.80),
    (2,'Glossy Sheet',3,1.09),
    (3,'Matte Sheet',2,1.00),
    (4,'Acrylic Sheet Premium',4,3.80);

INSERT INTO ProductCategory(CategoryID,CategoryName,Description) VALUES
    (1,'Stationary','Printing, Papers, Stickers'),
    (2,'Sheets','Book, Hardcover'),
    (3,'Print','Softcover, Hardcover');

SELECT * FROM product;
SELECT * FROM ProductCategory;


-- INNER JOIN: Returns only the matching values from both tables
SELECT ProductID, ProductName, CategoryName, Price From product INNER JOIN ProductCategory ON product.CategoryID = ProductCategory.CategoryID;

-- LEFT JOIN or LEFT OUTER JOIN: Returns all records from the left table and the matching records from right table
SELECT product.ProductName, ProductCategory.CategoryID FROM product LEFT JOIN ProductCategory on product.ProductID = ProductCategory.CategoryID ORDER BY product.CategoryID;

-- RIGHT JOIN or RIGHT OUTER JOIN: Returns all keywords from right table and matching elements from left table
SELECT product.ProductName, ProductCategory.Description FROM product RIGHT OUTER JOIN ProductCategory on product.ProductID = ProductCategory.CategoryID ORDER BY product.ProductID;

-- SELF JOIN: 

-- FULL JOIN or FULL OUTER JOIN: Returns all records when there is match found in two tables.
-- FULL JOIN: SELECT columns FROM TABLE FULL OUTER JOIN TABLE on COLUMN.1 = COLUMN.2 CONDITION (ORDER BY, WHERE)
SELECT product.ProductName, ProductCategory.CategoryName, product.Price FROM product FULL OUTER JOIN ProductCategory ON product.ProductID = ProductCategory.CategoryID ORDER BY product.CategoryID;