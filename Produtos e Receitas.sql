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