-- CRIANDO BANCO DE DADOS
CREATE DATABASE batatech;
USE batatech;

-- CRIANDO TABELA usuario
CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
cnpj VARCHAR(18),
email VARCHAR(40) NOT NULL UNIQUE,
CONSTRAINT chkEmail CHECK(email LIKE '%@%'),
senha VARCHAR(20) NOT NULL,
nome VARCHAR(50)
);

DESC usuario;

-- CRIANDO TABELA logSensor
CREATE TABLE logSensor (
idLog INT PRIMARY KEY AUTO_INCREMENT,
sensorTemperatura DECIMAL(4,2),
sensorUmidade DECIMAL(5,2),
dataLeitura DATETIME DEFAULT current_timestamp
);

DESC logSensor;


-- CRIAÇÃO DA TABELA producao
CREATE TABLE producao(
id INT PRIMARY KEY AUTO_INCREMENT,
dataColheita DATE,
haPlantados INT, 
quilosColhidos int 
);


-- INSERINDO DADOS TABELA usuario
INSERT INTO usuario (cnpj, email, senha, nome) VALUES
('72.235.123/0001-12','batata@frita.com','euamobatata','Batata Frita'),
('12.345.432/0001-21','pure@batata.com','ilovebatata','Pure'),
('72.235.123/0001-12','jose@fritas.com','salgadinho','Jose Batata'),
('12.345.432/0001-21','joyce@fritas.com','batatinha123','Joyce Pure');

SELECT * FROM usuario;

-- INSERINDO DADOS TABELA logSensor
INSERT INTO logSensor (sensorTemperatura,sensorUmidade) VALUES
( 15, 29),
( 16, 30),
( 18.5, 32);

SELECT * FROM logSensor;

-- INSERÇÃO DADOS NA TABELA producao
INSERT INTO producao(dataColheita, haPlantados, quilosColhidos)  VALUES
('2025-06-01', 5000 ,125000000 ),
('2025-08-10', 2000, 44000000),
('2024-01-01', 6000,156000000);

SELECT * FROM producao;


-- FILTRANDO AS CONDIÇÕES DO SOLO DE ACORDO COM OS SENSORES
SELECT idLog, sensorTemperatura, sensorUmidade AS 'Umidade em %', dataLeitura, 
CASE 
	WHEN sensorTemperatura > 22.00 THEN 'Solo muito quente!'
	WHEN sensorTemperatura < 15.00 THEN 'Solo muito frio!'
ELSE 'Solo adequado!' 
END AS 'Situação da Temperatura',
CASE 
	WHEN sensorUmidade > 80.00 THEN 'Solo muito umido!'
    WHEN sensorUmidade < 60.00 THEN 'Solo muito seco!'
ELSE 'Solo adequado!'
END AS 'Situação da Umidade'
FROM logSensor;

-- ORDENANDO A TABELA USUARIO POR EMPRESA
SELECT * FROM usuario
	ORDER BY cnpj;
    

-- SELECT TABELA producao RETORNA A ESTAÇÃO QUE FOI PLANTADA
SELECT dataColheita, haPlantados, quilosColhidos,
CASE
	WHEN MONTH(dataColheita)IN(12,01,02)  THEN 'VERÃO'
    WHEN MONTH(dataColheita)IN(03,04,05) THEN 'OUTONO'
    WHEN MONTH(dataColheita)IN(06,07,08) THEN 'INVERNO'
    WHEN MONTH(dataColheita)IN(09,10,11) THEN 'PRIMAVERA'
END AS 'Estação Colhida'
FROM producao;
