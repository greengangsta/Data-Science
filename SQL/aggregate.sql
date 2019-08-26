# Exercise
use employees;

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

SELECT 
    MIN(emp_no)
FROM
    dept_emp;
SELECT 
    MAX(emp_no)
FROM
    dept_emp
    ;
SELECT 
    ROUND(AVG(salary))
FROM
    salaries
WHERE
    from_date > '1997-01-01';

SELECT 
    *
FROM
    departments_dup;
    
TRUNCATE departments_dup;

INSERT INTO departments_dup select * from departments;

ALTER TABLE departments_dup
ADD COLUMN dept_manager INT(10);

SELECT 
    dept_no,
    IFNULL(dept_manager,
            'department manager not assigned') as dept_manager
FROM
    departments_dup;

