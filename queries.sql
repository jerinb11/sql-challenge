--1. Data from tables employees & salaries
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
  
--2. Hired date
SELECT employees.hire_date, employees.last_name, employees.first_name
FROM employees 
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

--3. Department manager information
SELECT dept_manager.dept_no, department.dept_name, employees.emp_no, employees.last_name, employees.first_name, 
dept_manager.from_date, dept_manager.to_date
FROM employees
JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
JOIN department
ON department.dept_no = dept_manager.dept_no;

--4. List the department of each employee
SELECT demp_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM employees
JOIN demp_emp
ON employees.emp_no = demp_emp.emp_no
JOIN department
ON department.dept_no = demp_emp.dept_no;	

--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.last_name, employees.first_name
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.List all employees in the Sales department
SELECT demp_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM employees
JOIN demp_emp
ON employees.emp_no = demp_emp.emp_no
JOIN department
ON department.dept_no = demp_emp.dept_no
WHERE dept_name = 'Sales';	 
				 
--7. List all employees in the Sales and Development departments
SELECT demp_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM employees
JOIN demp_emp
ON employees.emp_no = demp_emp.emp_no
JOIN department
ON department.dept_no = demp_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last_name count"
FROM employees
GROUP BY last_name
ORDER BY "last_name count" DESC;