-- Union:
    -- Combines the result of two or more SELECT statements
    -- SELECT with UNION must have same no.of columns
    -- Columns should also have same data types
    -- Columns should be in same order

-- CREATE TABLE EmployeeProfiles(
--     EmployeeID INT NOT NULL,
--     EmployeeName VARCHAR(50) NOT NULL,
--     EmployeePos VARCHAR(50) NOT NULL,
--     Branch VARCHAR(50) NOT NULL,
--     EmpTicket INT NOT NULL,
--     Salary INT NOT NULL
-- );

-- CREATE TABLE TicketLogs(
--     TicketID INT NOT NULL,
--     TicketName VARCHAR(1000) NOT NULL,
--     TicketDue DATE,
--     EmployeeID INT NOT NULL
-- );

-- INSERT INTO EmployeeProfiles(EmployeeID, EmployeeName, EmployeePos, Branch, EmpTicket, Salary) VALUES
--     (01,'Suren','Software Developer', 'IT',10,20000),
--     (02,'Ravi','Machine Learning Engineer', 'AI',11,25000),
--     (03,'Rooney','Blockchain Developer', 'Web3',12,40000),
--     (04,'Mariia','Data Scientist','AI',11,25000);

-- INSERT INTO TicketLogs(TicketID, TicketName, TicketDue, EmployeeID) VALUES
--     (10,'Rest API GET Fix','2023-11-27',01),
--     (10,'Rest API POST Fix','2023-11-27',01),
--     (11,'KNN Regression Model','2023-12-14',02),
--     (11,'Naive Bayes Model','2023-11-18',02),
--     (12,'Web 3 Wallet Integration','2023-12-27',03),
--     (11,'DT Regressor','2023-12-07',04),
--     (11,'Convolution Neural Network Model','2023-12-21',04);

SELECT * FROM EmployeeProfiles;
SELECT * FROM TicketLogs;

-- Union
SELECT EmployeeID FROM EmployeeProfiles UNION SELECT TicketID, TicketDue FROM TicketLogs WHERE EmployeeProfiles.EmployeeID = TicketLogs.EmployeeID;
-- ORDER BY TicketDue
SELECT EmployeeProfiles.EmployeeName FROM EmployeeProfiles FULL OUTER JOIN TicketLogs ON Emp
