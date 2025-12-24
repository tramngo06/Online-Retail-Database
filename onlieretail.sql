#Create your database and tables. Enter some sample data into the tables. Run a few queries to see the results.
# 1. CONNECT TO A DATABASE 
CREATE DATABASE IF NOT EXISTS final_project_db;
USE final_project_db;

# 2. CREATING TABLES FOR ONLINE RETAIL DATABASE

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name CHAR(20) NOT NULL,
    category VARCHAR(20),
    price DECIMAL(10,2) CHECK (price >= 0),
    availability INT CHECK (availability >= 0)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(20) NOT NULL,
    email CHAR(20) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address CHAR(20)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE,
    method VARCHAR(20),
    amount DECIMAL(10,2) CHECK (amount >= 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


CREATE TABLE Shippings (
    shipping_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    carrier VARCHAR(50),
    tracking_number VARCHAR(50) UNIQUE,
    status VARCHAR(10),
    delivery_date DATE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Order_Product (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity NUMERIC(10,0) CHECK (quantity >= 0),
    total_price DECIMAL(10,2) CHECK (total_price >= 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
# 3. CHECK TABLES AN DTHEIR STRUCTURES. 
SHOW TABLES; 
# 4. INSERT RECORDS INTO THOSE TABLES. 
INSERT INTO Products (product_id, product_name, category, price, availability) VALUES
(1, 'Croptop', 'Summer Clothes', 20.00, 50),
(2, 'Jeans', 'Apparel', 45.00, 40),
(3, 'High heels', 'Footwear', 145.00, 30),
(4, 'Jacket', 'Outerwear', 120.00, 15),
(5, 'Socks', 'Accessories', 15.00, 60);

INSERT INTO Customers (customer_id, customer_name, email, phone, address) VALUES
(1, 'Tram Ngo', 'tngo@gmail.com', '309-876-5243', '123 Main St'),
(2, 'Ashley Cruz', 'ashcruz@gmail.com', '421-675-2837', '456 Oak Ave'),
(3, 'Noelle Jackson', 'noejack@gmail.com', '309-987-5664', '789 Pine Rd'),
(4, 'Mubbara Amjad', 'mubaj@gmail.com', '217-987-6765', '789 Pine Rd');


INSERT INTO Orders (order_id, customer_id, order_date, status) VALUES
(1, 1, '2025-12-01', 'Pending'),
(2, 2, '2025-12-02', 'Shipped'),
(3, 3, '2025-12-03', 'Delivered');

INSERT INTO Payments (payment_id, order_id, payment_date, method, amount) VALUES
(1, 1, '2025-12-01', 'Credit Card', 95.00),
(2, 2, '2025-12-02', 'Apple Wallet', 135.00),
(3, 3, '2025-12-03', 'Debit Card', 120.00);
INSERT INTO Shippings (shipping_id, order_id, carrier, tracking_number, status, delivery_date) VALUES
(1, 1, 'UPS', '1Z12345ABCDE', 'Pending', NULL),
(2, 2, 'FedEx', '1234567890', 'Shipped', '2025-12-05'),
(3, 3, 'USPS', '987654321', 'Delivered', '2025-12-04');

INSERT INTO Order_Product (order_id, product_id, quantity, total_price) VALUES
(1, 1, 2, 40.00),   
(1, 5, 1, 15.00),  
(2, 2, 3, 135.00),  
(3, 4, 1, 120.00); 


# 5. CHECK THE CONTENTS OF ALL TABLES. 
SELECT * FROM Customers;
SELECT * FROM Order_Product;
SELECT * FROM Orders;
SELECT * FROM Payments;
SELECT * FROM Products;



FooterUniversity of Illinois Springfield
University of Illinois Springfield avatar
