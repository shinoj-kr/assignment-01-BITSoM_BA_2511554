## Part 1 — Relational Databases 
## 1.1 — Anomaly Analysis
An Insert Anomaly :- In flat file orders_flat.csv the order table, customer table and the product table are merged. So it is not possible to insert a new product
which was not ordered till date. For example : "Keyboard" is not ordered till date. This product cannot be inserted because the table require fields like order_id, customer_id, and order_date. This creates an Insert Anomaly due to poor table design.
