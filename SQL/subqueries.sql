use employees;

SELECT 
    *
FROM
    dept_manager;

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
        AND e.hire_date BETWEEN '1990-01-01' AND '1995-01-01';
        
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            dm.emp_no
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
        AND e.hire_date BETWEEN '1990-01-01' AND '1995-01-01';
        
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            dm.emp_no
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no
        ORDER BY emp_no);
        
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
        AND e.hire_date BETWEEN '1990-01-01' AND '1995-01-01';
        
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            dm.emp_no
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no)
ORDER BY emp_no;
	
SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            t.title
        FROM
            titles t
        WHERE
            t.title = 'assistant engineer'
                AND t.emp_no = e.emp_no);
            
	