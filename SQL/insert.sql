SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 5;

INSERT into employees 
(emp_no, 
birth_date, 
first_name,
 last_name,
 gender, 
 hire_date) 
VALUES (
999901,
'1986-04-21',
'John',
'Smith',
'M',
'2011-01-01'
);

INSERT into employees 
(
birth_date, 
emp_no, 
first_name,
 last_name,
 gender, 
 hire_date) 
VALUES (
'1986-04-21',
 999902,
'Patricia',
'Lawrence',
'M',
'2011-01-01'
);


INSERT into employees 
VALUES (
 999903,
 '1986-04-21',
'Jonathan',
'Creek',
'M',
'2011-01-01'
);

# Exercise 

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 5;

INSERT INTO titles
VALUES
(
  999903,
  'Senior Engineer',
 '1997-10-1',
'2011-01-01'
);

INSERT INTO dept_emp
 VALUES
(
 999903,
 'd005',
'1997-10-01',
'9999-01-01'
);

SELECT 
    *
FROM
    departments
LIMIT 10;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

INSERT INTO departments_dup
(
  dept_no,
  dept_name
)
SELECT 
 *
FROM 
departments;

SELECT 
    *
FROM
    departments_dup
LIMIT 10;









