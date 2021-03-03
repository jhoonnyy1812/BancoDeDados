--CMD: createdb -U postgres questao08fbd "Banco usado na disciplina de FBD." 
--CMD: psql -U postgres questao08fbd
CREATE TABLE IF NOT EXISTS estudante(
  enum INT PRIMARY KEY,
  enome TEXT NOT NULL,
  nivel TEXT NOT NULL,
  idade INTEGER NOT NULL,
  sexo CHAR(1) NOT NULL
);

CREATE TABLE IF NOT EXISTS faculdade(
  fid INT PRIMARY KEY,
  fnome TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS disciplina(
  dnome TEXT PRIMARY KEY,
  hora TIME NOT NULL,
  sala TEXT,
  fid INT REFERENCES faculdade(fid)
);

CREATE TABLE IF NOT EXISTS matricula(
  enum INT REFERENCES estudante(enum),
  dnome TEXT REFERENCES disciplina(dnome)
);

--Questão 01: A

SELECT DISTINCT fnome FROM faculdade
WHERE fid NOT IN (
  SELECT  DISTINCT c.fid FROM estudante AS a
  INNER JOIN matricula AS b
  ON a.enum = b.enum
  INNER JOIN disciplina AS c
  ON b.dnome = c.dnome
);

--Questão 01: B
SELECT DISTINCT c.enome FROM estudante AS c
INNER JOIN matricula AS d
ON c.enum = d.enum
INNER JOIN disciplina AS a
ON a.dnome = d.dnome
INNER JOIN faculdade AS b
ON a.fid = b.fid
WHERE b.fnome = 'FAFOR'
GROUP BY c.enome
HAVING count(*) > (
  SELECT COUNT(*) FROM disciplina as e
  INNER JOIN faculdade as f
  ON f.fid = e.fid
);

--Questão 01: C
SELECT DISTINCT c.enome FROM estudante AS c
INNER JOIN matricula AS d
ON c.enum = d.enum
INNER JOIN disciplina AS a
ON a.dnome = d.dnome
INNER JOIN faculdade AS b
ON a.fid = b.fid
WHERE b.fnome = 'FAFOR' AND c.enum NOT IN(
  SELECT e.enum FROM estudante AS e
  INNER JOIN matricula AS d
  ON c.enum = d.enum
  INNER JOIN disciplina AS a
  ON a.dnome = d.dnome
  INNER JOIN faculdade AS b
  ON a.fid = b.fid
  WHERE b.fnome = 'FANÓIS'
);

--Questão 01: D
SELECT COUNT(*) FROM disciplina AS a
INNER JOIN faculdade AS b
ON a.fid = b.fid
WHERE b.fnome = 'FAFOR';

--Questão 01: E
SELECT DISTINCT a.enome FROM estudante AS a
INNER JOIN matricula AS b
ON b.enum = a.enum
INNER JOIN disciplina AS c
ON c.dnome = b.dnome
INNER JOIN faculdade AS d
ON d.fid = c.fid
WHERE d.fnome = 'FAFOR' AND a.idade > 20;

--Questão 01: F
SELECT a.enum, a.enome FROM estudante AS a
WHERE a.idade < 19;

--Questão 01: J
SELECT a.fnome, COUNT(b.dnome)
FROM faculdade AS a, disciplina AS b
WHERE b.dnome NOT IN (
  SELECT DISTINCT c.dnome FROM matricula AS c
)
GROUP BY a.fnome;

--Questão 01: K
SELECT a.enome, d.fnome, COUNT(DISTINCT c.dnome) FROM estudante AS a
INNER JOIN matricula AS b
ON b.enum = a.enum
INNER JOIN disciplina AS c
ON c.dnome = b.dnome
INNER JOIN faculdade AS d
ON d.fid = c.fid
GROUP BY a.enome, d.fnome;