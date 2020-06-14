use sistematizacao;

insert into nacionalidade values 
(default, 'Brasileiro'),
(default, 'Americano');

insert into Ator values
(default, 'Pedro Paulo', '1990-01-01', 'M', '1'),
(default, 'Jose', '1988-01-01', 'M', '1');

insert into estudio values
(default, '1', '1987-01-01', 'Estudio Azul'),
(default, '2', '1987-01-01', 'Estudio Amarelo');

insert into proprietario_estudio values 
(default, 'Marcos Paulo','123232', '1'),
(default, 'Angelo Ribeiro','223331','2');

insert into faturamento_estudio values
(default, '1', '2019', '100000'),
(default, '2', '2019', '100000');

insert into filme values 
(default, '1', 'Matrix', '123456782'),
(default, '2', 'Velozes e Furiosos', '012345678');

insert into papel values
(default, 'Criança'),
(default, 'Adulto');

insert into personagem values
(default, '1', '1', 'Neo', '2'),
(default, '2', '2', 'Toreto', '2');

insert into producao values
(default, '5', '1000000','1'),
(default, '3', '2000000','2');

insert into cache values 
('1','1','9000000'),
('2','2','10000000');

insert into elenco values
(default, '1', '1', 'Neo'),
(default, '1', '1', 'Trinity');



