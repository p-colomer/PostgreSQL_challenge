
--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date 
FROM employee 
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT DISTINCT ON (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name
FROM dept_manager 
INNER JOIN departments 
ON dept_manager.dept_no= departments.dept_no
INNER JOIN employee 
ON dept_manager.emp_no = employee.emp_no
ORDER BY dept_manager.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employee AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.last_name, e.first_name, e.sex
FROM employee AS e
WHERE (e.first_name = 'Hercules') AND (LOWER(e.last_name) LIKE 'b%')
ORDER BY e.last_name;

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT DISTINCT ON (emp_no) *
INTO employee_department
from dept_emp
order by emp_no;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee AS e
INNER JOIN employee_department AS ed
ON e.emp_no = ed.emp_no
INNER JOIN departments AS d
ON ed.dept_no = d.dept_no
WHERE LOWER(d.dept_name) = 'sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name. 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee AS e
INNER JOIN employee_department AS ed
on e.emp_no = ed.emp_no
INNER JOIN departments AS d
ON ed.dept_no = d.dept_no
WHERE (LOWER(d.dept_name) = 'sales') OR (LOWER(d.dept_name) = 'development');

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS total_count 
from employee 
group by last_name
order by total_count desc;