-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
	FROM public.employees
	where hire_date between '1986-01-01' and '1986-12-31'
	order by hire_date