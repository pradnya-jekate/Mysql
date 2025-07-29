--5 Creating a stored procedure for Retrieving order details

USE tflecommerce;

DROP PROCEDURE IF EXISTS GetOrderDetails;
DELIMITER//

CREATE PROCEDURE GetOrderDetails(
    
    IN p_order_id INT

)
BEGIN
    SELECT o.id AS order_id, o.order_date, o.shipping_address, o.total_amount, 
           o1.item_id, p.name AS product_name, o1.quantity, p.price
    FROM orders o
    JOIN order_items o1 ON=o1.order_id
    JOIN products p ON o1.item_id=p.id
    WHERE o.id=p_order_id;    

END//
DELIMITER;

CALL GetOrderDetails(2);