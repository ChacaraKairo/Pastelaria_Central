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