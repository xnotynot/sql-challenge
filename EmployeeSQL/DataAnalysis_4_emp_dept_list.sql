-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT a.emp_no, a.dept_no
	   ,b.dept_name
	   ,c.last_name, c.first_name
	from public.dept_emp a
	inner join departments as b on b.dept_no = a.dept_no
	inner join employees as c on c.emp_no = a.emp_no
	order by a.emp_no