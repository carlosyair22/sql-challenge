--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
LEFT JOIN salaries as s
ON e.emp_no=s.emp_no;


--List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01 00:00:01' AND '1986-12-31 23:59:59'
ORDER BY hire_date;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, e.hire_date, m.from_date, m.to_date
FROM manager m
LEFT JOIN departments AS d
ON m.dept_no=d.dept_no
LEFT JOIN employees AS e
ON m.emp_no=e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp 
ON e.emp_no=dept_emp.emp_no
LEFT JOIN departments as d
ON dept_emp.dept_no=d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name='Hercules' AND last_name LIKE'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp 
ON e.emp_no=dept_emp.emp_no
LEFT JOIN departments as d
ON dept_emp.dept_no=d.dept_no
WHERE d.dept_name='Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp 
ON e.emp_no=dept_emp.emp_no
LEFT JOIN departments as d
ON dept_emp.dept_no=d.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development'
ORDER BY d.dept_name;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last name frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last name frequency" DESC;

