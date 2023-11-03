-- Query Employee Names: 
    -- Write a SQL query to retrieve the names of all employees.


-- Table Creation

CREATE TABLE employee(
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Job_position VARCHAR(50) NOT NULL,
    Age INT,
    Salary REAL,
    Join_date DATE,
    Years_of_Experience INT NOT NULL
);

-- Inserting Values
INSERT INTO employee(ID, Name, Job_position, Age, Salary, Join_date, Years_of_Experience) values 
    (02, 'Suren', 'Blockchain Developer', 21, 4500, '2015-08-14', 0);

-- -- Delete a record
-- DELETE FROM employee WHERE ID=02;

-- Select All Employee Names
SELECT * FROM employee;

-- Calculate years of experience
    -- Date Part take field in first arg and source as second arg which is the funtions.
SELECT Name, Job_position, Age, Salary, Join_date, DATE_PART('year', CURRENT_DATE) - DATE_PART('year', Join_date) AS Years_of_Experience FROM employee;
