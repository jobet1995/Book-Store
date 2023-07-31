CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    isbn VARCHAR(20),
    genre VARCHAR(50),
    publication_date DATE,
    price DECIMAL(10, 2)
);

CREATE TABLE Inventory (
    book_id INT PRIMARY KEY,
    stock_count INT,
    reorder_point INT,
    low_stock_alert BOOLEAN,
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    shipping_address VARCHAR(255),
    billing_address VARCHAR(255)
);

CREATE TABLE Order (
    order_id INT PRIMARY KEY,
    order_number VARCHAR(20),
    order_date DATETIME,
    customer_id INT,
    total_amount DECIMAL(10, 2),
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE OrderLineItem (
    line_item_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    transaction_id VARCHAR(50),
    payment_amount DECIMAL(10, 2),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

CREATE TABLE Users(
    userId INT PRIMARY KEY,
    userName VARCHAR(20),
    passWord VARCHAR(20),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES `Customer`(customer_id)
);
