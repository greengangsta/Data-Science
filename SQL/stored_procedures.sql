USE employees;

drop procedure if exists select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN 
     select * from employees limit 1000;
END $$
DELIMITER ;

CALL employees.select_employees();

DROP procedure select_salaries;

DELIMITER $$
CREATE PROCEDURE select_salaries(IN p_emp_no INT)
BEGIN
    select e.first_name, e.last_name,s.salary, s.from_date,s.to_date from 
     employees e join salaries s 
     on e.emp_no = s.emp_no 
     where e.emp_no = p_emp_no; 
END $$
DELIMITER ;

CALL employees.select_salaries(11300);


USE employees;
DROP PROCEDURE IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INT , OUT p_avg_salary DECIMAL(10,2))
BEGIN
   SELECT AVG(s.salary) INTO p_avg_salary
   FROM
   employees e 
   JOIN
   salaries s ON e.emp_no  = s.emp_no
   WHERE e.emp_no = p_emp_no;
END $$
DELIMITER ;

call employees.emp_avg_salary_out(11300,@p_avg_salary);
select @p_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);
   SELECT AVG(s.salary) INTO v_avg_salary
   FROM
   employees e 
   JOIN 
   salaries s ON e.emp_no  = s.emp_no
   WHERE e.emp_no = p_emp_no;
   RETURN v_avg_salary;
END $$
DELIMITER ;

select f_emp_avg_salary(11300);


