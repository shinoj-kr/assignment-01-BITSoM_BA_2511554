## Part 1 — Relational Databases 
## 1.1 — Anomaly Analysis
An Insert Anomaly :- In flat file orders_flat.csv the order table, customer table and the product table are merged. So it is not possible to insert a new product
which was not ordered till date. For example : "Keyboard" is not ordered till date. This product cannot be inserted because the table require fields like order_id, customer_id, and order_date. This creates an Insert Anomaly due to poor table design.
An Update Anomaly :- if Customer having customer_id = C001 , customer_name = Rohan Mehta and customer_city = Mumbai changes the city to Bangalore, due to poor table design instead on updating the customer details the customer_city value inside the orders_flat.csv should have to be changed to Bangalore.This will make the historical order data corrupt.

