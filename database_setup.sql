postgres@dell-Latitude-5320:~$ psql -U postgres
psql (16.10 (Ubuntu 16.10-0ubuntu0.24.04.1))
Type "help" for help.

postgres=# CREATE DATABASE ecommerce_db;
CREATE DATABASE
postgres=# \c ecommerce_db
You are now connected to database "ecommerce_db" as user "postgres".
ecommerce_db=# CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);
CREATE TABLE
ecommerce_db=# CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    price INT
);
CREATE TABLE
ecommerce_db=# CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    order_date DATE
);
CREATE TABLE
ecommerce_db=# CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT
);
CREATE TABLE
ecommerce_db=# CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    amount INT
);
CREATE TABLE
ecommerce_db=# INSERT INTO users (name, email) VALUES
('Aarav Shah', 'aarav@mail.com'),
('Meera Patel', 'meera@mail.com'),
('Riya Singh', 'riya@mail.com'),
('Karan Mehta', 'karan@mail.com'),
('Sara Khan', 'sara@mail.com'),
('Vikram Rao', 'vikram@mail.com'),
('Ananya Joshi', 'ananya@mail.com'),
('Neha Kulkarni', 'neha@mail.com'),
('Rahul Desai', 'rahul@mail.com'),
('Juhi Sharma', 'juhi@mail.com');
INSERT 0 10
ecommerce_db=# INSERT INTO products (name, price) VALUES
('Earbuds', 1500),
('Smart Watch', 2500),
('T-Shirt', 500),
('Sneakers', 2000),
('Backpack', 900),
('Keyboard', 1200),
('Mouse', 700),
('Power Bank', 1300),
('Sunglasses', 800),
('Wallet', 600);
INSERT 0 10
ecommerce_db=# INSERT INTO orders (user_id, order_date) VALUES
(1, '2024-01-01'),
(2, '2024-01-03'),
(3, '2024-01-05'),
(4, '2024-01-08'),
(5, '2024-01-10'),
(1, '2024-01-12'),
(3, '2024-01-15'),
(6, '2024-01-16'),
(8, '2024-01-18'),
(10, '2024-01-20');
INSERT 0 10
ecommerce_db=# INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(3, 5, 1),
(4, 6, 1),
(5, 7, 2),
(6, 8, 1),
(7, 1, 1),
(7, 2, 1),
(8, 9, 1),
(9, 10, 1),
(10, 3, 3);
INSERT 0 13
ecommerce_db=# INSERT INTO payments (order_id, amount) VALUES
(1, 2500),
(2, 2500),
(3, 2900),
(4, 1200),
(5, 1400),
(6, 1300),
(7, 4000),
(8, 800),
(9, 600),
(10, 1500);
INSERT 0 10
ecommerce_db=# SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;
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

 product_id |    name     | price 
------------+-------------+-------
          1 | Earbuds     |  1500
          2 | Smart Watch |  2500
          3 | T-Shirt     |   500
          4 | Sneakers    |  2000
          5 | Backpack    |   900
          6 | Keyboard    |  1200
          7 | Mouse       |   700
          8 | Power Bank  |  1300
          9 | Sunglasses  |   800
         10 | Wallet      |   600
(10 rows)

 order_id | user_id | order_date 
----------+---------+------------
        1 |       1 | 2024-01-01
        2 |       2 | 2024-01-03
        3 |       3 | 2024-01-05
        4 |       4 | 2024-01-08
        5 |       5 | 2024-01-10
        6 |       1 | 2024-01-12
        7 |       3 | 2024-01-15
        8 |       6 | 2024-01-16
        9 |       8 | 2024-01-18
       10 |      10 | 2024-01-20
(10 rows)

 item_id | order_id | product_id | quantity 
---------+----------+------------+----------
       1 |        1 |          1 |        1
       2 |        1 |          3 |        2
       3 |        2 |          2 |        1
       4 |        3 |          4 |        1
       5 |        3 |          5 |        1
       6 |        4 |          6 |        1
       7 |        5 |          7 |        2
       8 |        6 |          8 |        1
       9 |        7 |          1 |        1
      10 |        7 |          2 |        1
      11 |        8 |          9 |        1
      12 |        9 |         10 |        1
      13 |       10 |          3 |        3
(13 rows)

 payment_id | order_id | amount 
------------+----------+--------
          1 |        1 |   2500
          2 |        2 |   2500
          3 |        3 |   2900
          4 |        4 |   1200
          5 |        5 |   1400
          6 |        6 |   1300
          7 |        7 |   4000
          8 |        8 |    800
          9 |        9 |    600
         10 |       10 |   1500
(10 rows)

