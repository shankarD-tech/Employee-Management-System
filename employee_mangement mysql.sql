CREATE DATABASE Employee_Management;
USE Employee_Management;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    designation VARCHAR(50),
    salary DECIMAL(10,2),
    phone_number VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');
INSERT INTO Employees VALUES
(101, 'John', 'Manager', 60000, '9876543210', 1),
(102, 'David', 'Developer', 50000, '9876543211', 2),
(103, 'Priya', 'Accountant', 45000, '9876543212', 3);
SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT Employees.employee_id,
       Employees.employee_name,
       Employees.designation,
       Employees.salary,
       Departments.department_name
FROM Employees 
JOIN Departments 
ON Employees.department_id = Departments.department_id;
UPDATE Employees SET salary = 55000 WHERE employee_id = 102;
UPDATE Employees SET department_id = 1 WHERE employee_id = 103;
SELECT * FROM Employees WHERE salary > 50000;
SELECT * FROM Employees ORDER BY salary DESC;
SELECT Departments.department_name, COUNT(Employees.employee_id) AS total_employees
FROM Departments 
LEFT JOIN Employees 
ON Departments.department_id = Employees.department_id
GROUP BY Departments.department_name;
DELETE FROM Employees WHERE employee_id = 103;