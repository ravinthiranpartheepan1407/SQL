-- Take a look at the following table called phones.

-- Write a query that will select the name of each phone and calculate the total revenue for each phone (price X units_sold)

-- Rename this calculated column to revenue

-- +-------------+--------------+-------+------------+
-- | name        | manufacturer | price | units_sold |
-- +-------------+--------------+-------+------------+
-- | N1280       | Nokia        | 199   | 1925       |
-- +-------------+--------------+-------+------------+
-- | Iphone 4    | Apple        | 399   | 9436       |
-- +-------------+--------------+-------+------------+
-- | Galaxy S    | Samsung      | 299   | 2359       |
-- +-------------+--------------+-------+------------+
-- | S5620 Monte | Samsung      | 250   | 2385       |
-- +-------------+--------------+-------+------------+
-- | N8          | Nokia        | 150   | 7543       |
-- +-------------+--------------+-------+------------+
-- | Droid       | Motorola     | 150   | 8395       |
-- +-------------+--------------+-------+------------+
-- | Wave S8500  | Samsung      | 175   | 9259       |
-- +-------------+--------------+-------+------------+

CREATE TABLE mobiles(
    name VARCHAR(50),
    manufacturer VARCHAR(50),
    price INTEGER,
    units_sold INTEGER
);

INSERT INTO mobiles(
    name, 
    manufacturer, 
    price, 
    units_sold
) VALUES
    ('N1280','Nokia',199,1925),
    ('S5620 Monte','Samsung',250,2385 ),
    ('N8','Nokia',150,7543),
    ('Droid','Motorola',150,8395),
    ('Wave S8500','Samsung',175,9259);

SELECT * from mobiles;

SELECT name, price * units_sold AS revenue FROM mobiles;

-- Case2: Returning manufacturer name along with name using string ops (Pipe op: concat)

SELECT name || ' : ' || UPPER(manufacturer) AS series_with_brand, price * units_sold AS revenue from mobiles;

-- Cannot reference COLUMN alias "revenue" to WHERE clause.

-- Remember: First Exec -> FROM table, 2nd Exec -> WHERE Condition, 3rd Exec -> SELECT params 

-- Filter manufacturers with revenue > 1000000
SELECT manufacturer, price * units_sold AS revenue FROM mobiles WHERE price * units_sold > 1000000;

-- Filter products from manufacturers
SELECT name FROM mobiles WHERE manufacturer='Nokia';

-- Check if manfacturer SAMSUNG in the record
-- Exists: Used to check if the element is already there
-- 1: Returns true if the element is present
SELECT EXISTS(SELECT 1 FROM mobiles WHERE manufacturer='Samsung')AS Is_Present;


