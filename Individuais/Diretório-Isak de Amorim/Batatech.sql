CREATE DATABASE BataTech;
USE batatech;

-- Tabela cadastro, onde recebe os dados de cadastro e login dos clientes.
CREATE TABLE cadastro (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(30),
    CPF CHAR(11) UNIQUE,
    CNPJ CHAR(14) DEFAULT 'Sem CNPJ',
    email VARCHAR(30) UNIQUE NOT NULL CONSTRAINT chkEmail CHECK(email like '%@%'),
    senha VARCHAR(50) NOT NULL
    );

-- Tabela sensores, recebe os dados dos sensores que coletam os dados do solo das plantações.
CREATE TABLE sensores (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(30),
    temperatura DECIMAL(4,2),
    umidade DECIMAL(4,2),
    dataLeitura datetime default current_timestamp
    );

-- Tabela contrato, recebe os dados sobre os contratos de serviços dos clientes.
CREATE TABLE contrato (
	idContrato INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(30),
    tipoAssinatura VARCHAR(20) CONSTRAINT chkAssinatura CHECK(tipoAssinatura IN('Anual', 'Semestral')),
    qtdSensores INT,
    qtdHectares DECIMAL(5,1)
    );
    
INSERT INTO cadastro (nomeUsuario, CPF, CNPJ, email, senha ) VALUES
	('AgroPlant', '01456977654', DEFAULT, 'comercial11@agroplant.com', 'agro123');

INSERT INTO sensores (nomeUsuario, temperatura, umidade) VALUES
	('AgroPlant', 18.34, 20.15);

INSERT INTO contrato (nomeUsuario, tipoAssinatura, qtdSensores, qtdHectares) VALUES
    ('AgroPlant', 'Semestral', 10, 1.5);
    
-- TODAS OS NOSSOS CLIENTES
SELECT * FROM contrato;

-- TODOS CADASTRADOS NO NOSSO SITE
SELECT * FROM cadastro;

-- EXIBIR OS DADOS DO SOLO DA EMPRESA AGROPLANT
SELECT idSensor, temperatura, umidade FROM sensores
	WHERE nomeUsuario = 'AgroPlant';
    
-- ATUALIZAR OS DADOS DO SOLO DA PLANTAÇÃO DA EMPRESA AGROPLANT
UPDATE sensores SET temperatura = 17.50
	WHERE idSensor = 1;
UPDATE sensores SET umidade = 18.50
	WHERE idSensor = 1;

-- VERIFICAR A SITUAÇÃO DO SOLO CASO O SOLO ESTEJA MUITO QUENTE OU MUITO FRIO E MUITO SECO OU MUITO UMIDO
-- https://www.embrapa.br/hortalicas/batata/clima#:~:text=Embora%20a%20faixa%20%C3%B3tima%20de,temperaturas%20podem%20ser%20mais%20elevadas. ótima de temperatura para o cultivo de batata esteja entre 15 ºC e 22 ºC
-- 
SELECT idSensor, nomeUsuario, temperatura, umidade AS 'Umidade em %', dataLeitura, 
CASE 
	WHEN temperatura > 22.00 THEN 'Solo muito quente!'
	WHEN temperatura < 15.00 THEN 'Solo muito frio!'
ELSE 'Solo adequado!' 
END AS 'Situação da Temperatura',
CASE 
	WHEN umidade > 70.00 THEN 'Solo muito umido!'
    WHEN umidade < 60.00 THEN 'Solo muito seco!'
ELSE 'Solo adequado!'
END AS 'Situação da Umidade'
FROM sensores;