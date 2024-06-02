INSERT INTO users (username, password, email) VALUES ('admin', 'adminpass', 'admin@example.com');

INSERT INTO categories (name) VALUES ('Electronics'), ('Books'), ('Clothing');

INSERT INTO products (name, description, price, category_id) VALUES 
('Smartphone', 'A high-end smartphone', 699.99, 1),
('Laptop', 'A powerful laptop', 999.99, 1),
('Novel', 'A gripping novel', 19.99, 2),
('T-Shirt', 'A stylish t-shirt', 9.99, 3);
