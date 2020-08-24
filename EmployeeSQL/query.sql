-- Query the tables and Data to answer some questions about past employees

-- 1) Details of each employee
-- DONE
SELECT employees.employee_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
	ON employees.employee_no = salaries.emp_no
	
-- 2) 1986 employee hire details
-- DONE
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986/01/01'
AND hire_date <= '1986/12/31'

	
-- 3) List managers
-- DONE
SELECT dept_managers.dept_no, departments.dept_name,dept_managers.emp_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_managers
JOIN departments
	ON dept_managers.dept_no = departments.department_no
JOIN employees
	ON dept_managers.emp_no = employees.employee_no
	
-- 4) Department of each employee
-- DONE
SELECT employees.employee_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees 
	ON department_employees.emp_num = employees.employee_no
JOIN departments
	ON departments.department_no = department_employees.dept_num

-- 5) filter first names "Hercules" and last name begins with "B".
-- DONE
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
-- Order last names alphabetically 
ORDER BY last_name ASC

-- Or, order by sex 
--ORDER BY sex ASC


-- 6) All employees in the Sales Department
-- DONE
SELECT employees.employee_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees
	ON department_employees.emp_num = employees.employee_no
JOIN departments
	ON departments.department_no = department_employees.dept_num
WHERE departments.dept_name = 'Sales'

-- 7) All employees in Sale and Development Departments
-- DONE
SELECT employees.employee_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees
	ON department_employees.emp_num = employees.employee_no
JOIN departments
	ON departments.department_no = department_employees.dept_num
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development' 
ORDER BY departments.dept_name ASC

-- 8) In descending order, list the frequency 
-- DONE
SELECT last_name, Count(last_name) AS "count_last_name"
FROM employees
GROUP BY(last_name)
ORDER BY count_last_name DESC
























