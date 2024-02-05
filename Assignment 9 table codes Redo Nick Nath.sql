--Create table departments
CREATE TABLE departments (
  dept_no CHAR(4) NOT NULL,
  dept_name VARCHAR(255) NOT NULL,
  CONSTRAINT pk_departments PRIMARY KEY (dept_no),
  CONSTRAINT unique_dept_name UNIQUE (dept_name)
);

--CCreate table department employees
CREATE TABLE employees (
  emp_no INT NOT NULL,
  dept_no CHAR(4) NOT NULL,
  CONSTRAINT pk_employees PRIMARY KEY (emp_no),
  CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--Create table department manager
CREATE TABLE dept_manager (
  dept_no CHAR(4) NOT NULL,
  emp_no INT NOT NULL,
  CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no, emp_no),
  CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Create table employees
CREATE TABLE employees (
  emp_no INT NOT NULL,
  temp_title VARCHAR(255), 
  birth_date DATE NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')), 
  hire_date DATE NOT NULL,
  CONSTRAINT pk_employeenames PRIMARY KEY (emp_no)
  );

--Create table salaries
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary DECIMAL(10, 2) NOT NULL, -- Assuming a precision of 10 digits with 2 decimal places for currency
  CONSTRAINT pk_salaries PRIMARY KEY (emp_no),
  CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Create table titles
CREATE TABLE titles (
  title_id CHAR(5) NOT NULL,
  title VARCHAR(255) NOT NULL,
  CONSTRAINT pk_titles PRIMARY KEY (title_id)
);

