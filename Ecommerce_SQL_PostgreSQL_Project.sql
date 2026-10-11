-- ============================================================
-- E-COMMERCE SALES & CUSTOMER ANALYSIS
-- PostgreSQL Practice Project
-- Level: Beginner -> Intermediate -> Advanced
-- ============================================================

-- Run this script in PostgreSQL / pgAdmin.
-- It creates a small realistic dataset and 40+ practice queries.

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- 1. TABLES
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    status VARCHAR(20)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    price NUMERIC(10,2)
);

-- 2. SAMPLE DATA
INSERT INTO customers VALUES
(1,'Rahul Sharma','Pune','Maharashtra','2025-01-10'),
(2,'Amit Verma','Mumbai','Maharashtra','2025-01-15'),
(3,'Priya Patel','Indore','Madhya Pradesh','2025-02-05'),
(4,'Neha Singh','Delhi','Delhi','2025-02-20'),
(5,'Rohit Jain','Nagpur','Maharashtra','2025-03-01'),
(6,'Sneha Gupta','Bhopal','Madhya Pradesh','2025-03-15'),
(7,'Vikas Kumar','Bengaluru','Karnataka','2025-04-02'),
(8,'Pooja Shah','Ahmedabad','Gujarat','2025-04-18'),
(9,'Karan Mehta','Pune','Maharashtra','2025-05-03'),
(10,'Anjali Rao','Hyderabad','Telangana','2025-05-21'),
(11,'Manish Joshi','Indore','Madhya Pradesh','2025-06-05'),
(12,'Riya Kapoor','Mumbai','Maharashtra','2025-06-18'),
(13,'Sahil Khan','Delhi','Delhi','2025-07-01'),
(14,'Komal Deshmukh','Pune','Maharashtra','2025-07-12'),
(15,'Arjun Nair','Bengaluru','Karnataka','2025-08-05'),
(16,'Meera Iyer','Chennai','Tamil Nadu','2025-08-20'),
(17,'Nitin Yadav','Jaipur','Rajasthan','2025-09-02'),
(18,'Ayesha Khan','Lucknow','Uttar Pradesh','2025-09-15'),
(19,'Deepak Soni','Surat','Gujarat','2025-10-01'),
(20,'Tanya Malhotra','Delhi','Delhi','2025-10-15');

INSERT INTO products VALUES
(1,'Laptop','Electronics',55000),
(2,'Smartphone','Electronics',30000),
(3,'Tablet','Electronics',18000),
(4,'Headphones','Electronics',2500),
(5,'Keyboard','Electronics',1500),
(6,'Mouse','Electronics',800),
(7,'Office Chair','Furniture',7000),
(8,'Study Table','Furniture',9000),
(9,'Backpack','Accessories',2200),
(10,'Watch','Accessories',5000),
(11,'Shoes','Fashion',3500),
(12,'T-Shirt','Fashion',1200),
(13,'Jeans','Fashion',2500),
(14,'Coffee Maker','Home Appliances',6500),
(15,'Air Fryer','Home Appliances',8500);

INSERT INTO orders VALUES
(101,1,'2025-01-12','Delivered'),
(102,2,'2025-01-18','Delivered'),
(103,3,'2025-02-08','Cancelled'),
(104,4,'2025-02-22','Delivered'),
(105,1,'2025-03-05','Delivered'),
(106,5,'2025-03-10','Delivered'),
(107,6,'2025-03-20','Pending'),
(108,7,'2025-04-05','Delivered'),
(109,8,'2025-04-20','Delivered'),
(110,9,'2025-05-08','Delivered'),
(111,10,'2025-05-25','Cancelled'),
(112,11,'2025-06-10','Delivered'),
(113,12,'2025-06-22','Delivered'),
(114,13,'2025-07-05','Delivered'),
(115,14,'2025-07-15','Delivered'),
(116,15,'2025-08-08','Pending'),
(117,16,'2025-08-25','Delivered'),
(118,17,'2025-09-05','Delivered'),
(119,18,'2025-09-20','Delivered'),
(120,19,'2025-10-05','Cancelled'),
(121,20,'2025-10-18','Delivered'),
(122,1,'2025-11-02','Delivered'),
(123,2,'2025-11-10','Delivered'),
(124,5,'2025-11-18','Delivered'),
(125,9,'2025-12-01','Delivered'),
(126,12,'2025-12-10','Delivered'),
(127,14,'2025-12-15','Delivered'),
(128,20,'2025-12-20','Delivered'),
(129,3,'2025-12-22','Delivered'),
(130,7,'2025-12-28','Delivered');

INSERT INTO order_items VALUES
(1,101,1,1,55000),
(2,101,6,2,800),
(3,102,2,1,30000),
(4,102,4,1,2500),
(5,103,3,1,18000),
(6,104,7,1,7000),
(7,104,9,1,2200),
(8,105,2,1,30000),
(9,105,5,1,1500),
(10,106,8,1,9000),
(11,106,10,1,5000),
(12,107,15,1,8500),
(13,108,1,1,55000),
(14,108,4,2,2500),
(15,109,11,1,3500),
(16,109,12,2,1200),
(17,110,14,1,6500),
(18,110,6,1,800),
(19,111,2,1,30000),
(20,112,3,1,18000),
(21,112,5,2,1500),
(22,113,1,1,55000),
(23,113,9,1,2200),
(24,114,13,2,2500),
(25,114,12,2,1200),
(26,115,7,1,7000),
(27,115,8,1,9000),
(28,116,2,1,30000),
(29,117,15,1,8500),
(30,117,14,1,6500),
(31,118,10,1,5000),
(32,118,11,1,3500),
(33,119,1,1,55000),
(34,119,6,1,800),
(35,120,4,2,2500),
(36,121,3,1,18000),
(37,121,5,1,1500),
(38,122,1,1,55000),
(39,122,4,1,2500),
(40,123,2,1,30000),
(41,123,6,2,800),
(42,124,7,1,7000),
(43,124,9,1,2200),
(44,125,14,1,6500),
(45,125,15,1,8500),
(46,126,8,1,9000),
(47,126,10,1,5000),
(48,127,13,1,2500),
(49,127,11,1,3500),
(50,128,1,1,55000),
(51,128,4,1,2500),
(52,129,3,1,18000),
(53,129,12,3,1200),
(54,130,2,1,30000),
(55,130,5,1,1500);

-- ============================================================
-- 3. BASIC SQL PRACTICE
-- ============================================================

-- Q1. Show all customers
SELECT * FROM customers;

-- Q2. Show all products
SELECT * FROM products;

-- Q3. Customers from Maharashtra
SELECT *
FROM customers
WHERE state = 'Maharashtra';

-- Q4. Products above Rs. 5000
SELECT *
FROM products
WHERE price > 5000;

-- Q5. Unique cities
SELECT DISTINCT city
FROM customers
ORDER BY city;

-- Q6. Most expensive products
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

-- Q7. Customers who joined in 2025
SELECT *
FROM customers
WHERE EXTRACT(YEAR FROM signup_date) = 2025;

-- Q8. Orders placed in December
SELECT *
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 12;

-- ============================================================
-- 4. AGGREGATE FUNCTIONS
-- ============================================================

-- Q9. Total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Q10. Total products
SELECT COUNT(*) AS total_products
FROM products;

-- Q11. Total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Q12. Delivered orders
SELECT COUNT(*) AS delivered_orders
FROM orders
WHERE status = 'Delivered';

-- Q13. Average product price
SELECT ROUND(AVG(price),2) AS average_price
FROM products;

-- Q14. Minimum and maximum product price
SELECT
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM products;

-- Q15. Total quantity sold
SELECT SUM(quantity) AS total_quantity
FROM order_items;

-- ============================================================
-- 5. GROUP BY / HAVING
-- ============================================================

-- Q16. Customers by state
SELECT state, COUNT(*) AS customer_count
FROM customers
GROUP BY state
ORDER BY customer_count DESC;

-- Q17. Products by category
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
ORDER BY product_count DESC;

-- Q18. Average price by category
SELECT
    category,
    ROUND(AVG(price),2) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;

-- Q19. Categories with average price above Rs. 5000
SELECT
    category,
    ROUND(AVG(price),2) AS average_price
FROM products
GROUP BY category
HAVING AVG(price) > 5000;

-- Q20. Orders by status
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY order_count DESC;

-- ============================================================
-- 6. JOINS
-- ============================================================

-- Q21. Customer + order details
SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    o.status
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY o.order_date;

-- Q22. Full order detail with product
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    p.product_name,
    p.category,
    oi.quantity,
    oi.price,
    oi.quantity * oi.price AS line_total
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- Q23. Customers who have placed orders
SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;

-- Q24. All customers including those with no orders
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- ============================================================
-- 7. BUSINESS / REVENUE ANALYSIS
-- ============================================================

-- Q25. Total revenue from delivered orders
SELECT ROUND(SUM(oi.quantity * oi.price),2) AS total_revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Delivered';

-- Q26. Revenue by product
SELECT
    p.product_name,
    ROUND(SUM(oi.quantity * oi.price),2) AS revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Q27. Revenue by category
SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.price),2) AS revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;

-- Q28. Top 5 customers by spending
SELECT
    c.customer_name,
    ROUND(SUM(oi.quantity * oi.price),2) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 5;

-- Q29. Average Order Value (AOV)
WITH order_sales AS (
    SELECT
        o.order_id,
        SUM(oi.quantity * oi.price) AS order_value
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY o.order_id
)
SELECT ROUND(AVG(order_value),2) AS average_order_value
FROM order_sales;

-- Q30. Orders with value above Rs. 30000
WITH order_sales AS (
    SELECT
        o.order_id,
        SUM(oi.quantity * oi.price) AS order_value
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.order_id
)
SELECT *
FROM order_sales
WHERE order_value > 30000
ORDER BY order_value DESC;

-- ============================================================
-- 8. DATE / MONTHLY ANALYSIS
-- ============================================================

-- Q31. Monthly revenue
SELECT
    DATE_TRUNC('month', o.order_date)::date AS month,
    ROUND(SUM(oi.quantity * oi.price),2) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;

-- Q32. Monthly order count
SELECT
    DATE_TRUNC('month', order_date)::date AS month,
    COUNT(*) AS order_count
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

-- Q33. Quarter-wise revenue
SELECT
    EXTRACT(QUARTER FROM o.order_date) AS quarter,
    ROUND(SUM(oi.quantity * oi.price),2) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY EXTRACT(QUARTER FROM o.order_date)
ORDER BY quarter;

-- ============================================================
-- 9. CASE WHEN
-- ============================================================

-- Q34. Product price classification
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 50000 THEN 'High Price'
        WHEN price >= 5000 THEN 'Medium Price'
        ELSE 'Low Price'
    END AS price_category
FROM products
ORDER BY price DESC;

-- Q35. Order status classification
SELECT
    order_id,
    status,
    CASE
        WHEN status = 'Delivered' THEN 'Successful'
        WHEN status = 'Cancelled' THEN 'Unsuccessful'
        ELSE 'In Progress'
    END AS order_category
FROM orders;

-- ============================================================
-- 10. SUBQUERIES
-- ============================================================

-- Q36. Products priced above average
SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;

-- Q37. Customers who placed more than one order
SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 1
);

-- ============================================================
-- 11. CTE
-- ============================================================

-- Q38. Customers spending above Rs. 50000
WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * oi.price) AS total_spending
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    ROUND(total_spending,2) AS total_spending
FROM customer_sales
WHERE total_spending > 50000
ORDER BY total_spending DESC;

-- Q39. Top product using CTE
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.status = 'Delivered'
    GROUP BY p.product_id, p.product_name
)
SELECT *
FROM product_sales
ORDER BY revenue DESC
LIMIT 1;

-- ============================================================
-- 12. WINDOW FUNCTIONS
-- ============================================================

-- Q40. Product revenue ranking
WITH product_sales AS (
    SELECT
        p.product_name,
        SUM(oi.quantity * oi.price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.status = 'Delivered'
    GROUP BY p.product_name
)
SELECT
    product_name,
    ROUND(revenue,2) AS revenue,
    RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM product_sales
ORDER BY revenue_rank;

-- Q41. Category-wise product ranking
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        SUM(oi.quantity * oi.price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.status = 'Delivered'
    GROUP BY p.product_id, p.product_name, p.category
)
SELECT
    product_name,
    category,
    ROUND(revenue,2) AS revenue,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY revenue DESC
    ) AS category_rank
FROM product_sales
ORDER BY category, category_rank;

-- Q42. Customer order sequence
SELECT
    customer_id,
    order_id,
    order_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS order_number
FROM orders
ORDER BY customer_id, order_date;

-- ============================================================
-- 13. LAG / SALES TREND
-- ============================================================

-- Q43. Monthly revenue and previous month revenue
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', o.order_date)::date AS month,
        SUM(oi.quantity * oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY DATE_TRUNC('month', o.order_date)
)
SELECT
    month,
    ROUND(revenue,2) AS revenue,
    ROUND(
        LAG(revenue) OVER (ORDER BY month),2
    ) AS previous_month_revenue
FROM monthly_sales
ORDER BY month;

-- Q44. Monthly revenue growth %
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', o.order_date)::date AS month,
        SUM(oi.quantity * oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY DATE_TRUNC('month', o.order_date)
),
sales_with_previous AS (
    SELECT
        month,
        revenue,
        LAG(revenue) OVER (ORDER BY month) AS previous_revenue
    FROM monthly_sales
)
SELECT
    month,
    ROUND(revenue,2) AS revenue,
    ROUND(previous_revenue,2) AS previous_revenue,
    ROUND(
        ((revenue - previous_revenue) / NULLIF(previous_revenue,0)) * 100,
        2
    ) AS growth_percentage
FROM sales_with_previous
ORDER BY month;

-- ============================================================
-- 14. BUSINESS ANALYST QUESTIONS
-- ============================================================

-- Q45. Delivered vs Cancelled percentage
SELECT
    status,
    COUNT(*) AS order_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM orders
GROUP BY status
ORDER BY order_count DESC;

-- Q46. State-wise revenue
SELECT
    c.state,
    ROUND(SUM(oi.quantity * oi.price),2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.state
ORDER BY revenue DESC;

-- Q47. Customers with no orders
SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q48. Best-selling products by quantity
SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.product_name
ORDER BY units_sold DESC;

-- Q49. Repeat customers
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;

-- Q50. Low-performing products (revenue below Rs. 5000)
SELECT
    p.product_name,
    COALESCE(SUM(
        CASE WHEN o.status = 'Delivered'
             THEN oi.quantity * oi.price
             ELSE 0
        END
    ),0) AS revenue
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
LEFT JOIN orders o
    ON oi.order_id = o.order_id
GROUP BY p.product_id, p.product_name
HAVING COALESCE(SUM(
    CASE WHEN o.status = 'Delivered'
         THEN oi.quantity * oi.price
         ELSE 0
    END
),0) < 5000
ORDER BY revenue;

-- ============================================================
-- PROJECT KPIs - FINAL DASHBOARD QUERY
-- ============================================================

SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT COUNT(*) FROM orders WHERE status = 'Delivered') AS delivered_orders,
    (SELECT COUNT(*) FROM orders WHERE status = 'Cancelled') AS cancelled_orders,
    (SELECT COUNT(*) FROM orders WHERE status = 'Pending') AS pending_orders,
    (
        SELECT ROUND(SUM(oi.quantity * oi.price),2)
        FROM order_items oi
        JOIN orders o ON oi.order_id = o.order_id
        WHERE o.status = 'Delivered'
    ) AS total_revenue;

-- ============================================================
-- END OF PROJECT
-- ============================================================
