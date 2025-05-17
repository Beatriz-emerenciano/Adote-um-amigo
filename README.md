# 🎓 Projeto de Banco de Dados para um Abrigo

### 👥 Integrantes:
- *Beatriz Cristina Emerenciano* — RA: 22.222.041-0  
- *Camila Laurindo Reis* — RA: 22.222.037-8  
- *João Guilherme Rogante* — RA: 22.223.081-5

## 📌 Descrição do Projeto
Este projeto tem como objetivo implementar um sistema de banco de dados relacional para gerenciar abrigos e o fluxo de doações e adoções de animais, garantindo o registro completo de cada entidade e relacionamento envolvido:

- Cadastro de abrigos, voluntários, veterinários, doadores e adotantes

- Registro de animais com dados de nascimento, peso e espécie

- Controle de doações (origem) e adoções (destino), incluindo datas e condição física

- Atribuição de voluntários aos abrigos e de veterinários aos atendimentos

- Geração de relatórios gerenciais, como número de animais por abrigo e tempo médio até adoção

## ⚙️ Tutorial de Execução do Projeto

### 🔹 Etapa 1: Criação do Banco de Dados e das Tabelas
1. Abra o pgAdmin 4 e conecte-se ao servidor PostgreSQL.

2. Crie um novo banco de dados, por exemplo abrigos_animais.

3. Clique com o botão direito em abrigos_animais → Query Tool.

4. Abra no VSCode (ou editor de sua preferência) o arquivo criar_tabelas_abrigos.sql.

5. Copie todo o conteúdo e cole no Query Tool.

6. Execute (▶️) para criar as tabelas:

- abrigo, voluntario, veterinario, doador, adotante

- animal

- associações N:M: trabalha_em, cuida

- registros: doacao, adocao
Execute os comandos para criar todas as tabelas necessárias, como:
abrigo, voluntario, veterinario, doador, adotante, animal, além dos relacionamentos N:M trabalha_em e cuida, e das tabelas de registro doacao e adocao.

 ### 🔹 Etapa 2: Geração e Inserção de Dados Fictícios
🛠️ Passo 1 – Script Python
1 . Abra o arquivo dados_ficticios.py.
2. Execute no seu ambiente Python.
3. Copie os comandos INSERT INTO gerados e cole no Query Tool.
4. Execute os comandos para popular as tabelas.

#### 📁 Passo 2 – Inserção via SQL

1. Abra o arquivo tabelas.sql.
2. Copie os comandos INSERT e execute no Query Tool do pgAdmin.

### 🔹 Etapa 3: Validação dos Dados

- Acesse o arquivo validaçãodeconsistencia.sql.
- Execute cada consulta individualmente no Query Tool para garantir a consistência e qualidade dos dados inseridos.
  
### 🔹 Etapa 4: Consultas Avançadas e Análises
1. Acesse o arquivo consultasAvancadas.sql (ou outro arquivo onde essas queries foram organizadas).
2.Execute cada consulta individualmente no Query Tool do pgAdmin para analisar os dados já inseridos.

📌 Algumas validações realizadas:

- Animais adotados com nome do adotante e data da adoção

- Total de animais atualmente em cada abrigo

- Veterinários e quantidade de animais sob seus cuidados

- Nome do animal, doador e condição na doação

- Voluntários e os abrigos em que trabalham


## 🗂️ Modelagem de Dados (MER e MR)

O projeto inclui a modelagem conceitual e relacional do sistema, com base nas seguintes entidades e relacionamentos:

*Modelo ME:*

![image](https://github.com/user-attachments/assets/356b45b7-dea5-4888-ae28-38f3e42b53b0)


### Entidades Principais:

- Abrigo: Responsável por abrigar animais e contar com o trabalho de voluntários.

- Voluntário: Trabalha em abrigos auxiliando nos cuidados dos animais.

- Veterinário: Cuida de um ou mais animais abrigados, oferecendo assistência médica.

- Animal: Pode ser doado por um doador, adotado por um adotante, abrigado em um abrigo e cuidado por um veterinário.

- Doador: Pessoa que doa animais ao abrigo, informando sua condição no momento da doação.

- Adotante: Pessoa que adota animais previamente doados e abrigados.

### Relacionamentos:

- cuida, abriga, tem, trabalha, adota, doa, adotado, doado.

*Modelo-MER:*
![{2D8E0269-3451-495F-9912-4F033B946EC7}](https://github.com/user-attachments/assets/ca20d14d-14c3-46de-b6a3-89e70d5dc207)



## 🧰 Tecnologias e Ferramentas Utilizadas

| Tecnologia        | Finalidade                                     |
|-------------------|------------------------------------------------|
| *PostgreSQL*    | Sistema gerenciador do banco de dados         |
| *pgAdmin 4*     | Interface gráfica para criação e execução de queries |
| *Python + Faker*| Geração automatizada de dados fictícios       |




