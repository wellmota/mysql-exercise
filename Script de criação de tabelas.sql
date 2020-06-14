CREATE TABLE filme (
    IDFilme INT NOT NULL AUTO_INCREMENT,
    IDEstudio INT,
    NomeFilme VARCHAR(20),
    NCopyright INT,
    PRIMARY KEY (IDFilme)
)  DEFAULT CHARSET=UTF8;


CREATE TABLE estudio (
    IDEstudio INT NOT NULL AUTO_INCREMENT,
    IDProprietario int NOT NULL,
    NomeEstudio varchar(30) not null
    DataFundacao DATE NOT NULL,
    PRIMARY KEY (IDEstudio)
)  DEFAULT CHARSET=UTF8;

alter table estudio add column NomeEstudio varchar(30);
alter table producao add column IDFilme int;
alter table proprietario_estudio add column IDEstudio int not null;

CREATE TABLE producao (
    IDProducao INT NOT NULL AUTO_INCREMENT,
    TempoProducao CHAR(2),
    CustoProducao INT,
    PRIMARY KEY (IDProducao)
)  DEFAULT CHARSET=UTF8;

CREATE TABLE Ator (
    IDAtor INT NOT NULL AUTO_INCREMENT,
    NomeArtistico VARCHAR(30) NOT NULL,
    Nascimento DATE NOT NULL,
    IDSexo ENUM('M', 'F') NOT NULL,
    IDNascionalidade INT,
    PRIMARY KEY (IDAtor)
)  DEFAULT CHARSET=UTF8;

CREATE TABLE cache (
    IDFilme INT NOT NULL AUTO_INCREMENT,
    IDAtor INT NOT NULL,
    CalorCache DECIMAL,
    PRIMARY KEY (IDFilme , IDAtor)
)  DEFAULT CHARSET=UTF8;

CREATE TABLE elenco (
    IDElenco INT NOT NULL AUTO_INCREMENT,
    IDFilme INT NOT NULL,
    IDPersonagem INT NOT NULL,
    NomePersonagem VARCHAR(20),
    PRIMARY KEY (IDElenco)
)  DEFAULT CHARSET=UTF8;

CREATE TABLE personagem (
    IDPersonagem INT NOT NULL AUTO_INCREMENT,
    IDFilme INT NOT NULL,
    IDAtor INT NOT NULL,
    NomePersonagem VARCHAR(20),
    IDPapel INT NOT NULL,
    PRIMARY KEY (IDPersonagem)
)  DEFAULT CHARSET=UTF8;

CREATE TABLE papel (
    IDPapel INT NOT NULL AUTO_INCREMENT,
    NomePapel VARCHAR(20),
    PRIMARY KEY (IDPapel)
)  DEFAULT CHARSET=UTF8;

create table proprietario_estudio (
IDProprietario int not null auto_increment,
NomeProprietario varchar(20),
NumSegSocial int,
Primary key (IDProprietario)
)default charset=utf8;

create table faturamento_estudio (
IDFaturamentoEstuduio int not null auto_increment,
IDEstudio int not null,
AnoFaturamento char(4),
ValorFaturamento decimal,
Primary key (IDFaturamentoEstuduio, IDEstudio)
)default charset=utf8;


create table nacionalidade (
IDNacionalidade int not null auto_increment,
NomeNacionalidade varchar(20),
Primary key (IDNacionalidade)
)default charset=utf8;



