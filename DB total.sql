-- https://github.com/ChacaraKairo/Banco-de-Dados-Pastelaria.git --
drop database Pastelaria_Pessoas;
-- Criar tabela --
create database `Pastelaria_Pessoas`
DEFAULT CHARACTER SET UTF8
DEFAULT COLLATE utf8_general_ci;
Use Pastelaria;
--  ////////////////////////////////////////////////////////////////// --
CREATE TABLE Senhas_Diretoria(
Usuario varchar(15) not null,
Senha varchar(20) not null,
ID_Funcionario tinyint,
foreign key(ID_Funcionario) references Funcionarios(id)
) ENGINE=InnoDB DEFAULT CHARSET = utf8;

-- TABELA DE ACESSO AO BANCO --
CREATE TABLE Senhas(
Usuario varchar(15) not null,
Senha varchar(20) not null,
ID_Funcionario tinyint,
foreign key(ID_Funcionario) references Funcionarios(id) 
) ENGINE=InnoDB DEFAULT CHARSET = utf8;
--  Clientes --
create table Cliente (
`CPF/CNPJ` varchar(14) not null primary key,
`Nome` varchar(50) not null ,
telefone char(11) not null,
CEP char(8) not null, 
Estado char(2) default 'MG',
`Cidade` varchar(30) default 'Novo Cruzeiro',
`Bairro` varchar(35) not null, 
`Rua` varchar(40) not null,
Numero int not null, 
GastoTotal float, 
TempoMedioDeCompra int, 
`SalgadoFV` varchar(20),
`BebidaFV` varchar(20),
foreign key (`SalgadoFV`) references Salgado(id),
foreign key (`BebidaFV`) references Bebida(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
select * from Cliente;
desc Cliente;
DELIMITER //
create trigger Calcular_Total
before insert on Cliente
for each row
begin
set new.GastoTotal = 
DELIMITER;


-- Funcionarios --
CREATE TABLE Funcionarios (
	`id` tinyint UNSIGNED auto_increment not null primary key,
	`Nome` varchar(50) NOT NULL,
   `CPF` char(11) unique NOT NULL,
   `RG` varchar(15),
   `Nascimento` date,
	`Cargo` varchar(20) not null DEFAULT 'Ass. de Produção',
    `PIS/PASEP` char(11) unique NOT NULL,
    `Estado_Civil` ENum('Casado', 'Solteiro', 'Divorciado', 'Viuvo', 'Separado'),
    `Salario` int UNSIGNED not null,
    `Telefone` char(11) NOT NULL, 
    `E-mail` varchar(260) NOT NULL, 
    `Data_Inicio` date NOT NULL,
    `Cep` char(8) NOT NULL DEFAULT '39820000', 
    `Estado` char(2) DEFAULT 'MG',
    `Cidade` varchar(50) DEFAULT 'Novo Cruzeiro', 
    `Rua` varchar(60) NOT NULL,
    `Numero` SmallInt unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Conjuges --
create table Conjuges (
CPF char(11) not null primary key,
id_Funcionario tinyint UNSIGNED  not null,
`Nome` varchar(30) not null, 
`Nascimento` date not null,
foreign key (id_Funcionario ) references Funcionarios(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Dependentes --
create table Dependente(
id int unsigned not null primary key,
id_Funcionário tinyint UNSIGNED not null,
`Nome` varchar(30) not null,
Nascimento date not null,
foreign key (id_Funcionario ) references Funcionarios(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Sertores -- 
create table Setores(
id tinyint not null auto_increment primary key,
`Nome` varchar(20) not null unique
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Descrição do Setor --
create table Funcoes(
id tinyint not null,
Nome varchar(20) not null,
Descricao tinytext not null,
Tempo time,
foreign key (id) references Setores(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Tabela de Produtos --
create table Produtos(
id int not null auto_increment primary key,
Nome varchar(25) not null,
Tipo ENUM('S', 'D', 'B') not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Tabela Doces --
create table Doces(
id int unique not null,
COD_Barras char(13) unique,
Quantidade int not null,
Custo decimal(2,2) not null,
Valor decimal(2,2) not null,
Id_Fornecedor tinyint not null,
foreign key (id) references Produtos(id),
foreign key (id_Fornecedor) references Fornecedores(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Tabela Bebidas --
create table Bebida(
id int unique not null,
COD_Barras char(13) unique,
Quantidade int not null,
Custo decimal(2,2) not null,
Valor decimal(2,2) not null,
Id_Fornecedor tinyint not null,
foreign key (id) references Produtos(id),
foreign key (id_Fornecedor) references Fornecedores(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Tabela de Salgados --
create table Salgados(
id int unique not null,
Quantidade int not null, 
Custo decimal(2,2) not null,
Valor decimal(2,2) not null,
Receita text unique,
foreign key (id) references Produtos(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Receitas -- 
create table receitas(
id_Salgado int unique not null, 
id_MatPrima int unique not null,
Quantidade tinyint not null,
foreign key (id_Salgado) references Produtos(id),
foreign key (id_MatPrima) references MateriaPrima(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Matéria Prima --
create table MateriaPrima(
id int not null auto_increment primary key,
Nome varchar(20) not null,
COD_Barras char(13) unique,
Quantidade int not null,
Custo decimal(2,2) not null,
id_Fornecedor tinyint not null,
foreign key (id_Fornecedor) references Fornecedores(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
