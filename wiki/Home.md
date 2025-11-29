# Projeto de Banco de Dados Médico

## Descrição

Este repositório contém scripts SQL para a criação e configuração de um banco de dados relacional destinado a um sistema médico. O projeto inclui definições para tabelas como pacientes, médicos, agendas, carteiras de planos de saúde, usuários e perfis, além de constraints, funções, procedures, views, índices e triggers para garantir integridade, eficiência e automação no banco de dados.

O banco de dados é projetado para suportar operações típicas de um sistema de gestão hospitalar ou clínica, como agendamento de consultas, gerenciamento de pacientes e controle de usuários.

## Estrutura dos Arquivos

- **`constraints.sql`**: Define constraints de validação (CHECK), unicidade (UNIQUE) e chaves estrangeiras (FOREIGN KEY) para garantir a integridade dos dados nas tabelas.
- **`functions.sql`**: Contém funções definidas pelo usuário, como verificação de existência de emails.
- **`indices.sql`**: Scripts para criação de índices em colunas frequentemente consultadas, visando otimizar o desempenho das consultas.
- **`inserir_dados.sql`**: Dados iniciais para popular as tabelas, incluindo usuários administrativos e perfis padrão.
- **`procedures.sql`**: Procedures armazenadas para operações complexas, como criação de usuários com perfis associados.
- **`views.sql`**: Views para simplificar consultas e gerar relatórios, como visualizações de usuários com seus perfis.
- **`triggers.sql`** e **`triggers_views.sql`**: Triggers para automatizar ações no banco de dados, como atualizações em cascata ou validações automáticas.
- **`.gitignore`**: Arquivo para especificar quais arquivos ou diretórios devem ser ignorados pelo controle de versão Git.

## Pré-requisitos

- Servidor de banco de dados MySQL ou MariaDB (versão 5.7 ou superior recomendada).
- Cliente MySQL para execução dos scripts (como MySQL Workbench, phpMyAdmin ou linha de comando).
- Permissões adequadas no banco de dados para criar tabelas, constraints, funções, etc.

## Como Usar

1. **Criar o Banco de Dados**:
   - Conecte-se ao seu servidor MySQL e crie um novo banco de dados:
     ```sql
     CREATE DATABASE sistema_medico;
     USE sistema_medico;
     ```

2. **Executar os Scripts na Ordem Recomendada**:
   - Assumindo que as tabelas base (paciente, medico, agenda, carteira, plano, usuarios, perfis) já foram criadas em um script separado (não incluído neste repositório), execute os scripts na seguinte ordem para evitar dependências:
     1. `constraints.sql` - Adiciona constraints às tabelas existentes.
     2. `functions.sql` - Cria funções.
     3. `procedures.sql` - Cria procedures.
     4. `views.sql` - Cria views.
     5. `indices.sql` - Adiciona índices.
     6. `triggers.sql` e `triggers_views.sql` - Adiciona triggers.
     7. `inserir_dados.sql` - Insere dados iniciais.

   - Para executar via linha de comando:
     ```bash
     mysql -u [usuario] -p [banco] < constraints.sql
     mysql -u [usuario] -p [banco] < functions.sql
     # E assim por diante...
     ```

3. **Verificação**:
   - Após a execução, verifique se as tabelas, constraints e dados foram criados corretamente consultando o banco.

## Exemplos de Uso

- **Verificar se um email existe**: Use a função `email_existe('exemplo@email.com')`.
- **Criar um usuário com perfil**: Chame a procedure `criar_usuario_com_perfil('Nome', 'email@exemplo.com', 'hash_senha', 'Cargo')`.
- **Consultar usuários com perfis**: `SELECT * FROM vw_usuarios_com_perfis;`.