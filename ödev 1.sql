-- Departments tablosunun oluşturulması ve veri eklenmesi
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
	);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

-- Employees tablosunun oluşturulması ve veri eklenmesi
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, DepartmentID, Salary, JoinDate) VALUES
(1, 'John', 'Doe', 30, 1, 55000, '2020-01-15'),
(2, 'Jane', 'Smith', 45, 2, 65000, '2018-07-20'),
(3, 'Sam', 'Brown', 28, 1, 52000, '2021-04-25'),
(4, 'Lisa', 'White', 35, 3, 70000, '2019-03-18'),
(5, 'Mark', 'Black', 50, 1, 75000, '2015-11-05'),
(6, 'Lucy', 'Green', 40, 2, 60000, '2017-10-10');

-- a. belirli kolonları seçme
SELECT firstname, lastname, salary
FROM Employees;

-- b. DISTINCT komutu ile tekrarı önleme
SELECT DISTINCT DepartmentName
FROM Departments

-- c. Sadece IT departmanında çalışanları seçme
SELECT E.firstname, E.lastname, D.departmentname
FROM Employees as E
INNER JOIN Departments as D ON E.DepartmentID = D.DepartmentID
WHERE D.Departmentname = 'IT';

-- d. maaşları büyükten küçüğe (DESC) olarak sıralayın
SELECT E.firstname, E.lastname , E.salary, D.departmentname
FROM employees as E
INNER JOIN departments as D ON E.departmentid = D.departmentid
ORDER BY E.salary DESC

-- e. kolonları birleştirme (concatention)
SELECT CONCAT(E.firstname, ' ', E.lastname) AS FullName, D.departmentname
FROM employees as E
INNER JOIN departments as D ON E.departmentid = D.departmentid

