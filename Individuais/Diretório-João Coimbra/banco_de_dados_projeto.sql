create database projeto;
use projeto;

create table cadastro (
idCliente int primary key auto_increment,
cnpj varchar (20),
nome_empresa varchar (50),
email varchar(50) unique,
senha varchar (12) not null);

insert into cadastro (cnpj,nome_empresa,email,senha) value
('53845788172355','Rodrigo AgroTech','batatafrita22@gmail.com','Agroze35');
select * from cadastro;

create table sensor_tempe (
idArduino int primary key auto_increment,
hectare int,
temperatura decimal(4,2),
dtAnalise datetime);

insert into sensor_tempe (hectare,temperatura,dtAnalise) value
(3,19.5,'2025-08-28 13:58:00');
select * from sensor_tempe;

create table sensor_umida (
idArduino int primary key auto_increment,
hectare int,
umidade_solo int,
dtAnalise datetime);

insert into sensor_umida (hectare,umidade_solo,dtAnalise) value
(4,21,'2025-08-28 15:43:04');

create table contrato (
idContrato int primary key auto_increment,
nome_empresa varchar (50),
qtdArduino int,
plano varchar (30),
constraint chkPlano check (plano in('Semestral','Anual')),
fidelidade date);

insert into contrato (nome_empresa,qtdArduino,plano,fidelidade) value 
('Rodrigo AgroTech',56,'Semestral','2026-03-14');
select * from contrato;



