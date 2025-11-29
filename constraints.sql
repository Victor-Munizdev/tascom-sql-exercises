-- CHECK: valida sexo
ALTER TABLE paciente 
ADD CONSTRAINT ck_paciente_sexo CHECK (tp_sexo IN ('M','F','A'));

ALTER TABLE medico 
ADD CONSTRAINT ck_medico_sexo CHECK (tp_sexo IN ('M','F','A'));

-- CHECK: tipos sanguíneos permitidos
ALTER TABLE paciente 
ADD CONSTRAINT ck_paciente_sangue CHECK (tp_sangue IN ('A+','A-','B+','B-','AB+','AB-','O+','O-'));

-- UNIQUE: impedir CPFs duplicados
ALTER TABLE paciente 
ADD CONSTRAINT un_paciente_cpf UNIQUE (cpf);

-- FK necessárias para relacionamentos
ALTER TABLE agenda 
ADD CONSTRAINT fk_agenda_paciente FOREIGN KEY (cd_paciente) REFERENCES paciente(cd_paciente);

ALTER TABLE agenda 
ADD CONSTRAINT fk_agenda_medico FOREIGN KEY (cd_medico) REFERENCES medico(cd_medico);

ALTER TABLE carteira
ADD CONSTRAINT fk_carteira_paciente FOREIGN KEY (cd_paciente) REFERENCES paciente(cd_paciente);

ALTER TABLE carteira
ADD CONSTRAINT fk_carteira_plano FOREIGN KEY (cd_plano) REFERENCES plano(cd_plano);