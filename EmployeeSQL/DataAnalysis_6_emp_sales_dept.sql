-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT a.emp_no
	   ,c.last_name, c.first_name
	from public.dept_emp a
	inner join employees as c on c.emp_no = a.emp_no
	where a.dept_no = ( select dept_no from departments where dept_name = 'Sales')
	order by a.emp_no	