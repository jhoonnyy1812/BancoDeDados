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