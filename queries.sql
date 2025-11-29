-- Consultas SQL da Parte 5

-- 18. Liste todos os pacientes e seus respectivos convênios
SELECT p.nm_paciente, c.nm_convenio
FROM paciente p
LEFT JOIN carteira ca ON p.cd_paciente = ca.cd_paciente
LEFT JOIN plano pl ON ca.cd_plano = pl.cd_plano
LEFT JOIN convenio c ON pl.cd_convenio = c.cd_convenio;

-- 19. Liste os médicos e suas especialidades
SELECT m.nm_medico, e.nm_especialidade
FROM medico m
JOIN especialidade_medico em ON m.cd_medico = em.cd_medico
JOIN especialidade e ON em.cd_especialidade = e.cd_especialidade;

-- 20. Mostre todas as agendas futuras (data maior que a atual)
SELECT * FROM agenda
WHERE dt_agenda > SYSDATE;

-- 21. Liste pacientes do sexo feminino atendidos por determinado convênio
-- Assumindo um convênio específico, ex: cd_convenio = 1
SELECT p.nm_paciente
FROM paciente p
JOIN carteira ca ON p.cd_paciente = ca.cd_paciente
JOIN plano pl ON ca.cd_plano = pl.cd_plano
WHERE p.tp_sexo = 'F' AND pl.cd_convenio = 1;

-- 22. Mostre todos os planos de um convênio específico
-- Ex: cd_convenio = 1
SELECT * FROM plano WHERE cd_convenio = 1;

-- 23. Conte quantos pacientes existem por tipo sanguíneo
SELECT tp_sangue, COUNT(*) AS quantidade
FROM paciente
GROUP BY tp_sangue;

-- 24. Liste o nome do médico, o nome do paciente, o convênio e o horário agendado
SELECT m.nm_medico, p.nm_paciente, c.nm_convenio, a.dt_agenda
FROM agenda a
JOIN medico m ON a.cd_medico = m.cd_medico
JOIN paciente p ON a.cd_paciente = p.cd_paciente
LEFT JOIN carteira ca ON p.cd_paciente = ca.cd_paciente
LEFT JOIN plano pl ON ca.cd_plano = pl.cd_plano
LEFT JOIN convenio c ON pl.cd_convenio = c.cd_convenio;