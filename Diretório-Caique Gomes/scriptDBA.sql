-- SPRINT 1 
-- CRIAÇÃO BANCO DE DADOS

CREATE DATABASE batatech;
USE batatech;


-- CRIAÇÃO DA TABELA platacao
CREATE TABLE plantacao(
idLeitura INT PRIMARY KEY AUTO_INCREMENT,
dataLeitura DATETIME DEFAULT current_timestamp,
idArduino INT,
sensorUmidade DECIMAL(5,2),
sensorTemperatura DECIMAL(4,2)
);

-- CRIAÇÃO DA TABELA usuario
CREATE TABLE usuario(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60),
email VARCHAR(80) NOT NULL UNIQUE,
CONSTRAINT chkEmail CHECK(email LIKE '%@%.%'),
senha VARCHAR(50),
permissao VARCHAR(30),
CONSTRAINT chkPermissao CHECK(permissao IN ('admin','analista'))
);

-- CRIAÇÃO DA TABELA producao
CREATE TABLE producao(
id INT PRIMARY KEY AUTO_INCREMENT,
dataProducao DATE,
haPlantados INT, 
quilosColhidos int 
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


-- INSERÇÃO DADOS NA TABELA producao
INSERT INTO producao(dataProducao, haPlantados, quilosColhidos)  VALUES
('2025-06-01', 2,25000 ),
('2025-08-10', 1,15000 ),
('2024-01-01', 2,15000 );

SELECT * FROM producao;

