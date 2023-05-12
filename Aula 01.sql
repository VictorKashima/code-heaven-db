CREATE DATABASE code_heaven;

USE code_heaven;

SELECT DATABASE();

ALTER SCHEMA code_heaven RENAME TO fatec;

DROP DATABASE code_heaven;

CREATE DATABASE code_heaven;

CREATE TABLE usuarios(
usu_id int primary key,
usu_nome varchar(100) NOT NULL,
usu_email varchar(100) NOT NULL,
usu_senha varchar(255) NOT NULL,
usu_nivel_acesso ENUM("ADMIN", "CLIENTE") NOT NULL
);

CREATE TABLE categorias(
categ_id INT PRIMARY KEY,
categ_nome VARCHAR(100) NOT NULL
);

CREATE TABLE perfil (
perfil_id INT PRIMARY KEY,
perfil_biografia LONGTEXT NOT NULL,
perfil_data_nascimento DATE NOT NULL,
usu_id INT NOT NULL
);

CREATE TABLE perguntas (
perg_id INT PRIMARY KEY,
perg_titulo VARCHAR(100) NOT NULL,
perg_descricao LONGTEXT NOT NULL,
usu_id INT,
categ_id INT,
conte_id INT
);

CREATE TABLE conteudos (
conte_id INT PRIMARY KEY,
conte_nome VARCHAR(100) NOT NULL,
conte_ordem INT NOT NULL,
conte_icone VARCHAR(255) NOT NULL,
usu_id INT
);

CREATE TABLE mensagens (
msg_id INT PRIMARY KEY,
msg_mensagem LONGTEXT NOT NULL,
msg_data_envio DATE NOT NULL,
msg_remetente_id INT,
msg_destinatario_id INT
);

CREATE TABLE respostas (
resp_id INT PRIMARY KEY,
resp_data DATE NOT NULL,
perg_id INT,
usu_id INT
);