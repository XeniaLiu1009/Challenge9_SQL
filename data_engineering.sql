-------------------------------------------------------------------------
----------------------- DATA  ENGINEERING -------------------------------
-------------------------------------------------------------------------

-- import the csv
-- drop table if exists
DROP TABLE departments ;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

-- create the table
CREATE TABLE departments(
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(20)  NOT NULL,
	PRIMARY KEY(dept_no)
);

CREATE TABLE titles(
	title_id VARCHAR(5)  NOT NULL,
	title VARCHAR(20)  NOT NULL,
	PRIMARY KEY(title_id)
);

CREATE TABLE employees(
	emp_no INT  NOT NULL,
	emp_title_id VARCHAR(5)  NOT NULL,
	birth_data DATE,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(5),
	hire_data DATE,
	PRIMARY KEY(emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp(
	emp_no INT  NOT NULL,
	dept_no VARCHAR(4)  NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4)  NOT NULL,
	emp_no INT  NOT NULL,
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries(
	emp_no INT  NOT NULL,
	salary INT  NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- read all of the data 
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;