--List the employee number, last name, first name, sex, and salary of each employee
SELECT a.emp_no, a.last_name, a.first_name, a.sex, b.salaries
	FROM public.employees as a
	inner join public.salaries as b on b.emp_no = a.emp_no
	order by a.emp_no