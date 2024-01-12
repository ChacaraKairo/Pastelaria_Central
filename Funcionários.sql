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