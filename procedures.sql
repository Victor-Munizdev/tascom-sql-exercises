DELIMITER $$

-- Exemplo: criação de usuário completo (usuario + perfil)
CREATE PROCEDURE criar_usuario_com_perfil(
    IN nome_input VARCHAR(255),
    IN email_input VARCHAR(255),
    IN senha_hash_input VARCHAR(255),
    IN cargo_input VARCHAR(255)
)
BEGIN
    DECLARE novo_usuario_id INT;

    INSERT INTO usuarios (nome, email, senha_hash, criado_em)
    VALUES (nome_input, email_input, senha_hash_input, NOW());

    SET novo_usuario_id = LAST_INSERT_ID();

    INSERT INTO perfis (usuario_id, cargo, criado_em)
    VALUES (novo_usuario_id, cargo_input, NOW());
END$$

DELIMITER ;
