/*
===========================
PROJECT 3: SQL DATA ANALYSIS
Dataset: E-Commerce Orders
Internship: DecodeLabs
===========================
*/
SELECT * FROM ECommerce_Orders_Dataset;


-- ========================
-- SECTION A: BASIC SELECT QUERIES
-- ========================

SELECT COUNT(*) AS Total_Records FROM ECommerce_Orders_Dataset;

SELECT OrderID, Product, TotalPrice FROM ECommerce_Orders_Dataset;

SELECT DISTINCT Product FROM ECommerce_Orders_Dataset;

SELECT DISTINCT PaymentMethod FROM ECommerce_Orders_Dataset;


-- ========================
-- SECTION B: WHERE CLAUSE
-- ========================

SELECT * FROM ECommerce_Orders_Dataset
WHERE Quantity > 3;


SELECT * FROM ECommerce_Orders_Dataset
WHERE PaymentMethod = 'Online';


SELECT * FROM ECommerce_Orders_Dataset
WHERE OrderStatus = 'Shipped';


SELECT * FROM ECommerce_Orders_Dataset
WHERE TotalPrice > 1000;


SELECT * FROM ECommerce_Orders_Dataset
WHERE Product LIKE '%Phone%';


-- ========================
-- SECTION C: ORDER BY
-- ========================

SELECT OrderID, Product, TotalPrice FROM ECommerce_Orders_Dataset
ORDER BY TotalPrice DESC;


SELECT OrderID, Product, TotalPrice FROM ECommerce_Orders_Dataset
ORDER BY TotalPrice ASC;


SELECT * FROM ECommerce_Orders_Dataset
ORDER BY Date DESC;


SELECT Product, Quantity FROM ECommerce_Orders_Dataset
ORDER BY Quantity DESC;


-- ========================
-- SECTION D: COUNT
-- ========================

SELECT COUNT(*) AS Total_Orders 
FROM ECommerce_Orders_Dataset;


SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM ECommerce_Orders_Dataset;


SELECT PaymentMethod,
       COUNT(*) AS Total_Orders
FROM ECommerce_Orders_Dataset
GROUP BY PaymentMethod;


-- ========================
-- SECTION E: SUM
-- ========================

SELECT SUM(TotalPrice) AS Total_Revenue
FROM ECommerce_Orders_Dataset;


SELECT SUM(Quantity) AS Total_Items_Sold
FROM ECommerce_Orders_Dataset;


SELECT Product,
       SUM(TotalPrice) AS Revenue
FROM ECommerce_Orders_Dataset
GROUP BY Product;


SELECT PaymentMethod,
       SUM(TotalPrice) AS Revenue
FROM ECommerce_Orders_Dataset
GROUP BY PaymentMethod;

-- ========================
-- SECTION F: AVERAGE
-- ========================

SELECT AVG(TotalPrice) AS Average_Order_Value
FROM ECommerce_Orders_Dataset;


SELECT AVG(Quantity) AS Avg_Quantity
FROM ECommerce_Orders_Dataset;


SELECT Product,
       AVG(TotalPrice) AS Avg_Revenue
FROM ECommerce_Orders_Dataset
GROUP BY Product;


-- ========================
-- SECTION G: GROUP BY
-- ========================

SELECT Product,
       COUNT(*) AS Total_Orders
FROM ECommerce_Orders_Dataset
GROUP BY Product;


SELECT OrderStatus,
       COUNT(*) AS Total_Orders
FROM ECommerce_Orders_Dataset
GROUP BY OrderStatus;


SELECT OrderStatus,
       COUNT(*) AS Total_Orders
FROM ECommerce_Orders_Dataset
GROUP BY OrderStatus;


SELECT ReferralSource,
       SUM(TotalPrice) AS Revenue
FROM ECommerce_Orders_Dataset
GROUP BY ReferralSource;


-- ========================
-- SECTION H: COMBINED QUERIES
-- ========================

SELECT Product,
       SUM(TotalPrice) AS Revenue
FROM ECommerce_Orders_Dataset
GROUP BY Product
ORDER BY Revenue DESC
LIMIT 5;


SELECT PaymentMethod,
       SUM(TotalPrice) AS Revenue
FROM ECommerce_Orders_Dataset
GROUP BY PaymentMethod
ORDER BY Revenue DESC;


SELECT ReferralSource,
       SUM(TotalPrice) AS Revenue
FROM ECommerce_Orders_Dataset
GROUP BY ReferralSource
ORDER BY Revenue DESC;


SELECT PaymentMethod,
       AVG(TotalPrice) AS Average_Order_Value
FROM ECommerce_Orders_Dataset
GROUP BY PaymentMethod
ORDER BY Average_Order_Value DESC;


-- ========================
-- Products Generating More Than 50,000 Revenue
-- ========================

SELECT Product,
       SUM(TotalPrice) AS Revenue
FROM ECommerce_Orders_Dataset
GROUP BY Product
HAVING SUM(TotalPrice) > 50000
ORDER BY Revenue DESC;
