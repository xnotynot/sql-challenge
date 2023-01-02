# sql-challenge
## Data Modeling
Inspect the CSV files, and then sketch an Entity Relationship Diagram of the tables

![Entity Relationship Diagram](https://github.com/xnotynot/sql-challenge/blob/main/EmployeeSQL/Entity_Relationship_Diagram.png)

## Creating the table schema

### Departments
```
  CREATE TABLE "departments" ("dept_no" varchar(10) NOT NULL,
                              "dept_name" varchar(30)   NOT NULL,
   CONSTRAINT "pk_departments" PRIMARY KEY ( "dept_no" ) );
```
### Titles
```
CREATE TABLE "titles" ( "title_id" varchar(10)   NOT NULL,
                        "title" varchar(30   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ( "title_id" ));
```
### Employees table
```
CREATE TABLE "employees" ("emp_no" int   NOT NULL,
                          "empl_title_id" varchar(10)   NOT NULL,
                          "birth_date" date   NOT NULL,
                          "first_name" varchar(50)   NOT NULL,
                          "last_name" varchar(50)   NOT NULL,
                          "sex" char(1)   NOT NULL,
                          "hire_date" date   NOT NULL,
       CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no" ));
```
### Employees in department
```
CREATE TABLE "dept_emp" ( "emp_no" int   NOT NULL,
                          "dept_no" varchar(10)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no","dept_no" ));
```

### Managers in department
```
CREATE TABLE "dept_manager" ( "dept_no" varchar(10)   NOT NULL,
                              "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no","emp_no" ));
```
### Salaries
```
CREATE TABLE "salaries" ("emp_no" int   NOT NULL,
                         "salaries" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no"));
```
### Foreign key relationships
```
  ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_empl_title_id" FOREIGN KEY("empl_title_id")
    REFERENCES "titles" ("title_id");

  ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
    REFERENCES "employees" ("emp_no");

  ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
    REFERENCES "departments" ("dept_no");

  ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
    REFERENCES "departments" ("dept_no");

  ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
    REFERENCES "employees" ("emp_no");

  ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
    REFERENCES "employees" ("emp_no");
```
## Data Analysis

### List the employee number, last name, first name, sex, and salary of each employee.
```
SELECT a.emp_no, a.last_name, a.first_name, a.sex, b.salaries
	FROM public.employees as a
	inner join public.salaries as b on b.emp_no = a.emp_no
	order by a.emp_no
```

### List the first name, last name, and hire date for the employees who were hired in 1986.
```
SELECT first_name, last_name, hire_date
	FROM public.employees
	where hire_date between '1986-01-01' and '1986-12-31'
	order by hire_date
 ```
### List the manager of each department along with their department number, department name, employee number, last name, and first name.
```
SELECT a.emp_no, a.dept_no
	   ,b.dept_name
	   ,c.last_name, c.first_name
	from public.dept_manager as a
	inner join departments as b on b.dept_no = a.dept_no
	inner join employees as c on c.emp_no = a.emp_no
	order by a.emp_no
 ```
### List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
```
SELECT a.emp_no, a.dept_no
	   ,b.dept_name
	   ,c.last_name, c.first_name
	from public.dept_emp a
	inner join departments as b on b.dept_no = a.dept_no
	inner join employees as c on c.emp_no = a.emp_no
	order by a.emp_no
```
### List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
```
SELECT first_name, last_name, sex
	FROM public.employees
	where first_name = 'Hercules' and
		  last_name like 'B%'
	order by first_name, last_name
```
### List each employee in the Sales department, including their employee number, last name, and first name.

### List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

### List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
