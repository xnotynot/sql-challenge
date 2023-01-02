-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT a.emp_no, a.dept_no
	   ,b.dept_name
	   ,c.last_name, c.first_name
	from public.dept_manager as a
	inner join departments as b on b.dept_no = a.dept_no
	inner join employees as c on c.emp_no = a.emp_no
	order by a.emp_no