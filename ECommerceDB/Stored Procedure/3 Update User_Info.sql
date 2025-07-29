--3 Creating stored procedure for updating user information

USE tflecommerce;

DELIMITER//

CREATE PROCEDURE UpdateUser(
    IN p_user_id INT,
    IN p_email VARCHAR(50),
    IN p_address VARCHAR(255)

)

BEGIN

    UPDATE users
    Set email=p_email,
        address=p_address
    WHERE id=p_user_id;
END//

DELIMITER;


CALL UpdateUser(1,'2nd@gmail','pune');