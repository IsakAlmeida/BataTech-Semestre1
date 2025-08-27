-- SPRINT 1 
-- CRIAÇÃO BANCO DE DADOS

CREATE DATABASE batatech;
USE batatech;

-- CRIAÇÃO DA TABELA platacao
CREATE TABLE plantacao(
idLeitura INT PRIMARY KEY AUTO_INCREMENT,
dataLeitura DATETIME,
sensorUmidade INT,
sensorTemperatura INT
);

-- CRIAÇÃO DA TABELA usuario
CREATE TABLE usuario(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60),
email VARCHAR(80) NOT NULL,
CONSTRAINT chkEmail CHECK(email LIKE '%@batatech.com'),
senha VARCHAR(50),
permissao VARCHAR(30),
CONSTRAINT chkPermissao CHECK(permissao IN ('admin','analista'))
);

-- INSERÇÃO DADOS TABELA plantacao
INSERT INTO plantacao(dataLeitura,sensorUmidade,sensorTemperatura) VALUES
(current_timestamp(),50,25),
(current_timestamp(),56,25),
(current_timestamp(),54,25),
(current_timestamp(),61,26),
(current_timestamp(),50,25),
(current_timestamp(),56,25),
(current_timestamp(),54,25),
(current_timestamp(),61,26),
(current_timestamp(),50,25),
(current_timestamp(),56,25),
(current_timestamp(),54,25),
(current_timestamp(),61,26),
(current_timestamp(),50,25),
(current_timestamp(),56,25),
(current_timestamp(),54,25),
(current_timestamp(),61,26),
(current_timestamp(),50,25),
(current_timestamp(),56,25),
(current_timestamp(),54,25),
(current_timestamp(),61,26),
(current_timestamp(),59,25);

SELECT * FROM plantacao;

-- INSERÇÃO DADOS NA TABELA usuario
INSERT INTO usuario(nome, email, senha, permissao) VALUES
('Admin','admin@batatech.com','12345678','admin'),
('Root','root@batatech.com','rootroot','admin'),
('José Batata','jose.batata@batatech.com','ilovebatata','analista'),
('Mario Batateiro','mario.batateiro@batatech.com','batata123','analista');

SELECT * FROM usuario;
