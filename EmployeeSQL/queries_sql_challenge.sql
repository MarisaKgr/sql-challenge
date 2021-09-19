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

CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	PRIMARY KEY (emp_no));
	
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

CREATE TABLE titles( 
	dept_no VARCHAR,
	dept_name VARCHAR);

SELECT * FROM titles;

--List the following details of each employee: employee number, last name, first name, sex, and salary
--inner join tables employees and salaries 
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
--select from employees (hire_date, first_name,last_name) ==1986
SELECT hire_date, first_name, last_name 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
--inner join dept_manager (dept_no,emp_no) and departments (dept_name) on dept_no and employees(last_name,first_name) on emp_no
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d ON dm.dept_no=d.dept_no
INNER JOIN employees AS e ON dm.emp_no=e.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
--join employees (emp_no,last_name,first_name) with dept_emp on emp_no and departments on dept_no
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name 
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no=de.emp_no
INNER JOIN departments AS d ON de.dept_no=d.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
--join employees (emp_no,last_name,frist_name) with dept_emp on emp_no and departments(dept_name) on dept_name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no=de.emp_no
INNER JOIN departments AS d ON de.dept_no=d.dept_no;

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
--repeat last step and add where statement for 'Sales' or 'Marketing'
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no=de.emp_no
INNER JOIN departments AS d ON de.dept_no=d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Marketing';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Frequency" FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;



