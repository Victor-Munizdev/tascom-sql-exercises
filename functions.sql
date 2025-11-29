DELIMITER $$
-- Função para verificar se email já existe
CREATE FUNCTION email_existe(email_busca VARCHAR(255))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE existe TINYINT;

    SELECT COUNT(*) INTO existe FROM usuarios WHERE email = email_busca;
    RETURN existe > 0;
END$$

DELIMITER ;

