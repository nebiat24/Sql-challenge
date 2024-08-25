
-- Question 1
-- List the employee number, last name, first name, sex, and salary of each employee.
--==============================================================


SELECT 	e.emp_no, 
		e.last_name, 
		e.first_name, 
		e.sex, 
		s.salary
FROM employees as e
INNER JOIN salaries as s ON e.emp_no = s.emp_no;


-- Question 2
-- List the first name, last name, and hire date for the employees who were hired in 1986.


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';


--==============================================================
--Question 3
--List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
--==============================================================

SELECT 	dm.emp_no, 
		titles.title, 
		dm.dept_no,
		depts.dept_name,
		emp.first_name, 
		emp.last_name
FROM dept_manager AS dm
	JOIN employees AS emp 
	ON (dm.emp_no = emp.emp_no)
		JOIN departments AS depts
		ON (dm.dept_no = depts.dept_no)
			JOIN titles
			ON (emp.emp_title = titles.title_id);
			

--==============================================================
--Question 4
--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
--==============================================================

SELECT 	dep.dept_no,
		dept_emp.emp_no,
		emp.last_name,
		emp.first_name,
		dep.dept_name
FROM employees as emp
	JOIN dept_emp
	ON (emp.emp_no = dept_emp.emp_no)
		JOIN departments as dep
		ON (dept_emp.dept_no = dep.dept_no);
		

--==============================================================
--Question 5
--List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
--==============================================================

SELECT 	emp.first_name,
		emp.last_name,
		emp.sex
FROM employees as emp
WHERE emp.first_name = 'Hercules' AND emp.last_name LIKE 'B%';


--==============================================================
--Question 6
--List each employee in the Sales department, including their employee number, last name, and first name.
--==============================================================

SELECT 	employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
	JOIN dept_emp
	ON (dept_emp.emp_no = employees.emp_no)
		JOIN departments
		ON (departments.dept_no = dept_emp.dept_no)
WHERE departments.dept_name = 'Sales';


--==============================================================
--Question 7
--List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
--==============================================================

SELECT	employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
	JOIN dept_emp
	ON (dept_emp.emp_no = employees.emp_no)
		JOIN departments
		ON (departments.dept_no = dept_emp.dept_no)
WHERE departments.dept_name IN 
(
	'Sales',
	'Development'
);


--==============================================================
--Question 8
--List the frequency counts, in descending order, 
-- of all the employee last names (that is, how many employees share each last name).
--==============================================================

SELECT 	employees.last_name,
		COUNT(employees.last_name) as name_frequency
FROM employees
GROUP BY employees.last_name
ORDER BY name_frequency DESC;