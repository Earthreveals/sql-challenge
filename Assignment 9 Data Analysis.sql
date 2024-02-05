-- List of employee number, last name, first name, sex and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM public.employees 
JOIN public.salaries  ON employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT *
FROM public.employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'
ORDER BY hire_date ASC;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    dept_manager.dept_no,
    departments.dept_name,
    employees.emp_no,
    employees.last_name,
    employees.first_name
FROM 
    dept_manager 
JOIN 
    departments ON dept_manager.dept_no = department.dept_no
JOIN 
    employees ON dm.emp_no = employees.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    department_employee.dept_no,
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM 
    employees
JOIN 
    department_employee ON employees.emp_no = CAST(department_employee.emp_no AS INTEGER)
JOIN 
    departments ON department_employee.dept_no = departments.dept_no;
  
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
    first_name,
    last_name,
    sex
FROM
    employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT
    employees.emp_no,
    employees.last_name,
    employees.first_name
FROM
    employees 
JOIN
    department_employee ON employees.emp_no = CAST(department_employee.emp_no AS INTEGER)
JOIN
    departments ON department_employee.dept_no = departments.dept_no
WHERE
    departments.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM
    employees
JOIN
    department_employee ON employees.emp_no = CAST(department_employee.emp_no AS INTEGER)
JOIN
    departments ON department_employee.dept_no = departments.dept_no
WHERE
    departments.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
    last_name,
    COUNT(*) AS name_count
FROM
    employees
GROUP BY
    last_name
ORDER BY
    name_count DESC;

