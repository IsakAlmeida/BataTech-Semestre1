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
INSERT INTO plantacao(sensorUmidade,sensorTemperatura) VALUES
(50,25),
(56,25),
(54,25),
(61,26),
(50,25),
(56,25),
(54,25),
(61,26),
(50,25),
(56,25),
(54,25),
(61,26),
(50,25),
(56,25),
(54,25),
(61,26),
(50,25),
(56,25),
(54,25),
(61,26),
(59,25);

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

-- SELECT TABELA producao RETORNA A ESTAÇÃO QUE FOI PLANTADA
SELECT dataProducao, haPlantados, quilosColhidos,
CASE
	WHEN MONTH(dataProducao)IN(12,01,02)  THEN 'VERÃO'
    WHEN MONTH(dataProducao)IN(03,04,05) THEN 'OUTONO'
    WHEN MONTH(dataProducao)IN(06,07,08) THEN 'INVERNO'
    WHEN MONTH(dataProducao)IN(09,10,11) THEN 'PRIMAVERA'
END AS 'Estação Plantada'
FROM producao;

-- SELECT TABELA plantacao RETORNA AS LEITURAS MAIS RECENTES
SELECT * FROM plantacao
	ORDER BY dataLeitura DESC;
    
-- SELECT TABELA plantacao RETORNA CLASSIFICAÇÃO TEMPERATURA
SELECT *, 
CASE
	WHEN sensorTemperatura>25 THEN 'ACIMA DO IDEAL'
    WHEN sensorTemperatura>18 AND sensorTemperatura<=25 THEN 'IDEAL'
    WHEN sensorTemperatura<=18 THEN 'ABAIXO DO IDEAL'
END AS 'Classificação Temperatura'
FROM plantacao;