create database GER_JOIN;

use GER_JOIN;

create table funcionarios(
COD int auto_increment primary key not null,
NOME varchar(255) not null,
ESPECIALIDADE varchar(255) not null
);

create table dependentes (
COD int primary key not null,
NOME varchar(255) not null,
COD_FUNC int,
foreign key (COD_FUNC) references funcionarios (COD)
);

insert into funcionarios (NOME,ESPECIALIDADE)
values ("JOSÉ","ENGENHEIRO"),("JOÃO","MESTRE DE OBRAS"),("MARIA","CONTABILISTA");

insert into dependentes (COD,NOME,COD_FUNC)
values (1,"PEDRO",1),(2,"PAULO",1),(3,"LUANA",3),(4,"FABIO",3);

select funcionarios.NOME,dependentes.NOME
from funcionarios
inner join dependentes
on funcionarios.COD=dependentes.COD
where funcionarios.COD=1;

select FUNC.NOME NOME_FUNC,DEP.NOME NOME_DEP
from funcionarios FUNC
left join dependentes DEP
on FUNC.COD=DEP.COD_FUNC;

select FUNC.NOME NOME_FUNC,DEP.NOME NOME_DEP
from funcionarios FUNC
left join dependentes DEP
on FUNC.COD=DEP.COD_FUNC
where DEP.NOME is null;

select FUNC.NOME NOME_FUNC,DEP.NOME NOME_DEP
from funcionarios FUNC
right join dependentes DEP
on FUNC.COD=DEP.COD_FUNC;

select FUNC.NOME NOME_FUNC,DEP.NOME NOME_DEP
from funcionarios FUNC
right join dependentes DEP
on FUNC.COD=DEP.COD_FUNC
where FUNC.COD is null;




