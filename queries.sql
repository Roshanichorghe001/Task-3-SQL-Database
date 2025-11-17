ecommerce_db=# SELECT * FROM users;
 user_id |     name      |      email      
---------+---------------+-----------------
       1 | Aarav Shah    | aarav@mail.com
       2 | Meera Patel   | meera@mail.com
       3 | Riya Singh    | riya@mail.com
       4 | Karan Mehta   | karan@mail.com
       5 | Sara Khan     | sara@mail.com
       6 | Vikram Rao    | vikram@mail.com
       7 | Ananya Joshi  | ananya@mail.com
       8 | Neha Kulkarni | neha@mail.com
       9 | Rahul Desai   | rahul@mail.com
      10 | Juhi Sharma   | juhi@mail.com
(10 rows)

ecommerce_db=# SELECT o.order_id, u.name, o.order_date
FROM orders o
JOIN users u ON o.user_id = u.user_id;
 order_id |     name      | order_date 
----------+---------------+------------
        1 | Aarav Shah    | 2024-01-01
        2 | Meera Patel   | 2024-01-03
        3 | Riya Singh    | 2024-01-05
        4 | Karan Mehta   | 2024-01-08
        5 | Sara Khan     | 2024-01-10
        6 | Aarav Shah    | 2024-01-12
        7 | Riya Singh    | 2024-01-15
        8 | Vikram Rao    | 2024-01-16
        9 | Neha Kulkarni | 2024-01-18
       10 | Juhi Sharma   | 2024-01-20
(10 rows)

ecommerce_db=# SELECT oi.order_id, p.name AS product, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;
 order_id |   product   | quantity 
----------+-------------+----------
        1 | Earbuds     |        1
        1 | T-Shirt     |        2
        2 | Smart Watch |        1
        3 | Sneakers    |        1
        3 | Backpack    |        1
        4 | Keyboard    |        1
        5 | Mouse       |        2
        6 | Power Bank  |        1
        7 | Earbuds     |        1
        7 | Smart Watch |        1
        8 | Sunglasses  |        1
        9 | Wallet      |        1
       10 | T-Shirt     |        3
(13 rows)

ecommerce_db=# SELECT o.order_id, u.name, p.amount, o.order_date
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN payments p ON o.order_id = p.order_id;
 order_id |     name      | amount | order_date 
----------+---------------+--------+------------
        1 | Aarav Shah    |   2500 | 2024-01-01
        2 | Meera Patel   |   2500 | 2024-01-03
        3 | Riya Singh    |   2900 | 2024-01-05
        4 | Karan Mehta   |   1200 | 2024-01-08
        5 | Sara Khan     |   1400 | 2024-01-10
        6 | Aarav Shah    |   1300 | 2024-01-12
        7 | Riya Singh    |   4000 | 2024-01-15
        8 | Vikram Rao    |    800 | 2024-01-16
        9 | Neha Kulkarni |    600 | 2024-01-18
       10 | Juhi Sharma   |   1500 | 2024-01-20
(10 rows)

ecommerce_db=# SELECT u.name, SUM(p.amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY u.name
ORDER BY total_spent DESC;
     name      | total_spent 
---------------+-------------
 Riya Singh    |        6900
 Aarav Shah    |        3800
 Meera Patel   |        2500
 Juhi Sharma   |        1500
 Sara Khan     |        1400
 Karan Mehta   |        1200
 Vikram Rao    |         800
 Neha Kulkarni |         600
(8 rows)

ecommerce_db=# SELECT p.name, SUM(oi.quantity) AS total_qty
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_qty DESC;
    name     | total_qty 
-------------+-----------
 T-Shirt     |         5
 Smart Watch |         2
 Earbuds     |         2
 Mouse       |         2
 Power Bank  |         1
 Sneakers    |         1
 Wallet      |         1
 Sunglasses  |         1
 Backpack    |         1
 Keyboard    |         1
(10 rows)

ecommerce_db=# SELECT u.name, COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.name;
     name      | total_orders 
---------------+--------------
 Karan Mehta   |            1
 Sara Khan     |            1
 Juhi Sharma   |            1
 Riya Singh    |            2
 Meera Patel   |            1
 Neha Kulkarni |            1
 Aarav Shah    |            2
 Vikram Rao    |            1
(8 rows)

ecommerce_db=# SELECT * FROM payments
ORDER BY amount DESC
LIMIT 1;
 payment_id | order_id | amount 
------------+----------+--------
          7 |        7 |   4000
(1 row)

ecommerce_db=# SELECT * FROM products
WHERE price > 1000;
 product_id |    name     | price 
------------+-------------+-------
          1 | Earbuds     |  1500
          2 | Smart Watch |  2500
          4 | Sneakers    |  2000
          6 | Keyboard    |  1200
          8 | Power Bank  |  1300
(5 rows)

ecommerce_db=# SELECT u.name
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.order_id IS NULL;
     name     
--------------
 Rahul Desai
 Ananya Joshi
(2 rows)

ecommerce_db=# 


