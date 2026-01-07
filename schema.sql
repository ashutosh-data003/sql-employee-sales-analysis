-- Schema for Employee & Sales Analysis Project

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    experience INT
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    department VARCHAR(30),
    manager VARCHAR(50)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(50),
    hours_worked INT
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    sale_amount INT,
    sale_date DATE
);
