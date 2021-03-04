-- Data Engineering --
-- Create the titles table
DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);
-- import titles csv into the titles table
-- SELECT *
-- FROM titles;

-- Create the employees table
DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
    emp_no INT   NOT NULL,
    emp_tit_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);
-- import employee csv into the employee table
-- SELECT *
-- FROM employees;

-- Create the departments table
DROP TABLE IF EXISTS departments;

CREATE TABLE departments(
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);
-- import departments csv into the departments table
-- SELECT *
-- FROM departments;
 
-- Create the dept_manager table
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager(
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL
);
-- import dept_manager csv into the dept_manager table
-- SELECT *
-- FROM dept_manager;

-- Create the dept_emp table
DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp(
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL
);
-- import dept_emp csv into the dept_emp table
-- SELECT *
-- FROM dept_emp;

-- Create the salaries table
DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries(
    emp_no INT   NOT NULL,
    salary INT   NOT NULL
);
-- import salaries csv into the salaries table
-- SELECT *
-- FROM salaries;

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_tit_id FOREIGN KEY(emp_tit_id)
REFERENCES titles (title_id);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);