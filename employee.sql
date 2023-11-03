-- Query Employee Names: 
    -- Write a SQL query to retrieve the names of all employees.


-- Table Creation

CREATE TABLE employee_dat(
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Job_position VARCHAR(50) NOT NULL,
    Age INT,
    Monthly_salary REAL,
    Yearly_salary REAL,
    Join_date DATE,
    Years_of_Experience INT NOT NULL
);

-- Inserting Values
INSERT INTO employee_dat(ID, Name, Job_position, Age, Monthly_salary, Yearly_salary, Join_date, Years_of_Experience) values 
    (01, 'Suren', 'Machine Learning Engineer', 21, 0, 45000, '2015-08-14', 0),
    (02, 'Ravi', 'Software Engineer', 24, 0, 40000, '2015-10-19', 0),
    (03, 'Maria', 'Blockchain Engineer', 21, 0, 42000, '2015-11-16', 0),
    (04, 'John', 'Product Manager', 27, 0, 50000, '2015-12-17', 0),
    (05, 'Leo', 'HR', 28, 0, 35000, '2017-09-21', 0);

-- -- Delete a record
-- DELETE FROM employee WHERE ID=02;

-- Select All Employee Names
SELECT * FROM employee_dat;

-- Calculate years of experience
    -- Date Part take field in first arg and source as second arg which is the funtions.
SELECT ID, Name, Job_position, Age, (Yearly_salary/12) AS Monthly_salary ,Yearly_salary, Join_date, DATE_PART('year', CURRENT_DATE) - DATE_PART('year', Join_date) AS Years_of_Experience FROM employee_dat;
