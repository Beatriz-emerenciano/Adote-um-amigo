CREATE TABLE Abrigo (
    id_abrigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    capacidade INT NOT NULL,
    endereco VARCHAR(200)
);

CREATE TABLE Animal (
    id_animal SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    peso NUMERIC(5,2),
    especie VARCHAR(50),
    id_abrigo INT REFERENCES Abrigo(id_abrigo)
);

CREATE TABLE Doador (
    id_doador SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Adotante (
    id_adotante SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Voluntario (
    id_voluntario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Veterinario (
    id_veterinario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela de relacionamento com atributos
CREATE TABLE Doacao (
    id_doador INT REFERENCES Doador(id_doador),
    id_animal INT REFERENCES Animal(id_animal),
    data_doacao DATE,
    condicao_animal VARCHAR(100),
    PRIMARY KEY (id_doador, id_animal)
);

CREATE TABLE Adocao (
    id_animal INT PRIMARY KEY REFERENCES Animal(id_animal),
    id_adotante INT REFERENCES Adotante(id_adotante)
);

CREATE TABLE Trabalha_em (
    id_voluntario INT REFERENCES Voluntario(id_voluntario),
    id_abrigo INT REFERENCES Abrigo(id_abrigo),
    PRIMARY KEY (id_voluntario, id_abrigo)
);

CREATE TABLE Cuida (
    id_veterinario INT REFERENCES Veterinario(id_veterinario),
    id_animal INT REFERENCES Animal(id_animal),
    PRIMARY KEY (id_veterinario, id_animal)
);
