--6.creating a stored procedure for low stock alert

USE tflecommerce;

DELIMITER//

CREATE PROCEDURE LowStockAlert(
    
    IN p_threshold INTO

)

BEGIN
    SELECT id,name,stock
    FROM products
    WHERE stock<p_threshold;
END//

DELIMITER;

CALL LowStockAlert(10);
