--4 Creating a stored procedure for Applying a discount code

USE tflecommerce;

DELIMITER//

CREATE PROCEDURE ApplyDiscount(
    IN p_order_id INT,
    IN p_discount_code VARCHAR(50)
)

BEGIN
    DECLARE v_discount DECIMAL(5,2);
    DECLARE v_total DECIMAL(10,2);

    --Retrieve discount percentage from the discount_code table
    SELECT discount_percentage INTO v_discount
    FROM discount_codes
    WHERE Code=p_discount_code AND NOW() BETWEEN start_date AND end_date;

    IF v_discount IS NOT NULL then
    --get the current total amount of the order
         SELECT total_amount INTO v_total
         FROM orders
        WHERE id=p_order_id;

    --applying the discount

        SET v_total=v_total-(v_total*(v_discount/100));

    --updating the order with the discounted amount

        UPDATE orders
        SET totsl_smount=v_total
        WHERE id=p_order_id;

    ELSE 
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Invalid or expired discount code';
    END IF;     

END//

DELIMITER;

--Call the stored procedure with test parameters

SELECT * FROM discount_codes WHERE code='INDEPENDENCE23';
CALL ApplyDiscount(1,'INDEPENDENCE23');