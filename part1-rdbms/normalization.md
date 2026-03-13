## Part 1 — Relational Databases 
## 1.1 — Anomaly Analysis
An Insert Anomaly :- In flat file orders_flat.csv the order table, customer table and the product table are merged. So it is not possible to insert a new product
which was not ordered till date. For example : "Keyboard" is not ordered till date. This product cannot be inserted because the table require fields like order_id, customer_id, and order_date. This creates an Insert Anomaly due to poor table design.


An Update Anomaly :-  In the flat file orders_flat.csv, customer details such as customer_id, customer_name, and customer_city are stored together with order details. If a customer changes their city, the customer_city value must be updated in multiple rows where that customer appears. For example if Customer having customer_id = C001 , customer_name = Rohan Mehta and customer_city = Mumbai changes the city to Bangalore, then all rows with customer_id = C001 ( rows 3,11,15,22,42,46,54,70,79,95,103,121,124,132,133,138,168,174,182 and 187 has to be updated.

