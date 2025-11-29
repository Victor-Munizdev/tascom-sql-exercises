-- Arquivo para inserir dados iniciais nas tabelas do banco de dados
INSERT INTO usuarios (nome, email, senha_hash, criado_em)
VALUES ('Administrador', 'admin@tascom.com', 'e10adc3949ba59abbe56e057f20f883e', NOW()); -- senha '123456' em MD5

INSERT INTO perfis (usuario_id, cargo, criado_em)
VALUES (1, 'Administrador do Sistema', NOW());
