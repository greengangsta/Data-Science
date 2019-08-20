ALTER TABLE sales
ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE customers
ADD UNIQUE KEY(email_address);

ALTER TABLE customers
DROP INDEX email_address;

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (customer_id,first_name, last_name,email_address) VALUES (1,'Suraj','Tripathi','tsuraj012@gmail.com');

SELECT * FROM customers;

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

ALTER TABLE companies
CHANGE COLUMN company_id company_id INT AUTO_INCREMENT ;

ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(30);

INSERT INTO companies (headquarters_phone_number, company_name) VALUES ('+1 (202) 555 367','JSS');

SELECT * FROM companies;
