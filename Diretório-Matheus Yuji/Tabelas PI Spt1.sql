create database BataTech;
use BataTech;
create table Cadastro (
idCadastro int primary key auto_increment,
Empresa varchar(50),
CNPJ char(18),
Email varchar(30),
Telefone varchar(20),
Município varchar(30),
Estado char(2));
create table Dados (
idDados int primary key auto_increment,
DataHorário datetime default current_timestamp,
Temperatura decimal (3,1),
UmidadeSolo decimal (4,2));
create table TrabalheConosco (
idVagas int primary key,
Nome varchar(60),
Telefone varchar(30),
Email varchar(35),
VagaPretend varchar(40) constraint chkvaga
check(VagaPretend in('Desenvolvedor', 'Suporte Técnico', 'SAC')));

