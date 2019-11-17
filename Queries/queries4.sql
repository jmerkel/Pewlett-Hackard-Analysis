--LIST 1 Employee Information - empNo, last name, first name, gender, salary, to_date (current)
SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT e.emp_no, e.first_name, e.last_name, e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE 
AND (de.to_date = '9999-01-01');


-- EXAMPLE
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- 7.3.6 Skill Drill - All current employees Department Retirees
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
FROM employees 
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments 
ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name IN ('Sales', 'Development') 
AND (dept_emp.to_date = '9999-01-01')
ORDER BY employees.emp_no;
