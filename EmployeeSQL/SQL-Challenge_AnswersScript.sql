-- Verify the information in the tables
SELECT * FROM departments;
SELECT * FROM employees LIMIT 10;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp WHERE emp_no = 10010;
SELECT  * FROM salaries;
SELECT * FROM titles WHERE to_date = '9999-01-01';
---------------------------------------------
-- Data Analysis
---------------------------------------------

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT a.emp_no, a.last_name, a.first_name, a.gender, b.salary 
FROM employees AS a
LEFT JOIN salaries AS b
ON a.emp_no = b.emp_no;

-- 2. List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, 
--    the manager's employee number, last name, first name, and start and end employment dates.
SELECT a.dept_no, c.dept_name, b.emp_no, b.last_name, b.first_name, a.from_date, a.to_date 
FROM dept_manager AS a
LEFT JOIN employees AS b
ON a.emp_no = b.emp_no
Left JOIN departments AS c
ON a.dept_no = c.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, 
--    first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees AS a
LEFT JOIN dept_emp AS b
ON a.emp_no = b.emp_no
LEFT JOIN departments AS c
ON b.dept_no = c.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT a.first_name, a.last_name
FROM employees AS a
WHERE a.first_name = 'Hercules' AND a.last_name LIKE 'B%'; 

-- 6. List all employees in the Sales department, including their employee number, last name, 
--    first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees AS a
LEFT JOIN dept_emp AS b
ON a.emp_no = b.emp_no
LEFT JOIN departments AS c
ON b.dept_no = c.dept_no
WHERE c.dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number, 
--    last name, first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees AS a
LEFT JOIN dept_emp AS b
ON a.emp_no = b.emp_no
LEFT JOIN departments AS c
ON b.dept_no = c.dept_no
WHERE c.dept_name = 'Sales' AND c.dept_name = 'Development';
-- As I understand we need to find the employees that works in both departments at the same time
-- that's why in the WHERE condition I put an "AND" clause, but if we want to get both departments
-- employees then we need to use the "OR" clause, like the next line:
-- WHERE c.dept_name = 'Sales' OR c.dept_name = 'Development';


-- 8. In descending order, list the frequency count of employee last names, i.e., 
--    how many employees share each last name.
SELECT last_name, COUNT(*) AS "Total Employees with same Last Name"
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;



-- BONUS - Query for the bonus section
SELECT a.emp_no, a.last_name, a.first_name, a.gender, b.salary, c.title, c.from_date, c.to_date
FROM employees AS a
LEFT JOIN salaries AS b
ON a.emp_no = b.emp_no
LEFT JOIN titles AS c
ON a.emp_no = c.emp_no
WHERE c.to_date = '9999-01-01';

--Your id = 499942
SELECT a.emp_no, a.last_name, a.first_name, a.gender, b.salary, c.title, c.from_date, c.to_date
FROM employees AS a
LEFT JOIN salaries AS b
ON a.emp_no = b.emp_no
LEFT JOIN titles AS c
ON a.emp_no = c.emp_no
WHERE a.emp_no = 499942;

