
# generate slug start
DELIMITER $$
-- Drop the existing procedure if it exists
DROP FUNCTION IF EXISTS generateSlug $$

-- Create the new procedure
CREATE FUNCTION generateSlug(title VARCHAR(255))
    RETURNS VARCHAR(255)
    DETERMINISTIC
BEGIN
    DECLARE slug VARCHAR(255);

    -- Replace spaces with hyphens
    SET slug = REPLACE(LOWER(TRIM(title)), ' ', '-');

    -- Remove special characters (leaving only alphanumeric and hyphens)
    SET slug = REGEXP_REPLACE(slug, '[^a-z0-9-]', '');

    -- Remove consecutive hyphens
    SET slug = REGEXP_REPLACE(slug, '-+', '-');

    -- Remove leading and trailing hyphens
    SET slug = TRIM(BOTH '-' FROM slug);

RETURN slug;
END $$

DELIMITER ;