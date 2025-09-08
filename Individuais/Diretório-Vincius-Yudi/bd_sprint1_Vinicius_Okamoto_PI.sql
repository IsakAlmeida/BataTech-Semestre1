-- BANCO DE DADOS BATATECH
create database batatech;
use batatech;
create table cadastro (
id int primary key auto_increment,
nome varchar (80) unique,
email varchar (90) unique,
senha varchar (50),
cpfsim varchar (20) unique,
telefone varchar (25),
empresa varchar (20)
);

create table dados (
idarduino int primary key,
temperatura decimal (3,1),
umidade decimal (5,1),
horários time,
dia date);

create table empresa (
idempresa int primary key,
nomeempresa varchar(50),
Estado varchar(25),
região varchar(25),
cnpj varchar(20),
inicio date);

alter table cadastro add column permissao varchar(10);
alter table cadastro add constraint chkpermissao check (permissao ='adminstrador' or permissao = 'cliente');
