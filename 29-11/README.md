# Clínica Odontológica - Sorriso Feliz

Este projeto contém o script SQL para criar o banco de dados da clínica odontológica "Sorriso Feliz" em PostgreSQL.

## Como conectar ao Supabase

1. **Criar um projeto no Supabase:**
   - Acesse [supabase.com](https://supabase.com) e crie uma conta.
   - Crie um novo projeto.

2. **Obter a string de conexão:**
   - No painel do projeto, vá para "Settings" > "Database".
   - Copie a "Connection string" (formato: `postgresql://postgres:[password]@[host]:5432/postgres`).

3. **Conectar via psql (linha de comando):**
   - Instale o PostgreSQL se necessário (inclui psql).
   - Execute: `psql "postgresql://postgres:[password]@[host]:5432/postgres"`
   - Substitua `[password]` e `[host]` pelos valores reais.

4. **Executar o script:**
   - Uma vez conectado, execute: `\i clinica_odontologica.sql`
   - Ou copie e cole o conteúdo do arquivo no editor SQL do Supabase.

5. **Alternativa: Usar pgAdmin ou DBeaver:**
   - Configure uma nova conexão com os dados do Supabase.
   - Execute o script SQL no editor.

## Estrutura do Banco

- **Especialidade:** especialidade_id, nome
- **Dentista:** dentista_id, nome, cro, ddd, telefone, especialidade_id
- **Paciente:** paciente_id, nome, cpf, ddd, telefone, bairro, data_cadastro
- **Agenda:** agenda_id, data, horario, procedimento, dentista_id, valor_consulta
- **Consulta:** agenda_id, paciente_id, situacao

## Consultas Implementadas

1. Dentistas e especialidades
2. Especialidades sem dentistas
3. Quantidade de pacientes por data
4. Dentistas e agendas por data
5. Consultas marcadas (desafio)