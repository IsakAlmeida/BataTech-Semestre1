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

-- CRIANDO TABELA contrato
CREATE TABLE contrato(
idContrato INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(80) NOT NULL,
cnpj VARCHAR(18)NOT NULL UNIQUE,
tipoAssinatura VARCHAR(20),
CONSTRAINT chkPlano CHECK(tipoAssinatura IN ('Semestral','Anual')),
qtdArduinos INT,
qtdHectares DECIMAL(5,1),
fidelidade DATE
);

DESC contrato;


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

-- INSERINDO DADOS TABELA contrato
INSERT INTO contrato (nomeEmpresa, cnpj, tipoAssinatura, qtdArduinos, qtdHectares,fidelidade) VALUES
('Joyce & Pure LTDA','72.235.123/0001-12','Anual', 150, 10,'2026-09-02'),
('Jose Batateiro LTDA','12.345.432/0001-21','Semestral', 50, 7, '2026-03-02');

SELECT * FROM contrato;

-- FILTRANDO AS CONDIÇÕES DO SOLO DE ACORDO COM OS SENSORES
SELECT idLog, sensorTemperatura, sensorUmidade AS 'Umidade em %', dataLeitura, 
CASE 
	WHEN sensorTemperatura > 22.00 THEN 'Solo muito quente!'
	WHEN sensorTemperatura < 15.00 THEN 'Solo muito frio!'
ELSE 'Solo adequado!' 
END AS 'Situação da Temperatura',
CASE 
	WHEN sensorUmidade > 70.00 THEN 'Solo muito umido!'
    WHEN sensorUmidade < 40.00 THEN 'Solo muito seco!'
ELSE 'Solo adequado!'
END AS 'Situação da Umidade'
FROM logSensor;

-- ORDENANDO A TABELA USUARIO POR EMPRESA
SELECT * FROM usuario
	ORDER BY cnpj;
    
-- ORDENANDO CONTRATOS QUE UTILIZAM MAIS ARDUINO
SELECT * FROM contrato
	ORDER BY qtdArduinos DESC;


