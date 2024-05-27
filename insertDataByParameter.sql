# insert procedural
DELIMITER //
DROP PROCEDURE IF EXISTS insertBrandData //
create procedure insertBrandData(
    in inputName varchar(100)
)
BEGIN
insert into brands (name, slug) value (inputName, generateSlug(inputName));
END //

DELIMITER //;

# calling insert method
call insertBrandData('The cloth two');