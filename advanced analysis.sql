6. Total sales per employee
    
SELECT e.name, SUM(s.sale_amount) AS total_sales
    FROM employees 
    eJOIN sales sON e.emp_id = s.emp_id
    GROUP BY e.name;
-- 7. Rank employees by salary within each department
SELECT name, department, salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
    FROM employees;
-- 8. Top 2 highest paid employees per department
SELECT *
    FROM (    SELECT name, department, salary,    
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rn    FROM employees) 
    rankedWHERE rn <= 2;
-- 9. Running total of sales per employee
SELECT emp_id, sale_date, sale_amount,
    SUM(sale_amount) OVER 
    (PARTITION BY emp_id ORDER BY sale_date) AS running_totalFROM sales
    ;
-- 10. Employees earning more than their department average salary
SELECT *FROM employees eWHERE salary > (    SELECT AVG(salary)    
    FROM employees    WHERE department = e.department);
