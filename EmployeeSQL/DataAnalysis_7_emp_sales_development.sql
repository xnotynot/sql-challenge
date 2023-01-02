-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT a.emp_no
	   ,b.dept_name
	   ,c.last_name, c.first_name
	from public.dept_emp a
	inner join departments as b on b.dept_no = a.dept_no
	inner join employees as c on c.emp_no = a.emp_no
	where a.dept_no in ( select dept_no from departments where dept_name in ('Sales','Development'))
	order by a.emp_no	