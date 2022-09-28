-------------------------------------------------------------------------
----------------------- DATA  ANALYSIS ----------------------------------
-------------------------------------------------------------------------

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT sa.emp_no AS "employee number",
	em.last_name AS "last name",
	em.first_name AS "first name",
	em.sex AS "sex",
	sa.salary
FROM salaries AS "sa"
LEFT JOIN employees AS "em"
USING(emp_no)
ORDER BY (emp_no);


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_data
FROM employees
WHERE extract(year from employees.hire_data) = '1986';


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- DROP VIEW employee_and_manager;
CREATE VIEW employee_and_manager AS
SELECT 
	de.dept_no,
	de.emp_no ,
	em.last_name,
	em.first_name
FROM dept_emp AS "de"
LEFT JOIN employees AS "em"
USING(emp_no);

SELECT 
	eam.dept_no AS "department number",
	de.dept_name AS "department name",
	eam.emp_no AS "manager employee number",
	eam.last_name AS "last name",
	eam.first_name AS "first name"
FROM employee_and_manager AS "eam"
LEFT JOIN departments AS "de"
USING(dept_no);


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- DROP VIEW employee_and_emp;
CREATE VIEW employee_and_emp AS
SELECT 
	dm.dept_no,
	dm.emp_no ,
	em.last_name,
	em.first_name
FROM dept_emp AS "dm"
LEFT JOIN employees AS "em"
USING(emp_no);

SELECT 
	eae.emp_no AS "employee number",
	eae.last_name AS "last name",
	eae.first_name AS "first name",
	de.dept_name AS "department name"
FROM employee_and_emp AS "eae"
LEFT JOIN departments AS "de"
USING(dept_no);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name AS "first name",
 	last_name AS "last name",
 	sex AS "sex" 
FROM employees
WHERE first_name ILIKE 'Hercules' AND last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- DROP VIEW departments_employees;
CREATE VIEW departments_employees AS
SELECT
	eae.emp_no,
	eae.last_name,
	eae.first_name,
	de.dept_name
FROM employee_and_emp AS "eae"
LEFT JOIN departments AS "de"
USING(dept_no);

SELECT emp_no AS "employee number",
	last_name AS "last_name",
	first_name AS "first_name",
	dept_name AS "department name"
FROM departments_employees
WHERE dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no AS "employee number",
	last_name AS "last_name",
	first_name AS "first_name",
	dept_name AS "department name"
FROM departments_employees
WHERE dept_name = 'Sales' OR dept_name = 'Development';


-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name AS "last name",
	COUNT(last_name) AS "count"
FROM employees
GROUP BY last_name
ORDER BY count DESC;










































