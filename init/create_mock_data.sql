DROP TABLE IF EXISTS mock_data;

CREATE TABLE mock_data (
    id INTEGER,
    customer_first_name VARCHAR(50),
    customer_last_name VARCHAR(50),
    customer_age INTEGER,
    customer_email VARCHAR(100),
    customer_country VARCHAR(50),
    customer_postal_code VARCHAR(20),
    customer_pet_type VARCHAR(50),
    customer_pet_name VARCHAR(50),
    customer_pet_breed VARCHAR(100),

    seller_first_name VARCHAR(50),
    seller_last_name VARCHAR(50),
    seller_email VARCHAR(100),
    seller_country VARCHAR(50),
    seller_postal_code VARCHAR(20),

    product_name VARCHAR(200),
    product_category VARCHAR(50),
    product_price NUMERIC(10,2),
    product_quantity INTEGER,

    sale_date VARCHAR(20),
    sale_customer_id INTEGER,
    sale_seller_id INTEGER,
    sale_product_id INTEGER,
    sale_quantity INTEGER,
    sale_total_price NUMERIC(10,2),

    store_name VARCHAR(100),
    store_location VARCHAR(100),
    store_city VARCHAR(50),
    store_state VARCHAR(50),
    store_country VARCHAR(50),
    store_phone VARCHAR(20),
    store_email VARCHAR(100),

    pet_category VARCHAR(50),

    product_weight NUMERIC(10,2),
    product_color VARCHAR(50),
    product_size VARCHAR(50),
    product_brand VARCHAR(100),
    product_material VARCHAR(100),
    product_description TEXT,
    product_rating NUMERIC(3,1),
    product_reviews INTEGER,
    product_release_date VARCHAR(20),
    product_expiry_date VARCHAR(20),

    supplier_name VARCHAR(100),
    supplier_contact VARCHAR(100),
    supplier_email VARCHAR(100),
    supplier_phone VARCHAR(20),
    supplier_address VARCHAR(100),
    supplier_city VARCHAR(50),
    supplier_country VARCHAR(50)
);

COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data.csv' DELIMITER ',' CSV HEADER;