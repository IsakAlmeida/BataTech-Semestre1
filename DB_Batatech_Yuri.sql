-- BANCO DE DADOS SIMULADOR BATATECH
create database simulador_batatech;
use simulador_batatech;

create table usuario (
id int primary key auto_increment,
nome varchar(80) unique,
email varchar(90) unique,
senha varchar(50),
cpf varchar(20) unique,
telefone varchar(25)
);

create table simulacao (
idsimulacao int primary key auto_increment,
hectares int,
sacas int,
lucro decimal(12,2),
resultado varchar(100),
data_simulacao date
);

create table empresa (
idempresa int primary key auto_increment,
nomeempresa varchar(50),
estado varchar(25),
regiao varchar(25),
cnpj varchar(20) unique,
inicio date
);

alter table usuario add column permissao varchar(15);
alter table usuario add constraint chkpermissao 
check (permissao = 'administrador' or permissao = 'cliente');

-- INSERTS
insert into usuario (nome, email, senha, cpf, telefone, permissao) 
values ('Yuri Alves', 'yuri@email.com', '12345', '12345678900', '51987654321', 'administrador');

insert into usuario (nome, email, senha, cpf, telefone, permissao) 
values ('Maria Souza', 'maria@email.com', 'abc123', '98765432100', '51999998888', 'cliente');

insert into simulacao (hectares, sacas, lucro, resultado, data_simulacao) 
values (50, 2000, 120000.00, 'Lucro dentro da média', '2025-09-06');

insert into simulacao (hectares, sacas, lucro, resultado, data_simulacao) 
values (80, 3500, 250000.00, 'Lucro alto com potencial de crescimento', '2025-09-06');

insert into empresa (nomeempresa, estado, regiao, cnpj, inicio) 
values ('Batatech RS', 'Rio Grande do Sul', 'Sul', '11222333444455', '2020-01-15');

insert into empresa (nomeempresa, estado, regiao, cnpj, inicio) 
values ('Batatech SP', 'São Paulo', 'Sudeste', '22333444555566', '2021-05-20');

-- SELECTS SIMPLES
select * from usuario;
select nome, email, telefone from usuario;
select hectares, sacas, lucro from simulacao;
select nomeempresa, estado, regiao from empresa;

-- UPDATES
update usuario set telefone = '51999999999' where id = 1;
update simulacao set lucro = 275000.00 where idsimulacao = 2;