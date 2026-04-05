-- Maison Verre Database Schema
-- Fictional luxury retailer used for SQL portfolio project

CREATE TABLE clients (
    client_id   INT,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    city        VARCHAR(50),
    country     VARCHAR(50),
    join_date   DATE,
    tier        VARCHAR(20)
);

CREATE TABLE sales (
    transaction_id  INT,
    client_id       INT,
    product_name    VARCHAR(100),
    category        VARCHAR(50),
    unit_price      DECIMAL(10,2),
    quantity        INT,
    sale_date       DATE
);

INSERT INTO clients VALUES
(1,  'Isabelle',  'Fontaine',   'Paris',     'France',   '2019-03-15', 'VIP'),
(2,  'Marcus',    'Hale',       'New York',  'USA',      '2021-07-22', 'Standard'),
(3,  'Yuki',      'Tanaka',     'Tokyo',     'Japan',    '2020-11-05', 'VIP'),
(4,  'Dmitri',    'Volkov',     'Moscow',    'Russia',   '2022-01-10', 'Standard'),
(5,  'Amara',     'Osei',       'Accra',     'Ghana',    '2018-06-30', 'Elite'),
(6,  'Cecile',    'Beaumont',   'Lyon',      'France',   '2023-02-14', 'Standard'),
(7,  'James',     'Whitfield',  'London',    'UK',       '2017-09-01', 'Elite'),
(8,  'Lena',      'Hartmann',   'Berlin',    'Germany',  '2020-04-18', 'VIP'),
(9,  'Rafael',    'Mendes',     'São Paulo', 'Brazil',   '2021-12-03', 'Standard'),
(10, 'Nadia',     'Al-Rashid',  'Dubai',     'UAE',      '2019-08-27', 'VIP');

INSERT INTO sales VALUES
(1,  1,  'Satin Evening Bag',        'Accessories',  1200.00, 1, '2023-03-10'),
(2,  3,  'Cashmere Overcoat',        'Apparel',      3800.00, 1, '2023-04-22'),
(3,  5,  'Leather Derby Shoes',      'Footwear',       950.00, 2, '2023-05-15'),
(4,  7,  'Monogram Silk Scarf',      'Accessories',    420.00, 3, '2023-06-01'),
(5,  2,  'Tailored Wool Blazer',     'Apparel',      2100.00, 1, '2023-07-18'),
(6,  8,  'Gold Cufflinks',           'Accessories',    780.00, 2, '2023-08-05'),
(7,  10, 'Crocodile Belt',           'Accessories',  1350.00, 1, '2023-09-12'),
(8,  4,  'Embroidered Evening Gown', 'Apparel',      5200.00, 1, '2023-10-03'),
(9,  6,  'Suede Chelsea Boots',      'Footwear',     1100.00, 2, '2023-11-20'),
(10, 1,  'Diamond Stud Earrings',    'Jewellery',    4500.00, 1, '2023-12-15');
