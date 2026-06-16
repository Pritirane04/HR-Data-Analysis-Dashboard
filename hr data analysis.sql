CREATE DATABASE hr_project;
USE hr_project;
select * from hr_analysis;
select * from hr_analysis limit 10;

-- Total records
select count(*) from hr_analysis;

-- Column check
describe hr_analysis;

-- Find total number of employees
SELECT COUNT(*) 
FROM hr_analysis 
WHERE Attrition = 'Yes';

-- Find unique departments
SELECT DISTINCT Department FROM hr_analysis;

-- Find unique job roles
SELECT DISTINCT JobRole FROM hr_analysis;

-- Find unique education fields
select DISTINCT  EducationField FROM hr_analysis;

-- Find average monthly income
SELECT AVG(MonthlyIncome) FROM hr_analysis;

-- Find employees who travel frequently
SELECT COUNT(*) 
FROM hr_analysis 
WHERE BusinessTravel = 'Travel_Frequently';

-- Find employees with overtime
SELECT COUNT(*) 
FROM hr_analysis 
WHERE OverTime = 'Yes';

-- SELECT AVG(MonthlyIncome) FROM hr_analysis;
SELECT AVG(MonthlyIncome) FROM hr_analysis;

-- Find maximum and minimum age
SELECT MAX(Age), MIN(Age) FROM hr_analysis;

-- Find total monthly income of all employees
SELECT SUM(MonthlyIncome) FROM hr_analysis;

-- Find number of employees doing overtime
SELECT COUNT(*) FROM hr_analysis WHERE OverTime = 'Yes';

-- GROUP BY + ORDER BY

-- Find employee count in each department
SELECT Department, COUNT(*) 
FROM hr_analysis 
GROUP BY Department;

-- Find employee count by gender
SELECT Gender, COUNT(*) 
FROM hr_analysis 
GROUP BY Gender;

-- Find average income by department
SELECT Department, AVG(MonthlyIncome) 
FROM hr_analysis 
GROUP BY Department;

-- Find job roles with highest number of employees
SELECT JobRole, COUNT(*) 
FROM hr_analysis 
GROUP BY JobRole
ORDER BY COUNT(*) DESC;

-- Find departments with highest average age
SELECT Department, AVG(Age) 
FROM hr_analysis 
GROUP BY Department
ORDER BY AVG(Age) DESC;

-- HAVING
-- Find departments having more than 50 employees
SELECT Department, COUNT(*) 
FROM hr_analysis
GROUP BY Department
HAVING COUNT(*) > 50;

-- Find job roles with average income greater than 5000
SELECT JobRole, AVG(MonthlyIncome)
FROM hr_analysis
GROUP BY JobRole
HAVING AVG(MonthlyIncome) > 5000;

-- Find departments with low job satisfaction
SELECT Department, AVG(JobSatisfaction)
FROM hr_analysis
GROUP BY Department
HAVING AVG(JobSatisfaction) < 3;

-- SUBQUERIES
-- Find employees earning above average income
SELECT *
FROM hr_analysis
WHERE MonthlyIncome > (SELECT AVG(MonthlyIncome) FROM hr_analysis);

-- Find employees younger than average age
SELECT *
FROM hr_analysis
WHERE Age < (SELECT AVG(Age) FROM hr_analysis);

-- Find employees with maximum working years
SELECT *
FROM hr_analysis
WHERE TotalWorkingYears = (SELECT MAX(TotalWorkingYears) FROM hr_analysis);

-- Find employees with minimum income
SELECT *
FROM hr_analysis
WHERE MonthlyIncome = (SELECT MIN(MonthlyIncome) FROM hr_analysis);

-- WINDOW FUNCTIONS + JOIN
--  Find rank of employees based on income
SELECT EmployeeNumber, MonthlyIncome,
RANK() OVER (ORDER BY MonthlyIncome DESC)
FROM hr_analysis;

-- Find rank of employees within each department
SELECT EmployeeNumber, Department, MonthlyIncome,
RANK() OVER (PARTITION BY Department ORDER BY MonthlyIncome DESC)
FROM hr_analysis;

--  Find row number of employees based on age
SELECT EmployeeNumber,
ROW_NUMBER() OVER (ORDER BY Age)
FROM hr_analysis;



-- Find employees in same department using self join
SELECT a.EmployeeNumber, b.EmployeeNumber
FROM hr_analysis a
JOIN hr_analysis b
ON a.Department = b.Department
AND a.EmployeeNumber <> b.EmployeeNumber;

-- Find employee count by department and attrition
SELECT Department, Attrition, COUNT(*)
FROM hr_analysis
GROUP BY Department, Attrition;

-- Create log table
CREATE TABLE employee_log (
    emp_id INT,
    action_type VARCHAR(50),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Find insert activity using TRIGGER
CREATE TRIGGER after_employee_insert
AFTER INSERT ON hr_analysis
FOR EACH ROW
INSERT INTO employee_log(emp_id, action_type)
VALUES (NEW.EmployeeNumber, 'INSERT');

-- Find delete activity using TRIGGER
CREATE TRIGGER after_employee_delete
AFTER DELETE ON hr_analysis
FOR EACH ROW
INSERT INTO employee_log(emp_id, action_type)
VALUES (OLD.EmployeeNumber, 'DELETE');

-- Find update activity using TRIGGER
CREATE TRIGGER after_employee_update
AFTER UPDATE ON hr_analysis
FOR EACH ROW
INSERT INTO employee_log(emp_id, action_type)
VALUES (NEW.EmployeeNumber, 'UPDATE');

-- Find high income employees using CTE + VIEW
WITH HighIncomeCTE AS (
    SELECT * FROM hr_analysis WHERE MonthlyIncome > 10000
)
SELECT * FROM HighIncomeCTE;


-- Stored Procedure

DELIMITER //

CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
    SELECT * 
    FROM hr_analysis
    WHERE Department = dept_name;
END //

DELIMITER ;

-- Use:
CALL GetEmployeesByDept('Sales');

-- INDEX
-- Create index on Department column
CREATE INDEX idx_dept 
ON hr_analysis(Department);

SELECT * FROM hr_analysis WHERE Department = 'Sales';


-- ALTER TABLE (Constraint)
-- Add NOT NULL constraint
ALTER TABLE hr_analysis
MODIFY MonthlyIncome INT NOT NULL;

-- LAG (Window Function)
-- Compare previous employee salary
SELECT EmployeeNumber, MonthlyIncome,
LAG(MonthlyIncome) OVER (ORDER BY EmployeeNumber) AS PreviousSalary
FROM hr_analysis;

/* The HR analysis shows that employee attrition is strongly linked to job satisfaction and overall work conditions. Employees with lower satisfaction levels are more likely to leave the organization, indicating that engagement and workplace environment play a crucial role in retention. Improving employee experience and addressing concerns early can help reduce turnover.

Workload is another major factor affecting employee behavior. Employees who work longer hours or frequently do overtime tend to experience higher stress levels, which increases the chances of attrition. This suggests that maintaining a proper work-life balance and distributing workload evenly across teams is important for employee well-being.

Salary and compensation also have a significant impact on retention. Employees in lower income groups are more likely to leave compared to those earning higher salaries. This indicates that fair and competitive compensation is essential to retain talent and reduce employee turnover.

The analysis also highlights the importance of career growth and promotions. Employees who have spent many years in the company without promotion show a higher tendency to leave. This suggests that providing clear growth opportunities, promotions, and skill development programs can improve employee loyalty.

Overall, the project concludes that multiple factors such as satisfaction, workload, salary, and growth opportunities together influence employee attrition. By focusing on these areas, organizations can improve retention, enhance productivity, and build a more stable workforce./*















