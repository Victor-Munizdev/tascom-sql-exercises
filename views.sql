-- VIEW com médico, especialidade, paciente, convênio e data/hora (Parte 6)
CREATE OR REPLACE VIEW vw_agenda_completa AS
SELECT m.nm_medico,
       e.nm_especialidade,
       p.nm_paciente,
       c.cd_convenio,
       a.dt_agenda
FROM agenda a
JOIN medico m ON m.cd_medico = a.cd_medico
JOIN especialidade_medico em ON em.cd_medico = m.cd_medico
JOIN especialidade e ON e.cd_especialidade = em.cd_especialidade
JOIN paciente p ON p.cd_paciente = a.cd_paciente
LEFT JOIN carteira c ON c.cd_paciente = p.cd_paciente;

-- VIEW de quantidade de consultas por médico (Parte 7)
CREATE OR REPLACE VIEW vw_qtde_consultas_medico AS
SELECT cd_medico, COUNT(*) AS total_consultas
FROM agenda
GROUP BY cd_medico;

-- VIEW percentual de pacientes por sexo (Parte 7)
CREATE OR REPLACE VIEW vw_percentual_sexo AS
SELECT tp_sexo,
       ROUND((COUNT(*) / (SELECT COUNT(*) FROM paciente)) * 100, 2) AS percentual
FROM paciente
GROUP BY tp_sexo;
