-- Employee & Sales Analysis Queries

-- 1. Total employees per department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 2. Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 3. Employees without any project
SELECT e.name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;

-- 4. Employees earning more than company average salary
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 5. Rank employees by salary within each department
SELECT name, department, salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;
