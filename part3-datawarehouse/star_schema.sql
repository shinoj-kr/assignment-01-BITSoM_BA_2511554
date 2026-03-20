## Part 3 — Data Warehouses

## 3.1 — Star Schema Design

CREATE DATABASE retail_transactions;


## Product Dimension Table Creation
USE retail_transactions;
CREATE TABLE dim_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    UNIQUE (product_name)
);

## Customer Dimension Table Creation
USE retail_transactions;
CREATE TABLE dim_customer (
    customer_id VARCHAR(10) PRIMARY KEY
);

## Store Dimension Table Creation
USE retail_transactions;
CREATE TABLE dim_store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(100) NOT NULL,
    UNIQUE (store_name, store_city)
);

## Date Dimension Table Creation
USE retail_transactions;
CREATE TABLE dim_date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    UNIQUE (full_date)
);


## Transaction Fact Table Creation
USE retail_transactions;
CREATE TABLE fact_transaction (
    sale_key BIGINT AUTO_INCREMENT PRIMARY KEY,

    transaction_id VARCHAR(20) NOT NULL,

    product_id INT NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    store_id INT NOT NULL,
    date_id INT NOT NULL,

    units_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    total_amount DECIMAL(12,2)
    GENERATED ALWAYS AS (units_sold * unit_price) STORED,

    UNIQUE (transaction_id, product_id),

    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);

## Insert 10 values of retail_transactions.csv into Product dimension table
use retail_transactions;
INSERT INTO dim_product (product_name, category)
VALUES
('Speaker', 'Electronics'),
('Tablet', 'Electronics'),
('Phone', 'Electronics'),
('Smartwatch', 'Electronics'),
('Laptop', 'Electronics'),
('Headphones', 'Electronics'),

('Jeans', 'Clothing'),
('Jacket', 'Clothing'),
('Saree', 'Clothing');

## Insert 10 values of retail_transactions.csv into Customer dimension table
use retail_transactions;
INSERT INTO dim_customer (customer_id)
VALUES
('CUST001'),
('CUST002'),
('CUST003'),
('CUST004'),
('CUST005'),
('CUST006'),
('CUST007'),
('CUST008'),
('CUST009'),
('CUST010');

## Insert 10 values of retail_transactions.csv into Date dimension table
use retail_transactions;
INSERT INTO dim_date (full_date)
VALUES
('2023-01-01'),
('2023-01-02'),
('2023-01-03'),
('2023-01-04'),
('2023-01-05'),
('2023-01-06'),
('2023-01-07'),
('2023-01-08'),
('2023-01-09'),
('2023-01-10');

## Insert 10 values into Store dimension table
use retail_transactions;
INSERT INTO dim_store (store_name, store_city)
VALUES

('Chennai Anna', 'Chennai'),
('Delhi South', 'Delhi'),
('Bangalore MG', 'Bangalore'),
('Pune FC Road', 'Pune'),
('Mumbai Central', 'Mumbai'),
('Trivandrum Central', 'Trivandrum'),
('Hyderabad Banjara', 'Hyderabad'),
('Kolkata Park Street', 'Kolkata'),
('Ahmedabad CG Road', 'Ahmedabad'),
('Jaipur MI Road', 'Jaipur');

## Insert 10 values of retail_transactions.csv into fact transaction table
use retail_transactions;
INSERT INTO fact_transaction (
transaction_id, product_id, customer_id, store_id, date_id, units_sold, unit_price
) VALUES
('TXN5000',1,'CUST045',1,149,3,49262.78),
('TXN5001',2,'CUST012',1,210,7,23226.12),
('TXN5002',3,'CUST033',2,36,12,48703.39),
('TXN5003',4,'CUST041',3,75,5,58851.01),
('TXN5004',5,'CUST009',4,12,9,42343.15),
('TXN5005',6,'CUST025',5,88,6,39854.96),
('TXN5006',7,'CUST018',2,167,14,2317.47),
('TXN5007',8,'CUST003',3,54,11,30187.24),
('TXN5008',9,'CUST028',4,63,4,35451.81),
('TXN5009',4,'CUST020',3,141,3,58851.01);

