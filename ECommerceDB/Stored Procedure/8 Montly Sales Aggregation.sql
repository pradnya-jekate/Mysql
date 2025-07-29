--8 Creating a stored procedure for Montly Sales Aggregation

USE tflecommerce;

DELIMITER//

CREATE PROCEDURE MonthlySalesReport(
    IN p_year INT,
    IN p_month INT
)

BEGIN
    SELECT p.id AS product_id, p.name AS product_name,
           SUM(o1.quantity) AS total_quantity_sold,
           SUM(o1.quantity * p.price) AS total_sales
    FROM orders o
    JOIN order_item o1 ON o.id= o1.order_id
    JOIN products p ON o1.item_id=p.id
    WHERE YEAR(o.order_date)=p_year AND MONTH(o.order_date)=p_month
    GROUP BY p.id,p.name;

END//

DELIMITER;

CALL MonthlySalesReport(2024,8);