create database EMPRESA_JOIN;
use EMPRESA_JOIN;

create table departamento(
id bigint primary key auto_increment not null,
nome varchar(255)
);

create table funcionario(
id int primary key auto_increment not null,
salario decimal(10,2),
nome varchar(100),
id_departamento bigint,
foreign key (id_departamento) references departamento (id)
);

create table dependente(
id int primary key auto_increment not null,
nome varchar(100),
id_funcionario int,
foreign key (id_funcionario) references funcionario (id)
);

insert into departamento (nome)
values ("Comunicação"),("Publicidade"),("Vendas"),("RH"),("Engenharia");

insert into funcionario (salario,nome,id_departamento)
values (1413.00,"Carlos",1),(1987.00,"José",3),(2600.50,"Rayane",4),(2050.00,"Amanda",2),(3139.99,"Jiséli",5);

insert into dependente (nome,id_funcionario)
values ("Carlos Jozé",1),("Mariazinha",1),("Ezno",2),("Heloisa",4),("Valentina",3);

SELECT func.nome AS funcionario_nome,COUNT(dep.id) AS dependentes_numero
FROM funcionario func
JOIN dependente dep ON func.id = dep.id_funcionario
GROUP BY func.id
HAVING COUNT(dep.id) > 2;

SELECT dep.nome AS nome_departamento, func.nome AS nome_funcionario
FROM departamento dep
LEFT JOIN funcionario func 
ON dep.id = func.id_departamento
ORDER BY func.nome asc;

SELECT func.nome AS nome_funcionario, dep.nome AS nome_dependene
FROM funcionario func
LEFT JOIN dependente dep
ON func.id = dep.id_funcionario;

SELECT departamento.nome AS departamento_nome,AVG(func.salario) AS media_salarial
FROM funcionario func
JOIN departamento departamento 
ON func.id_departamento = departamento.id
GROUP BY departamento.id
ORDER BY departamento.nome;

SELECT dep.id AS departamento_id,dep.nome AS departamento_nome,COUNT(func.id) AS funcionarios_count
FROM departamento dep
LEFT JOIN funcionario func 
ON dep.id = func.id_departamento
GROUP BY dep.id
ORDER BY dep.nome;

SELECT SUM(func.salario) AS total_salarios
FROM funcionario func;

SELECT dep.nome AS departamento_nome,SUM(func.salario) AS total_custo
FROM departamento dep
JOIN funcionario func 
ON dep.id = func.id_departamento
GROUP BY dep.id
ORDER BY dep.nome;