DELIMITER $$

CREATE PROCEDURE stars(r INT) 
    BEGIN 
        WHILE r <= 20 DO 
            SELECT repeat('* ', r);
            SET r = r + 1;
            END WHILE;
    END; $$
    


CALL stars(1);