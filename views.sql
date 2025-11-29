--- View para facilitar relatórios de usuários com seus respectivos perfis.
CREATE OR REPLACE VIEW vw_usuarios_com_perfis AS
SELECT 
    u.id AS usuario_id,
    u.nome AS nome_usuario,
    u.email,
    p.cargo,
    u.criado_em
FROM usuarios u
LEFT JOIN perfis p ON p.usuario_id = u.id;
