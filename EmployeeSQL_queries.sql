--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name,employees.sex, salaries.salary, employees.hire_date
FROM employees
left join salaries
ON employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where hire_date like '%1986';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select department.dept_no, department.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from department 
inner join dept_manager on dept_manager.dept_no = department.dept_no
inner join employees on employees.emp_no = dept_manager.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from department 
inner join dept_emp on dept_emp.dept_no = department.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex 
from employees
where first_name = 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join department on dept_emp.dept_no = department.dept_no
where department.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join department on dept_emp.dept_no = department.dept_no
where department.dept_name = 'Sales' or department.dept_name = 'Development'


--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

select last_name as "Last Name", count(last_name) as "Shared Last Name Count"
from employees
group by last_name
order by last_name desc 