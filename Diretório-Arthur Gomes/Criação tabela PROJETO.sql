create database batatas;
use batatas;

CREATE TABLE log_sensores(
id_log INT PRIMARY KEY auto_increment,
data_log DATETIME DEFAULT current_timestamp,
temperatura DECIMAL(5,2),
umidade DECIMAL(5,2)
);

CREATE TABLE cadastro(
id_cadastro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
senha VARCHAR(100) NOT NULL,
tipo_acesso VARCHAR(50) DEFAULT 'Funcionário',
CONSTRAINT CHK_EMAIL CHECK(email LIKE '%@%'),
CONSTRAINT CHK_ACESSO CHECK(tipo_acesso in('Funcionário', 'Administrador'))
);

CREATE TABLE empresa (
id_empresa INT PRIMARY KEY AUTO_INCREMENT,
cnpj VARCHAR(14) UNIQUE,
razao_social VARCHAR(100)
);

CREATE TABLE contrato(
id_contrato INT PRIMARY KEY AUTO_INCREMENT,
tipo_contrato VARCHAR(40),
data_assinatura DATE, 
plano_ativo TINYINT,
valor DECIMAL(10,2),
CONSTRAINT CHK_CONTRATO CHECK(tipo_contrato IN('Mensal', 'Semestral', 'Anual')),
CONSTRAINT CHK_ATIVO CHECK(plano_ativo IN(0,1))
);

INSERT INTO log_sensores (data_log, temperatura, umidade)VALUES
('2025-08-29 13:20:33', 20.5, 40.30),
('2025-08-28 17:40:21', 17.2, 37.40),
('2025-08-23 11:22:14', 21.4, 21.24),
('2025-08-24 09:20:33', 25.9, 33.25);

INSERT INTO empresa (cnpj, razao_social) VALUES
('12345678000195', 'Fazenda do Seu João LTDA'),
('98765432000160', 'Tauza Fazenda'),
('45678912000103', 'Campo Verde Alimentos S.A');

INSERT INTO contrato (tipo_contrato, data_assinatura, plano_ativo, valor) VALUES
('Mensal', '2025-08-21', 1, 90000.00),
('Semestral', '2024-07-10', 0, 500000.00),
('Anual', '2025-07-17', 1, 900000.00),
('Mensal', '2025-08-01', 1, 90000.00);

INSERT INTO cadastro (nome, email, senha, tipo_acesso) VALUES
('Isak Neves Souza', 'isak.neves@tauza.com','123AQWAQWW', 'Administrador'),
('Hermes Fabio Fonseca', 'hermes.fonseca@tauza.com', 'AQWAQW!@#','Funcionário'),
('Arthur Oliveira Gomes', 'arthur.oliveira@campoverde.com.br', 'P@ssW!@#','Administrador'),
('Lucas Franco Marques', 'lucas.marques@campoverde.com.br','12345678' ,'Funcionário'),
('Henrique Gabriel Aparecido', 'henrique.gabriel@fazendajoao.agro.br','Aog9097@#', 'Administrador'),
('Igor José de Souza', 'igor.souza@fazendajoao.agro.br', 'Lol212025','Funcionário');

SELECT nome, email FROM cadastro WHERE tipo_acesso = 'Administrador';
UPDATE cadastro SET senha = '87654321!@#20205' WHERE id_cadastro = 3;
SELECT * FROM cadastro;
SELECT nome, senha FROM cadastro WHERE email LIKE('%campoverde.com.br');
SELECT id_cadastro, nome, senha 
FROM cadastro 
    WHERE senha NOT LIKE'%@%' 
	AND senha NOT LIKE '%!%'
	AND senha NOT LIKE '%#%' 
	AND senha NOT LIKE '%$%';
    
SELECT * FROM contrato;
SELECT * from contrato WHERE plano_ativo = 0;
SELECT tipo_contrato, data_assinatura, valor FROM contrato WHERE data_assinatura > '2025-01-01';

SELECT * FROM log_sensores;
SELECT temperatura, umidade FROM log_sensores WHERE temperatura > 20.00;
SELECT * FROM log_sensores WHERE umidade <30.00;
SELECT id_log, data_log, temperatura FROM log_sensores;

SELECT * FROM empresa;
SELECT id_empresa FROM empresa WHERE razao_social = 'Tauza Fazenda';
SELECT razao_social FROM empresa WHERE id_empresa = 3;




