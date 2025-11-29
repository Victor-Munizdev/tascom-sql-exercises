-- Criar banco de dados
CREATE schema sorriso_feliz;

-- Tipo ENUM para situação
-- C: Cancelada, R: Realizada, A: Agendada, M: Marcada
CREATE TYPE situacao_consulta AS ENUM ('C', 'R', 'A', 'M');

-- Tabela Especialidade
CREATE TABLE Especialidade (
    especialidade_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    CONSTRAINT especialidade_nome_unique UNIQUE (nome)
);

-- Tabela Dentista
CREATE TABLE Dentista (
    dentista_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cro VARCHAR(20) NOT NULL,
    ddd VARCHAR(3) NOT NULL,
    telefone VARCHAR(9) NOT NULL,
    especialidade_id INTEGER NOT NULL,
    CONSTRAINT dentista_cro_unique UNIQUE (cro),
    CONSTRAINT dentista_especialidade_fk FOREIGN KEY (especialidade_id) REFERENCES Especialidade(especialidade_id),
    CONSTRAINT dentista_ddd_check CHECK (ddd ~ '^[0-9]{2,3}$'),
    CONSTRAINT dentista_telefone_check CHECK (telefone ~ '^[0-9]{8,9}$'),
    CONSTRAINT dentista_cro_check CHECK (cro ~ '^[0-9]+$')
);

-- Tabela Paciente
CREATE TABLE Paciente (
    paciente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    ddd VARCHAR(3) NOT NULL,
    telefone VARCHAR(9) NOT NULL,
    bairro VARCHAR(100),
    data_cadastro DATE DEFAULT CURRENT_DATE,
    CONSTRAINT paciente_cpf_unique UNIQUE (cpf),
    CONSTRAINT paciente_ddd_check CHECK (ddd ~ '^[0-9]{2,3}$'),
    CONSTRAINT paciente_telefone_check CHECK (telefone ~ '^[0-9]{8,9}$'),
    CONSTRAINT paciente_cpf_check CHECK (cpf ~ '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$')
);

-- Tabela Agenda
CREATE TABLE Agenda (
    agenda_id SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    procedimento VARCHAR(200) NOT NULL,
    dentista_id INTEGER NOT NULL,
    valor_consulta DECIMAL(10,2) NOT NULL,
    CONSTRAINT agenda_dentista_fk FOREIGN KEY (dentista_id) REFERENCES Dentista(dentista_id),
    CONSTRAINT agenda_data_horario_dentista_unique UNIQUE (data, horario, dentista_id),
    CONSTRAINT agenda_valor_check CHECK (valor_consulta > 0)
);

-- Tabela Consulta
CREATE TABLE Consulta (
    agenda_id INTEGER PRIMARY KEY,
    paciente_id INTEGER NOT NULL,
    situacao situacao_consulta DEFAULT 'M',
    CONSTRAINT consulta_agenda_fk FOREIGN KEY (agenda_id) REFERENCES Agenda(agenda_id),
    CONSTRAINT consulta_paciente_fk FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
);

-- Inserir especialidade
INSERT INTO Especialidade (nome) VALUES
('Ortodontia'),
('Endodontia'),
('Periodontia'),
('Cirurgia');

-- Inserir dentistas
INSERT INTO Dentista (nome, cro, ddd, telefone, especialidade_id) VALUES
('Dr. João Silva', '12345', '11', '999999999', 1),
('Dra. Maria Santos', '67890', '21', '888888888', 2),
('Dr. Pedro Oliveira', '54321', '31', '777777777', 3);

-- Inserir paciente
INSERT INTO Paciente (nome, cpf, ddd, telefone, bairro, data_cadastro) VALUES
('Ana Costa', '123.456.789-00', '11', '111111111', 'Centro', '2023-01-01'),
('Bruno Lima', '234.567.890-11', '21', '222222222', 'Jardim', '2023-01-02'),
('Carla Rocha', '345.678.901-22', '31', '333333333', 'Vila', '2023-01-03'),
('Diego Ferreira', '456.789.012-33', '41', '444444444', 'Bairro Novo', '2023-01-04'),
('Elena Gomes', '567.890.123-44', '51', '555555555', 'Praia', '2023-01-05');

-- Inserir agendas
INSERT INTO Agenda (data, horario, procedimento, dentista_id, valor_consulta) VALUES
('2025-11-30', '09:00:00', 'Consulta inicial', 1, 150.00),
('2025-12-01', '10:00:00', 'Tratamento de canal', 2, 200.00),
('2025-12-02', '14:00:00', 'Limpeza', 3, 100.00),
('2025-12-03', '11:00:00', 'Extração', 1, 180.00),
('2025-12-04', '15:00:00', 'Aparelho', 1, 250.00),
('2025-12-05', '08:00:00', 'Consulta de rotina', 2, 120.00),
('2025-12-06', '13:00:00', 'Tratamento gengival', 3, 160.00),
('2025-12-07', '16:00:00', 'Cirurgia', 1, 300.00);

-- Inserir consultas
INSERT INTO Consulta (agenda_id, paciente_id, situacao) VALUES
(1, 1, 'R'),
(2, 2, 'M'),
(3, 3, 'A'),
(4, 4, 'C'),
(5, 5, 'M');

-- Consulta 1: Listar todos os dentistas e sua especialidade
SELECT d.nome AS dentista, e.nome AS especialidade
FROM Dentista d
JOIN Especialidade e ON d.especialidade_id = e.especialidade_id;

-- Consulta 2: Listar especialidades que não possuem dentistas
SELECT e.nome AS especialidade
FROM Especialidade e
LEFT JOIN Dentista d ON e.especialidade_id = d.especialidade_id
WHERE d.dentista_id IS NULL;

-- Consulta 3: Listar quantidade de pacientes cadastrados por data
SELECT data_cadastro, COUNT(*) AS quantidade
FROM Paciente
GROUP BY data_cadastro
ORDER BY data_cadastro;

-- Consulta 4: Listar dentistas e suas agendas, por data
SELECT d.nome AS dentista, a.data, a.horario, a.procedimento
FROM Dentista d
JOIN Agenda a ON d.dentista_id = a.dentista_id
ORDER BY a.data, a.horario;

-- Consulta 5: Listar data, hora, paciente, procedimento e dentista das consultas Marcadas 
SELECT a.data, a.horario, p.nome AS paciente, a.procedimento, d.nome AS dentista
FROM Consulta c
JOIN Agenda a ON c.agenda_id = a.agenda_id
JOIN Paciente p ON c.paciente_id = p.paciente_id
JOIN Dentista d ON a.dentista_id = d.dentista_id
WHERE c.situacao = 'M'
ORDER BY a.data, a.horario;