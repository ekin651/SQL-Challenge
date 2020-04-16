



drop table departments;

create table departments(
	
dept_no char(4) primary key not null,
	
dept_name varchar(30)

	);

select * from departments;





create table employees (
emp_no numeric(10)  primary key,
birth_date Date,
first_name varchar(25),
last_name varchar(25),
gender varchar(1),
hired_date date
	);

select * from employees;	
	
create table dept_emp(
emp_no numeric(10) references employees(emp_no),
dept_no varchar(10) references departments(dept_no),
from_date  date,
to_date  date
    );
	
	
select * from dept_emp;


create table dept_manager(

dept_no varchar(10) references departments(dept_no),
emp_no numeric(10) references employees(emp_no),
from_date date,
to_date date
   );
select * from dept_manager;



create table titles(

emp_no numeric(10) references employees(emp_no),
title varchar(25),
from_date date,
to_date date
);
select * from titles;

create table salaries(
emp_no numeric(10) references employees(emp_no),
salary numeric,
from_date date,
to_date date 
);

select * from salaries;



1. 

-- Perform an INNER JOIN on the two tables
SELECT employees.emp_no, employees.last_name, employees.first_name,employees.gender,salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;




select * from employees

2. List employees who were hired in 1986.
select last_name, first_name
from employees
where hired_date between '1986/01/01' and '1986/12/31';

3.List the manager of each department with the following information: department number, department name, 
 the managers employee number, last name, first name, and start and end employment dates;
 
SELECT departments.dept_no, departments.dept_name,dept_manager.emp_no,employees.last_name,employees.first_name,
dept_manager.from_date,dept_manager.to_date
FROM departments
JOIN dept_manager on
departments.dept_no=dept_manager.dept_no
join employees on
dept_manager.emp_no=employees.emp_no
;


4.List the department of each employee with the following information: employee number, last name, first name, and department name.


select employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
from employees
join dept_manager
on employees.emp_no=dept_manager.emp_no inner join departments 
on dept_manager.dept_no=departments.dept_no;




5.List all employees whose first name is "Hercules" and last names begin with "B."

select * from employees
where first_name='Hercules' and last_name like 'B%'; 

select 
from 
where
order by


6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no where departments.dept_name = 'Sales';



7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no where departments.dept_name = 'Sales' or departments.dept_name='Development';



8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name;

select last_name, count(last_name) as count_employees_last_name
from employees
group by last_name
order by count(last_name) desc;








