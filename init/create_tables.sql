CREATE TABLE IF NOT EXISTS customer (
    customer_id SERIAL PRIMARY KEY,
    customer_first_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_age INTEGER NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_country VARCHAR(50) NOT NULL,
    customer_postal_code VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS seller (
    seller_id SERIAL PRIMARY KEY,
    seller_first_name VARCHAR(50) NOT NULL,
    seller_last_name VARCHAR(50) NOT NULL,
    seller_email VARCHAR(100) NOT NULL,
    seller_country VARCHAR(50) NOT NULL,
    seller_postal_code VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS supplier (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    supplier_contact VARCHAR(100) NOT NULL,
    supplier_email VARCHAR(100) NOT NULL,
    supplier_phone VARCHAR(20) NOT NULL,
    supplier_address VARCHAR(100) NOT NULL,
    supplier_city VARCHAR(50) NOT NULL,
    supplier_country VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_location VARCHAR(100) NOT NULL,
    store_city VARCHAR(50) NOT NULL,
    store_state VARCHAR(50),
    store_country VARCHAR(50) NOT NULL,
    store_phone VARCHAR(20) NOT NULL,
    store_email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS product (
    product_id SERIAL PRIMARY KEY,
    supplier_id INTEGER NOT NULL REFERENCES supplier(supplier_id),
    product_name VARCHAR(200) NOT NULL,
    product_category VARCHAR(50) NOT NULL,
    product_price NUMERIC(10,2) NOT NULL,
    product_quantity INTEGER NOT NULL,
    product_weight NUMERIC(10,2) NOT NULL,
    product_color VARCHAR(50) NOT NULL,
    product_size VARCHAR(50) NOT NULL,
    product_brand VARCHAR(100) NOT NULL,
    product_material VARCHAR(100) NOT NULL,
    product_description TEXT NOT NULL,
    product_rating NUMERIC(3,1) NOT NULL,
    product_reviews INTEGER NOT NULL,
    product_release_date DATE NOT NULL,
    product_expiry_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS pet (
    pet_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
    pet_category VARCHAR(50) NOT NULL,
    pet_type VARCHAR(50) NOT NULL,
    pet_name VARCHAR(50) NOT NULL,
    pet_breed VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS sale (
    sale_id SERIAL PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
    seller_id INTEGER NOT NULL REFERENCES seller(seller_id),
    product_id INTEGER NOT NULL REFERENCES product(product_id),
    store_id INTEGER NOT NULL REFERENCES store(store_id),
    quantity INTEGER NOT NULL,
    total_price NUMERIC(10,2) NOT NULL
);