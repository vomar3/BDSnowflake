INSERT INTO customer (
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    customer_country,
    customer_postal_code
)
SELECT DISTINCT
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    customer_country,
    NULLIF(customer_postal_code, '')
FROM mock_data
WHERE customer_first_name IS NOT NULL
  AND customer_last_name IS NOT NULL
  AND customer_age IS NOT NULL
  AND customer_email IS NOT NULL
  AND customer_country IS NOT NULL;


INSERT INTO seller (
    seller_first_name,
    seller_last_name,
    seller_email,
    seller_country,
    seller_postal_code
)
SELECT DISTINCT
    seller_first_name,
    seller_last_name,
    seller_email,
    seller_country,
    NULLIF(seller_postal_code, '')
FROM mock_data
WHERE seller_first_name IS NOT NULL
  AND seller_last_name IS NOT NULL
  AND seller_email IS NOT NULL
  AND seller_country IS NOT NULL;


INSERT INTO supplier (
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    supplier_country
)
SELECT DISTINCT
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    supplier_country
FROM mock_data
WHERE supplier_name IS NOT NULL
  AND supplier_contact IS NOT NULL
  AND supplier_email IS NOT NULL
  AND supplier_phone IS NOT NULL
  AND supplier_address IS NOT NULL
  AND supplier_city IS NOT NULL
  AND supplier_country IS NOT NULL;


INSERT INTO store (
    store_name,
    store_location,
    store_city,
    store_state,
    store_country,
    store_phone,
    store_email
)
SELECT DISTINCT
    store_name,
    store_location,
    store_city,
    NULLIF(store_state, ''),
    store_country,
    store_phone,
    store_email
FROM mock_data
WHERE store_name IS NOT NULL
  AND store_location IS NOT NULL
  AND store_city IS NOT NULL
  AND store_country IS NOT NULL
  AND store_phone IS NOT NULL
  AND store_email IS NOT NULL;


INSERT INTO product (
    supplier_id,
    product_name,
    product_category,
    product_price,
    product_quantity,
    product_weight,
    product_color,
    product_size,
    product_brand,
    product_material,
    product_description,
    product_rating,
    product_reviews,
    product_release_date,
    product_expiry_date
)
SELECT DISTINCT
    s.supplier_id,
    m.product_name,
    m.product_category,
    m.product_price,
    m.product_quantity,
    m.product_weight,
    m.product_color,
    m.product_size,
    m.product_brand,
    m.product_material,
    m.product_description,
    m.product_rating,
    m.product_reviews,
    TO_DATE(m.product_release_date, 'MM/DD/YYYY'),
    TO_DATE(m.product_expiry_date, 'MM/DD/YYYY')
FROM mock_data m
JOIN supplier s
    ON s.supplier_name = m.supplier_name
   AND s.supplier_contact = m.supplier_contact
   AND s.supplier_email = m.supplier_email
   AND s.supplier_phone = m.supplier_phone
   AND s.supplier_address = m.supplier_address
   AND s.supplier_city = m.supplier_city
   AND s.supplier_country = m.supplier_country
WHERE m.product_name IS NOT NULL
  AND m.product_category IS NOT NULL
  AND m.product_price IS NOT NULL
  AND m.product_quantity IS NOT NULL
  AND m.product_weight IS NOT NULL
  AND m.product_color IS NOT NULL
  AND m.product_size IS NOT NULL
  AND m.product_brand IS NOT NULL
  AND m.product_material IS NOT NULL
  AND m.product_description IS NOT NULL
  AND m.product_rating IS NOT NULL
  AND m.product_reviews IS NOT NULL
  AND m.product_release_date IS NOT NULL
  AND m.product_expiry_date IS NOT NULL;


INSERT INTO pet (
    customer_id,
    pet_category,
    pet_type,
    pet_name,
    pet_breed
)
SELECT DISTINCT
    c.customer_id,
    m.pet_category,
    m.customer_pet_type,
    m.customer_pet_name,
    m.customer_pet_breed
FROM mock_data m
JOIN customer c
    ON c.customer_first_name = m.customer_first_name
   AND c.customer_last_name = m.customer_last_name
   AND c.customer_age = m.customer_age
   AND c.customer_email = m.customer_email
   AND c.customer_country = m.customer_country
   AND COALESCE(c.customer_postal_code, '') = COALESCE(NULLIF(m.customer_postal_code, ''), '')
WHERE m.pet_category IS NOT NULL
  AND m.customer_pet_type IS NOT NULL
  AND m.customer_pet_name IS NOT NULL
  AND m.customer_pet_breed IS NOT NULL;


INSERT INTO sale (
    sale_date,
    customer_id,
    seller_id,
    product_id,
    store_id,
    quantity,
    total_price
)
SELECT
    TO_DATE(m.sale_date, 'MM/DD/YYYY') AS sale_date,
    c.customer_id,
    se.seller_id,
    p.product_id,
    st.store_id,
    m.sale_quantity,
    m.sale_total_price
FROM mock_data m
JOIN customer c
    ON c.customer_first_name = m.customer_first_name
   AND c.customer_last_name = m.customer_last_name
   AND c.customer_age = m.customer_age
   AND c.customer_email = m.customer_email
   AND c.customer_country = m.customer_country
   AND COALESCE(c.customer_postal_code, '') = COALESCE(NULLIF(m.customer_postal_code, ''), '')
JOIN seller se
    ON se.seller_first_name = m.seller_first_name
   AND se.seller_last_name = m.seller_last_name
   AND se.seller_email = m.seller_email
   AND se.seller_country = m.seller_country
   AND COALESCE(se.seller_postal_code, '') = COALESCE(NULLIF(m.seller_postal_code, ''), '')
JOIN supplier su
    ON su.supplier_name = m.supplier_name
   AND su.supplier_contact = m.supplier_contact
   AND su.supplier_email = m.supplier_email
   AND su.supplier_phone = m.supplier_phone
   AND su.supplier_address = m.supplier_address
   AND su.supplier_city = m.supplier_city
   AND su.supplier_country = m.supplier_country
JOIN product p
    ON p.supplier_id = su.supplier_id
   AND p.product_name = m.product_name
   AND p.product_category = m.product_category
   AND p.product_price = m.product_price
   AND p.product_quantity = m.product_quantity
   AND p.product_weight = m.product_weight
   AND p.product_color = m.product_color
   AND p.product_size = m.product_size
   AND p.product_brand = m.product_brand
   AND p.product_material = m.product_material
   AND p.product_description = m.product_description
   AND p.product_rating = m.product_rating
   AND p.product_reviews = m.product_reviews
   AND p.product_release_date = TO_DATE(m.product_release_date, 'MM/DD/YYYY')
   AND p.product_expiry_date = TO_DATE(m.product_expiry_date, 'MM/DD/YYYY')
JOIN store st
    ON st.store_name = m.store_name
   AND st.store_location = m.store_location
   AND st.store_city = m.store_city
   AND COALESCE(st.store_state, '') = COALESCE(NULLIF(m.store_state, ''), '')
   AND st.store_country = m.store_country
   AND st.store_phone = m.store_phone
   AND st.store_email = m.store_email
WHERE m.sale_date IS NOT NULL
  AND m.sale_quantity IS NOT NULL
  AND m.sale_total_price IS NOT NULL;