--Questão 01: Já feita no código passado

--Questão 02.A:
SELECT A.enome, A.salario FROM eempresa.empregado AS A
INNER JOIN eempresa.departamento AS B
ON A.cdep = B.codigo
WHERE B.dnome = 'Marketing';

--Questão 02.B:
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

--Questão 02.C: Não concluída
--SELECT A.pnome, A.cidade FROM eempresa.projeto AS A
--INNER JOIN eempresa.tarefa AS B
--ON A.Pcodigo = B.Pcodigo
--WHERE 30.0 < (
  SELECT SUM(horas), B.cpf
  FROM eempresa.tarefa AS B
  GROUP BY B.cpf;
--);
--SELECT t.cidade, t.nome FROM
--(SELECT sum(eempresa.tarefa.horas) as soma, eempresa.projeto.cidade as cid, eempresa.projeto.pnome as nome FROM eempresa.tarefa LEFT JOIN eempresa.projeto ON eempresa.tarefa.pcodigo = eempresa.projeto.pcodigo GROUP BY eempresa.tarefa.cpf) as t WHERE t.soma > 30

--Questão 02.D:
SELECT A.enome, A.nasc FROM eempresa.empregado AS A
INNER JOIN eempresa.departamento AS B
ON A.cpf = B.gerente;

--Questão 02.E:
SELECT A.enome, A.endereco FROM eempresa.empregado AS A
INNER JOIN eempresa.departamento AS B
ON A.cdep = B.codigo
WHERE B.dnome = 'Pesquisa';

--Questão 02.F:
SELECT A.Pcodigo, B.dnome, C.enome FROM eempresa.projeto AS A
INNER JOIN eempresa.departamento AS B
ON A.cdep = B.codigo
INNER JOIN eempresa.empregado AS C
ON C.cpf = B.gerente
WHERE A.cidade = 'Icapuí';

--Questão 02.G:
SELECT A.enome, A.sexo FROM eempresa.empregado AS A
INNER JOIN eempresa.departamento AS B
ON A.cdep = B.codigo
WHERE A.cpf != B.gerente;