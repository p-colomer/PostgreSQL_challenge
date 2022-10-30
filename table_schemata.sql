--titles table
CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(40) NOT NULL
);

SELECT*FROM titles;

--employees table
CREATE TABLE employee (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);

SELECT*FROM employee;

-- departments table
CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);

SELECT*FROM departments;

--salaries table
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	
	FOREIGN KEY(emp_no) 
	REFERENCES employee(emp_no)
);

SELECT*FROM salaries;

--department employee table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4),
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

SELECT*FROM dept_emp;

--department manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

SELECT*FROM dept_manager;

ALTER DATABASE employee_db SET datestyle TO "ISO, MDY";

select*from employee;
select*from departments;
select*from titles;
select*from salaries;
select*from dept_emp;
select*from dept_manager;
