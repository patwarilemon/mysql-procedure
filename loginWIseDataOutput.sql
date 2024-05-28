# procedure start
DELIMITER //
DROP PROCEDURE IF EXISTS getTaskPont //
CREATE PROCEDURE getTaskPont(
    OUT less_than_50 INT,
    OUT avg_price FLOAT,
    OUT more_than_300 INT,
    IN amount INT
)
BEGIN
select count(id) into less_than_50 from products where unit_price < amount;
select avg(id) into avg_price from products where unit_price < amount;
select count(id) into more_than_300 from products where unit_price > amount;
END //
DELIMITER //;
# procedure end

# calling start
SET @less_than_50 = 0;
SET @avg_price = 0;
SET @more_than_300 = 0;
call getTaskPont(@less_than_50, @avg_price,@more_than_300,900);
select @less_than_50,@avg_price,@more_than_300;
# calling end