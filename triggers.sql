-- Trigger para atualizar automaticamente o campo atualizado_em em alterações
CREATE TRIGGER tg_atualiza_timestamp_usuarios
BEFORE UPDATE ON usuarios
FOR EACH ROW
BEGIN
    SET NEW.atualizado_em = NOW();
END;

-- Trigger para prevenir remoção de usuários administradores
CREATE TRIGGER tg_prevent_delete_admin
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
    IF OLD.email = 'admin@tascom.com' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é permitido excluir o usuário administrador principal.';
    END IF;
END;
