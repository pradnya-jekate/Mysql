--Trigger to update stock after an order is placed

USE tflecommerce;

DELIMITER//
CREATE TRIGGER after_order_insert
AFTER INSERT ON orders 
FOR EACH ROW
BEGIN

    --update stock for each item in the order
    UPDATE products p
    JOIN order_items oi ON p.id=oi.item_id
    SET p.stock = p.stock-oi.quantity
    WHERE oi.order_id = NEW.id;

END//

DELIMITER;