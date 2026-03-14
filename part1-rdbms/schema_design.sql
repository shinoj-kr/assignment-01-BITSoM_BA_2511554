## 1.2 — Schema Design
-- Create Database
CREATE DATABASE assignment_db;
-- Use Database
USE assignment_db;
-- Q1: Create City table
CREATE TABLE city (
  city_id varchar(50),
  city_name varchar(50) NOT NULL,
  PRIMARY KEY (city_id)
);

-- Q2: Create Category table
CREATE TABLE category (
  category_id varchar(50),
  category_name varchar(50) NOT NULL,
  PRIMARY KEY (category_id)
);

-- Q3: Create Product table
CREATE TABLE product (
  product_id varchar(50),
  product_name varchar(100) NOT NULL,
  category_id varchar(50),
  PRIMARY KEY (product_id),
  FOREIGN KEY (category_id) REFERENCES category (category_id)
);
-- Q4: Create Employee table
CREATE TABLE employee (
  sales_rep_id varchar(50),
  sales_rep_name varchar(50) NOT NULL,
  sales_rep_email varchar(50) NOT NULL,
  office_address varchar(300) NOT NULL,
  PRIMARY KEY (sales_rep_id)
);
-- Q5: Create Customers table
CREATE TABLE customer (
  customer_id varchar(50),
  customer_name varchar(50) NOT NULL,
  customer_email varchar(50) NOT NULL,
  city_id varchar(50) NOT NULL,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (city_id) REFERENCES city (city_id)
  
);
-- Q6: Create Orders table
CREATE TABLE orders (
  order_id varchar(100),
  customer_id varchar(50) NOT NULL,
  product_id varchar(50) NOT NULL,
  sales_rep_id varchar(50) NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  order_date DATETIME NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  FOREIGN KEY (product_id) REFERENCES product (product_id),
  FOREIGN KEY (sales_rep_id) REFERENCES employee (sales_rep_id)
);

-- Q7: Insert Values in city table
insert  into 
city(city_id,city_name) 
values 
('CT01','Bangalore'),('CT02','Chennai'),('CT03','Delhi'),('CT04','Hyderabad'),('CT05','Mumbai');

-- Q8: Insert Values in category table
insert  into 
category(category_id,category_name) 
values 
('CT01','Electronics'),('CT02','Furniture'),('CT03','Stationery'),('CT04','Toys'),('CT05','Fruits');

-- Q9: Insert Values in product table
insert  into 
product(product_id,product_name,category_id) 
values 
('P001','Laptop','CT01'),('P002','Mouse','CT01'),('P003','Desk Chair','CT02'),('P004','Notebook','CT03'),('P005','Headphones','CT01');

-- Q10: Insert Values in employee table
insert  into 
employee(sales_rep_id,sales_rep_name,sales_rep_email,office_address) 
values 
('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ, Nariman Point, Mumbai - 400021'),('SR02','Anita Desai','anita@corp.com','Delhi Office, Connaught Place, New Delhi - 110001'),('SR03','Ravi Kumar','ravi@corp.com','South Zone, MG Road, Bangalore - 560001'),('SR04','Rajesh','rajesh@corp.com','Trivandrum Office, Karyavattom, Trivandrum - 695001'),('SR05','Soumya','soumya@corp.com','Trivandrum Office, Karyavattom, Trivandrum - 695001');

-- Q11: Insert Values in customer table
insert  into 
customer(customer_id,customer_name,customer_email,city_id) 
values 
('C001','Rohan Mehta','rohan@gmail.com','CT05'),('C002','Priya Sharma','priya@gmail.com','CT03'),('C003','Amit Verma','amit@gmail.com','CT01'),('C004','Sneha Iyer','sneha@gmail.com','CT02'),('C005','Vikram Singh','vikram@gmail.com','CT05');

-- Q12: Insert Values in orders table
insert  into 
orders(order_id,customer_id,product_id,sales_rep_id,unit_price,quantity,order_date) 
values 
('ORD1095','C001','P001','SR03',55000,3,'2023-08-11'),('ORD1094','C002','P003','SR01',8500,3,'2023-10-25'),('ORD1124','C003','P002','SR02',800,2,'2023-12-22'),('ORD1142','C004','P004','SR03',120,3,'2023-05-12'),('ORD1031','C005','P005','SR01',3200,1,'2023-09-17');



