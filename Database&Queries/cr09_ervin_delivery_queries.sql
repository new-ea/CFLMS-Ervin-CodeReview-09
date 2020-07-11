-- JOIN CUSTOMER TABEL WITH SENDER TABEL
SELECT customer.first_name, customer.last_name, sender.sender_id
FROM customer
INNER JOIN sender ON customer.customer_id = sender.fk_customer_id;

-- JOIN CUSTOMER TABLE WITH RECEIVER TABLE
SELECT customer.first_name, customer.last_name, receiver.receiver_id
FROM customer
INNER JOIN receiver ON customer.customer_id = receiver.fk_customer_id;

-- SELECTING ALL PACKAGES TO SEE THEIR TYPE
SELECT package.package_id, package_type.type
FROM package
INNER JOIN package_type ON package.fk_package_type = package_type.package_type

-- SELECTING DELIVERY DATE AND EMPLOYEE ID WITH CONDITION
SELECT delivery.fk_emp_id, delivery.delivery_date FROM delivery WHERE delivery.fk_package_type LIKE "5";

-- CONNECTING 3 TABLES (EMPLOYEE, LOCATION, DEPARTMENT)
SELECT employee.emp_id, employee.first_name, employee.last_name, location.address, department.department 
FROM employee
INNER JOIN location ON employee.fk_location_id = location.location_id
INNER JOIN department ON employee.fk_department_id = department.department_id

-- CONNECTING 6 TABLES WITH INNER JOIN
SELECT 
delivery.delivery_id, 
delivery.delivery_date, 
package.date_received,
package_type.type,
employee.first_name,
employee.last_name,
transport_type.transport,
receiver.fk_customer_id
FROM delivery
INNER JOIN package ON delivery.fk_package_id = package.package_id
INNER JOIN package_type ON delivery.fk_package_type = package_type.package_type
INNER JOIN employee ON delivery.fk_emp_id = employee.emp_id
INNER JOIN transport_type ON delivery.fk_transport_type_id = transport_type.transport_type_id
INNER JOIN receiver ON delivery.fk_receiver_id = receiver.receiver_id

-- CONNECTING TWO TABLES AND SELECTING DATA WITH SPECIFIG CONDITION
SELECT delivery.delivery_id, delivery.delivery_date, package_type.type
FROM delivery
INNER JOIN package_type ON delivery.fk_package_type = package_type.package_type
WHERE delivery.delivery_date > "2020.08.01" GROUP BY delivery.delivery_id

-- SHOW SUM OF DATA IN EACH TABLE
SELECT table_name, table_rows
   FROM INFORMATION_SCHEMA.TABLES
   WHERE TABLE_SCHEMA = 'cr09_ervin_delivery'

-- SHOW THE SUM OF DATA IN THE WHOLE DATABASE
SELECT SUM(TABLE_ROWS)
   FROM INFORMATION_SCHEMA.TABLES
   WHERE TABLE_SCHEMA = 'cr09_ervin_delivery'; 

-- CONNECTING 3 TABLES TO GET SPECIFIG INFORMATION
SELECT package.package_id, package.fk_sender_id, customer.first_name, customer.last_name, package_type.type
FROM package
INNER JOIN sender ON package.fk_sender_id = sender.sender_id
INNER JOIN customer ON sender.fk_customer_id = customer.customer_id
INNER JOIN package_type ON package.fk_package_type = package_type.package_type
WHERE sender.sender_id LIKE "1001"