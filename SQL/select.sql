SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';

# Operator Precedence 

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M'
        OR gender = 'F';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');
        
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
        OR first_name = 'Mark'
        OR first_name = 'Nathan';
        
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%mar%');
   
# Exercise question 1
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Jack%');

# Exercise question 2

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('Jack%');

# Between 

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
# Exercise 

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    
# Exercise 

SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;
    
# Exercise 

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
# NOT NULL 

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;
    
# Exercise 

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
# Comparison Opertors
 
SELECT 
    *
FROM
    employees
WHERE
    first_name <> 'Mark';

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
# Distinct

SELECT 
    gender
FROM
    employees;
    
SELECT DISTINCT
    gender
FROM
    employees;
    
# Exercise 

SELECT DISTINCT
    hire_date
FROM
    employees;
    
# Aggregate Functions

SELECT 
    COUNT(emp_no)
FROM
    employees;

SELECT 
    COUNT(first_name)
FROM
    employees;
    
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
# Exercise 

SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary > 100000;
    
SELECT 
    COUNT(dept_no)
FROM
    dept_manager;

SELECT 
    COUNT(employees.emp_no)
FROM
    employees,
    dept_manager
WHERE
    employees.emp_no = dept_manager.emp_no;
    
# Order by

SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

# Group By 



