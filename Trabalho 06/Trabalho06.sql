--QUESTÃO 01:
SELECT A.enome, A.salario, A.cdep FROM eempresa.empregado AS A;

--QUESTÃO 02:
SELECT A.enome, A.salario FROM eempresa.empregado AS A
WHERE A.sexo = 'F';

--QUESTÃO 03:
SELECT A.enome, A.salario FROM eempresa.empregado AS A
WHERE A.sexo = 'F' AND A.salario > 10000;

--QUESTÃO 04:
SELECT count(*) FROM eempresa.empregado;

--QUESTÃO 05:
SELECT avg(A.salario), max(A.salario), min(A.salario) FROM eempresa.empregado AS A;

--QUESTÃO 06:
SELECT A.enome, A.salario FROM eempresa.empregado AS A
INNER JOIN eempresa.departamento AS B
ON A.cdep = B.codigo
WHERE B.dnome = 'Marketing';

--QUESTÃO 07:
SELECT DISTINCT A.cpf FROM eempresa.empregado AS A
WHERE A.cpf IN (
  SELECT DISTINCT B.cpf FROM eempresa.tarefa as B
);

--QUESTÃO 08:
SELECT DISTINCT A.cpf FROM eempresa.empregado AS A
WHERE A.cpf NOT IN (
  SELECT DISTINCT B.cpf FROM eempresa.tarefa as B
);

--QUESTÃO 09:
SELECT DISTINCT A.enome FROM eempresa.empregado AS A
WHERE A.cpf IN (
  SELECT DISTINCT B.cpf FROM eempresa.tarefa as B
);

--QUESTÃO 10:
SELECT DISTINCT A.enome FROM eempresa.empregado AS A
WHERE A.cpf NOT IN (
  SELECT DISTINCT B.cpf FROM eempresa.tarefa as B
);

--QUESTÃO 11:
SELECT DISTINCT A.cpf FROM eempresa.empregado AS A
WHERE A.cpf IN (
  SELECT DISTINCT B.cpf FROM eempresa.tarefa AS B
  WHERE B.horas > 30.0
);

--QUESTÃO 12:
SELECT DISTINCT A.cpf FROM eempresa.empregado AS A
WHERE A.cpf NOT IN (
  SELECT DISTINCT B.cpf FROM eempresa.tarefa AS B
  WHERE B.horas > 30.0
);

--QUESTÃO 13:
SELECT A.dnome, B.enome FROM eempresa.departamento AS A
INNER JOIN eempresa.empregado AS B
on A.gerente = B.cpf;

--QUESTÃ0 14:
SELECT A.cpf FROM eempresa.empregado AS A
INNER JOIN eempresa.departamento AS B
ON A.cdep = B.codigo
WHERE B.dnome = 'Pesquisa'
OR A.cpf = (
  SELECT DISTINCT A.chefe FROM eempresa.empregado AS A
  INNER JOIN eempresa.departamento AS B
  ON A.cdep = B.codigo
  WHERE B.dnome = 'Pesquisa'
);

--QUESTÃO 16:
SELECT A.enome, A.nasc FROM eempresa.empregado AS A
INNER JOIN eempresa.departamento AS B
ON A.cpf = B.gerente;

--QUESTÃO 17:
SELECT A.enome, A.endereco FROM eempresa.empregado AS A
INNER JOIN eempresa.departamento AS B
ON A.cdep = B.codigo
WHERE B.dnome = 'Pesquisa';

--QUESTÃO 18:
SELECT A.Pcodigo, B.dnome, C.enome FROM eempresa.projeto AS A
INNER JOIN eempresa.departamento AS B
ON A.cdep = B.codigo
INNER JOIN eempresa.empregado AS C
ON C.cpf = B.gerente
WHERE A.cidade = 'Icapuí';

--QUESTÃO 19:
SELECT A.enome, A.sexo FROM eempresa.empregado AS A
WHERE A.cpf IN (
  SELECT B.gerente FROM eempresa.departamento AS B
);

--QUESTÃO 20:
SELECT A.enome, A.sexo FROM eempresa.empregado AS A
WHERE A.cpf NOT IN (
  SELECT B.gerente FROM eempresa.departamento AS B
);