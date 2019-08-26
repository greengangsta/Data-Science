use employees;

commit;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
DELETE FROM employees 
WHERE
    emp_no = 999903;
    
ROLLBACK;