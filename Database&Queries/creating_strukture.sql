-- CREATING DATABASE
CREATE DATABASE cr09_ervin_delivery DEFAULT CHARACTER SET utf8; 

-- CREATING TABLES
CREATE TABLE customer( 
    customer_id INT PRIMARY KEY AUTO_INCREMENT, 
    first_name varchar(255) NOT NULL, 
    last_name varchar(255) NOT NULL, 
    address varchar(255) NOT NULL, 
    zip INT NOT NULL, 
    town varchar(255) NOT NULL, 
    email varchar(255) NOT NULL 
); 

-- SENDER
CREATE TABLE sender(
    sender_id INT PRIMARY KEY AUTO_INCREMENT,
    fk_customer_id INT,
    FOREIGN KEY (fk_customer_id) REFERENCES customer(customer_id)
);

-- RECEIVER
CREATE TABLE receiver(
    receiver_id INT PRIMARY KEY AUTO_INCREMENT,
    fk_customer_id INT,
    FOREIGN KEY (fk_customer_id) REFERENCES customer(customer_id)
);

-- LOCATION
CREATE TABLE location(
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255),
    zip INT,
    district VARCHAR(255),
    phone INT
);

-- PACKAGE TYPE
CREATE TABLE package_type(
    package_type INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(255)
);

-- PACKAGE
CREATE TABLE package(
    package_id INT PRIMARY KEY AUTO_INCREMENT,
    date_received DATE,
    fk_package_type INT,
    fk_sender_id INT,
    fk_receiver_id INT,
    fk_location_id INT,
    FOREIGN KEY (fk_package_type) REFERENCES package_type(package_type),
    FOREIGN KEY (fk_sender_id) REFERENCES sender(sender_id),
    FOREIGN KEY (fk_receiver_id) REFERENCES receiver(receiver_id),
    FOREIGN KEY (fk_location_id) REFERENCES location(location_id)
);

-- HEAD QUARTER
CREATE TABLE head_quarter(
    hq_id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(255),
    fk_location_id INT,
    FOREIGN KEY (fk_location_id) REFERENCES location(location_id)
);

-- DEPARTMENT
CREATE TABLE department(
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(255)
);

-- EMPLOYEE
CREATE TABLE employee(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    fk_location_id INT,
    fk_department_id INT,
    FOREIGN KEY (fk_location_id) REFERENCES location(location_id),
    FOREIGN KEY (fk_department_id) REFERENCES department(department_id)
);

-- TRANSPORT TYPE
CREATE TABLE transport_type(
    transport_type_id INT PRIMARY KEY AUTO_INCREMENT,
    transport VARCHAR(255)
);

-- DELIVERY
CREATE TABLE delivery(
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    delivery_date DATE,
    fk_package_type INT,
    fk_emp_id INT,
    fk_transport_type_id INT,
    fk_receiver_id INT,
    FOREIGN KEY (fk_package_type) REFERENCES package_type(package_type),
    FOREIGN KEY (fk_emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (fk_transport_type_id) REFERENCES transport_type(transport_type_id),
    FOREIGN KEY (fk_receiver_id) REFERENCES receiver(receiver_id)
);

-- PROCESSING
CREATE TABLE processing(
    processing_id INT PRIMARY KEY AUTO_INCREMENT,
    processing_date DATE,
    fk_emp_id INT,
    fk_package_id INT,
    FOREIGN KEY (fk_emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (fk_package_id) REFERENCES package(package_id)
);
