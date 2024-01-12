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