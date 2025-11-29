-- Índice para melhorar busca por CPF
CREATE INDEX idx_paciente_cpf ON paciente(cpf);

-- Índice para agilizar busca por nome do médico
CREATE INDEX idx_medico_nome ON medico(nm_medico);

-- Índice composto para consultas plano + convênio
CREATE INDEX idx_carteira_plano_convenio ON carteira(cd_plano, cd_convenio);
