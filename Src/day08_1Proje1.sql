create database proje1;

use proje1;

CREATE TABLE employees (
emp_no int,
birth_date date,
first_name varchar(30),
last_name varchar(30),
gender ENUM ('M', 'F'),
hire_date date,
Primary kEY (emp_no)
);


CREATE TABLE departments(
dept_no char(4),
dept_name varchar(30),
Primary Key (dept_no),
unique key (dept_name)
);




CREATE TABLE dept_emp (
emp_no int,
dept_no char(4),
from_date date,
to_date date,
Foreign Key (emp_no) REFERENCES employees(emp_no),
Foreign key (dept_no) REFERENCES departments(dept_no)
);



CREATE TABLE dept_manager (
dept_no CHAR(4),
emp_no INT,
from_date DATE,
to_date DATE,
FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE titles (
emp_no int,
title varchar(30),
from_date DATE,
to_date DATE,
foreign key (emp_no) REFERENCES employees(emp_no)
);



CREATE TABLE salaries (
emp_no int,
salary int,
from_date date,
to_date date,
FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);