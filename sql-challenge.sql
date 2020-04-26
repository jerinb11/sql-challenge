CREATE TABLE department (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

drop table demp_emp;
CREATE TABLE demp_emp (	
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR,
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
drop table dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (dept_no, emp_no, from_date),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date DATE,
	PRIMARY KEY (emp_no)
);

drop table salaries;
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER,
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (emp_no, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

drop table titles;
CREATE TABLE titles (
	emp_no INTEGER NOT NULL,
	title VARCHAR,
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (emp_no, from_date, to_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM employees