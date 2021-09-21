--drop tables if needed
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;


--create each table and import csv data
CREATE TABLE departments ( 
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no));

SELECT * FROM departments;

CREATE TABLE titles( 
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id));

SELECT * FROM titles;

CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));
	
SELECT * FROM employees;

CREATE TABLE dept_emp( 
	emp_no INT,
	dept_no VARCHAR,
		PRIMARY KEY (dept_no,emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	
SELECT * FROM dept_emp;

CREATE TABLE dept_manager ( 
	dept_no VARCHAR,
	emp_no INT,
		PRIMARY KEY(dept_no,emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

SELECT * FROM dept_manager;

CREATE TABLE salaries ( 
	emp_no INT,
	salary VARCHAR,
		PRIMARY KEY (emp_no),
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

SELECT * FROM salaries;

