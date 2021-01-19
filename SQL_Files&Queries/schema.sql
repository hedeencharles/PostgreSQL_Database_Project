-- Create schemas

-- DROP TABLE salaries CASCADE 

-- Create tables
CREATE TABLE IF NOT EXISTS employees
(
    id SERIAL,
    employee_no INTEGER UNIQUE,
    emp_title_id VARCHAR(50),
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex VARCHAR(10),
    hire_date DATE,
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id),
    PRIMARY KEY(id, employee_no, emp_title_id)
);

CREATE TABLE IF NOT EXISTS salaries
(
    emp_no INTEGER,
    salary INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(employee_no),
    PRIMARY KEY(emp_no)
);


CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(50) UNIQUE,
    title VARCHAR(50),
    PRIMARY KEY(title_id)
);

CREATE TABLE IF NOT EXISTS department_employees
(
    id SERIAL,
	emp_num INTEGER,
    dept_num VARCHAR,
	FOREIGN KEY (emp_num) REFERENCES employees(employee_no),
	FOREIGN KEY (dept_num) REFERENCES departments(department_no),
    PRIMARY KEY(id, emp_num)
);

CREATE TABLE IF NOT EXISTS departments
(
	id SERIAL,
    department_no VARCHAR UNIQUE,
    dept_name VARCHAR(50),
    PRIMARY KEY(id, department_no)
);

CREATE TABLE IF NOT EXISTS dept_managers
(
	id SERIAL,
    dept_no VARCHAR,
    emp_no INTEGER,
	FOREIGN KEY (dept_no) REFERENCES departments(department_no),
    PRIMARY KEY(id, dept_no)
);


----------
-- Test Queries

-- SELECT employees.first_name, employees.last_name, salaries.salary
-- FROM employees 
-- JOIN salaries
-- 	ON employees.employee_no = salaries.salary

-- SELECT employees.first_name, employees.last_name, titles.title
-- FROM employees 
-- Join titles
-- 	ON employees.emp_title_id = titles.title_id
	
-- SELECT employees.first_name, employees.last_name, departments.dept_name
-- FROM employees
-- JOIN department_employees
-- 	ON employees.employee_no = department_employees.emp_num
-- JOIN departments
-- 	ON department_employees.dept_num = departments.department_no






