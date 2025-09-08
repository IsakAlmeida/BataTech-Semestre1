create database BataTech;
use BataTech;

create table Cadastro (
idCadastro int primary key auto_increment,
Empresa varchar(50),
CNPJ char(18),
Email varchar(30) unique,
Telefone varchar(20),
Município varchar(30),
Estado char(2));

create table Dados (
idDados int primary key auto_increment,
DataHorário datetime default current_timestamp,
Temperatura decimal (3,1),
UmidadeSolo decimal (4,2));

create table TrabalheConosco (
idVagas int primary key auto_increment,
Nome varchar(60) not null unique,
Telefone varchar(30),
Email varchar(35) not null unique,
VagaPretend varchar(40) constraint chkvaga
check(VagaPretend in('Desenvolvedor', 'Suporte Técnico', 'SAC')));

insert into Cadastro values
(1, 'Batataum', '00.000.000-0000/11', 'aaaaaaa@aaaa.com', '11 00000-0000', 'Batatais', 'SP'),
(2, 'Batatadois', '00.000.001-0000/11', 'bbbbbbbb@bbbb.com', '11 00000-0001', 'Fritalândia', 'MG');

select * from Cadastro;

select * from Cadastro
where Empresa like '%s';

insert into Dados (Temperatura, UmidadeSolo) values
(20.4, 49.19),
(16.7, 70.45);

select * from Dados;

select DataHorário as 'Momento da Coleta',
case
when Temperatura > 18 then 'Esquentando'
else 'Esfriando'
end as 'Temperatura em °C',
case
when UmidadeSolo < 60 then 'Secando'
else 'Muito bom'
end as 'Umidade do Solo em %'
from Dados;

insert into TrabalheConosco values
(1, 'Joviscleison Man', '00 00000-0000', 'jovisman@mmmmm.com', 'SAC'),
(2, 'Repolhonson Dude', '11 00000-0000', 'repolhorocks@aaaaa.com', 'Desenvolvedor'),
(3, 'Batatôncio Amido', '22 00000-0000', 'comabatata@bbbbb.com', 'Suporte Técnico');

select * from TrabalheConosco;

select concat(telefone, ' ', email, ' ') as 'Dados Pessoais',
case
when VagaPretend = 'Desenvolvedor' then 'Sem vagas'
else 'Temos vagas'
end as 'Vagas Pretendidas'
from TrabalheConosco;
