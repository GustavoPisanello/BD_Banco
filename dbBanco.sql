create database dbBanco;
use  dbBanco;

create table tbHistorico(
cpf BIGINT,
numeroConta int,
dataInicio date,
primary key(cpf, numeroConta),
foreign key (cpf) references tbCliente(cpf),
foreign key (numeroConta) references tbConta(numeroConta)
);

create table tbConta(
numeroConta int primary key,
Saldo decimal (7,2),
TipoConta smallint,
NumeroAgencia int not null,
foreign key (numeroAgencia) references tbAgencia(numeroAgencia) 
);

create table tbAgencia(
 numeroAgencia int primary key,
 endereco varchar(50) not null 
);

create table tbCliente(
 cpf bigint primary key,
 nome varchar(50) not null,
 sexo char(1) not null,
 endereco varchar(50) not null
);

create table tbTelefone_Cliente(
 cpf bigint,
 telefone int primary key
);

create table tbBanco(
 codigo int primary key,
 nome varchar (50) not null
);
alter table tbAgencia add column codBanco int;
alter table tbAgencia add constraint codBanco foreign key(codBanco) references tbBanco(codigo);

alter table tbTelefone_Cliente add constraint Cpf foreign key(cpf) references tbcliente(cpf);

 insert tbBanco values ("1", "Banco do Brasil"),
					   ("104", "Caixa Econômica Federal"),
					   ("801", "Banco Escola");
                       
select * from tbBanco;

 insert tbAgencia values ("123", "Av. Paulista, 78", "1"),
					     ("159", "Rua Liberdade, 124", "104"),
                         ("401", "Rua vinte três, 23", "801"),
                         ("485", "Av. Marechal, 68", "801");
                         
select * from tbAgencia;

insert tbCliente values ("12345678910", "Enildo", "M", "Rua Grande, 75"),
						("12345678911", "Astrogildo", "M", "Rua Pequena, 789"),
						("12345678912", "Monica", "F", "Av. Larga, 148"),
                        ("12345678913", "Cascão", "M", "Av. Principal, 369");

select * from tbCliente;

insert tbConta values ("9876", "456.05", "1", "123"),
					  ("9877", "321.00", "1", "123"),
					  ("9878", "100.00", "2", "485"),
					  ("9879", "5589.48", "1", "401");
                      
select * from tbConta;

 insert tbHistorico values ("12345678910", "9876", "2001/04/05"),
					       ("12345678911", "9877", "2011/03/10"),
                           ("12345678912", "9878", "2021/03/11"),
                           ("12345678913", "9879", "2000/07/05");

select * from tbHistorico;

insert tbTelefone_Cliente values ("12345678910", "91245678"),
					       ("12345678911", "912345679"),
                           ("12345678912", "912345680"),
                           ("12345678913", "912345681");

select * from tbTelefone_Cliente;

alter table tbCLiente add column emailCli varchar(50);

select CPF, endereco from tbCLiente where nome ="monica";

select numeroagencia, endereco from tbAgencia where codBanco ="801";

select * from tbCliente where sexo = "M";

delete from tbTelefone_Cliente where cpf = "12345678911";

select * from tbTelefone_Cliente;

update tbConta set tipoConta = 2 where NUmeroConta = "9879";

select * from tbConta;

update tbCliente set emailCli = "Astro@Escola.com" where nome = "Monica";

select * from tbCliente;

update tbConta set Saldo = Saldo + Saldo/10;

select nome, emailCli, endereco from tbCliente where nome = "Monica";

update tbCliente set nome = "Enildo Candido", emailCli = "enildo@escola.com" where cpf = "12345678910";

select * from tbCliente;

update tbConta set Saldo = Saldo -30;

delete from TbCONTA  where numeroConta = "9878";


