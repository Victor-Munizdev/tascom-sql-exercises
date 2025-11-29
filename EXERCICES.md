# 🧾 LISTA DE EXERCÍCIOS – BANCO DE DADOS (Modelagem Clínica / Agendamento Médico)

**Disciplina:** Banco de Dados  
**Professor:** Sérgio Paiva  
**Tema:** Continuação e aprimoramento do banco de dados  
**Objetivo:** Aplicar conceitos de integridade, normalização, índices e SQL em um modelo realista de sistema de agendamento médico.

## 👤 Identificação do(a) aluno(a)

Nome: Victor Muniz  
Turma: Turma Dev TASCOM Academy  
Data: 29 / 11 / 2025

## 🧩 PARTE 1 – Revisão da Modelagem

1. Revise os tipos de dados utilizados nas tabelas e corrija eventuais erros de declaração (por exemplo, colunas sem tamanho definido).  
2. Ajuste o tipo de dado da coluna `tp_sexo` nas tabelas que a possuem, para um tipo adequado.  
3. Verifique se todas as tabelas possuem chave primária. Caso alguma não possua, crie-a.  
4. Renomeie as constraints que ultrapassarem o limite de 30 caracteres no Oracle.  
5. Documente abaixo as correções feitas:  

   **📘 Resposta:** ____________________________________________

## 🔐 PARTE 2 – Criação de Constraints

6. Crie uma CHECK CONSTRAINT para permitir apenas os valores 'M', 'F' e 'A' no campo `tp_sexo`.  
7. Crie uma CHECK CONSTRAINT para validar os tipos sanguíneos possíveis (A+, A-, B+, B-, AB+, AB-, O+, O-).  
8. Crie uma CONSTRAINT UNIQUE para evitar CPF duplicado em pacientes.  
9. Verifique e crie chaves estrangeiras que faltarem.

**🧠 Descreva abaixo o que foi criado ou corrigido:**

## ⚙️ PARTE 3 – Índices e Otimização

10. Crie um índice para facilitar buscas de pacientes pelo CPF.  
11. Crie um índice para melhorar consultas pelo nome do médico.  
12. Crie um índice composto envolvendo `cd_plano` e `cd_convenio` na tabela carteira.  
13. Analise e justifique quais consultas mais se beneficiam de índices.

**🧠 Explique sua justificativa:**

## 🧮 PARTE 4 – Integridade e Regras de Negócio

14. Crie uma regra que impeça o agendamento com data anterior ao dia atual.  
15. Crie uma regra que exija que todo paciente possua pelo menos um registro de carteira. Se o atendimento não for particular.  
16. Crie uma regra que impeça o mesmo paciente de ser agendado duas vezes no mesmo horário.  
17. Crie uma regra que garanta que apenas médicos cadastrados possam ser associados a agendas.

**🧠 Explique como implementou cada regra:**

## 📊 PARTE 5 – Consultas SQL

18. Liste todos os pacientes e seus respectivos convênios.  
19. Liste os médicos e suas especialidades.  
20. Mostre todas as agendas futuras (data maior que a atual).  
21. Liste pacientes do sexo feminino atendidos por determinado convênio.  
22. Mostre todos os planos de um convênio específico.  
23. Conte quantos pacientes existem por tipo sanguíneo.  
24. Liste o nome do médico, o nome do paciente, o convênio e o horário agendado.

**🧠 Anote suas consultas SQL:**

## 🧱 PARTE 6 – Melhorias e Normalização

25. Avalie se a tabela `especialidade_medico` precisa de chave primária composta e, se sim, crie-a.  
26. Crie uma VIEW que mostre: médico, especialidade, paciente, convênio e data/hora da agenda. (não foi dada em sala, mas será interessante pesquisar).  
27. Analise se há colunas redundantes e proponha ajustes.  
28. Descreva a função e o relacionamento das principais tabelas do modelo.

**🧠 Anote suas conclusões:**

## 🚀 PARTE 7 – Desafios (Avançado)

29. Crie uma TRIGGER que registre alterações em agendas em uma tabela de log.  
30. Crie uma VIEW que mostre a quantidade de consultas por médico.  
31. Crie uma SEQUENCE para gerar automaticamente o código do paciente.  
32. Crie uma PROCEDURE que liste horários disponíveis de um médico em uma data informada.  
33. Crie uma VIEW que mostre o percentual de pacientes por sexo.

**🧠 Descreva os resultados obtidos:**

## 📚 Entrega

**Data limite:**Próxima aula
**Forma de entrega:** 💻 via Classroom ou 📄 entrega impressa.  
**Critérios de avaliação:**

- Correção técnica (constraints, chaves, integridade)
- Clareza e justificativas
- Organização do código SQL
- Cumprimento de todas as partes