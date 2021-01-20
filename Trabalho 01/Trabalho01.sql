-- RODAR NO CMD: createdb -U postgres fbd2020 "Banco usado na disciplina de FBD."
-- RODAR NO CMD: psql -U postgres fbd2020
--Criando SCHEMA eempresa
CREATE SCHEMA IF NOT EXISTS eempresa;
--Criando tabelas
CREATE TABLE IF NOT EXISTS eempresa.empregado (
  ENOME VARCHAR(50) NOT NULL,
  CPF CHAR(4) PRIMARY KEY,
  ENDERECO VARCHAR(8) NOT NULL,
  NASC VARCHAR(8) NOT NULL, --dúvidas no formato date, o formato na tabela estava em DD/MM/AA, mas o type DATE no postgres é AAAA-MM-DD.
  SEXO CHAR(1) NOT NULL,
  SALARIO NUMERIC(12, 2) NOT NULL,
  CHEFE VARCHAR(4) REFERENCES eempresa.empregado(CPF)
);

CREATE TABLE IF NOT EXISTS eempresa.departamento(
  DNOME VARCHAR(20) NOT NULL,
  CODIGO SMALLINT PRIMARY KEY,
  GERENTE CHAR(4) REFERENCES eempresa.empregado(CPF)
);

CREATE TABLE IF NOT EXISTS eempresa.dunidade(
  DCODIGO SMALLINT NOT NULL,
  DCIDADE VARCHAR(20) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS eempresa.projeto(
  PNOME VARCHAR(20) UNIQUE NOT NULL,
  PCODIGO VARCHAR(3) PRIMARY KEY,
  CIDADE VARCHAR(20) REFERENCES eempresa.dunidade(DCIDADE)
);

CREATE TABLE IF NOT EXISTS eempresa.tarefa(
  CPF CHAR(4) REFERENCES eempresa.empregado(CPF),
  PCODIGO VARCHAR(3) REFERENCES eempresa.projeto(PCODIGO),
  HORAS NUMERIC(5, 1) NOT NULL
);

ALTER TABLE eempresa.empregado
ADD CDEP SMALLINT REFERENCES eempresa.departamento(CODIGO);

--Adicionando os chefes dos departamentos:
INSERT INTO eempresa.departamento(DNOME, CODIGO, GERENTE)
VALUES ('Administracao', 4, Null);

INSERT INTO eempresa.empregado(ENOME, CPF, ENDERECO, NASC, SEXO, SALARIO, CHEFE, CDEP)
VALUES ('Valtin', '8765', 'rua 4, 4', '05/05/65', 'M', 15000.00, Null, 4);

UPDATE eempresa.departamento
SET GERENTE = '8765'
WHERE CODIGO = '4';

INSERT INTO eempresa.departamento(DNOME, CODIGO, GERENTE)
VALUES ('Pesquisa', 3, Null);

INSERT INTO eempresa.empregado(ENOME, CPF, ENDERECO, NASC, SEXO, SALARIO, CHEFE, CDEP)
VALUES ('Chiquin', '1234', 'rua 1, 1', '02/02/62', 'M', 10000.00, 8765, 3);

UPDATE eempresa.departamento
SET GERENTE = '1234'
WHERE CODIGO = '3';

INSERT INTO eempresa.departamento(DNOME, CODIGO, GERENTE)
VALUES ('Marketing', 2, Null);

INSERT INTO eempresa.empregado(ENOME, CPF, ENDERECO, NASC, SEXO, SALARIO, CHEFE, CDEP)
VALUES ('Zefinha', '6543', 'rua 6, 6', '07/07/67', 'M', 10000.00, 8765, 2);

UPDATE eempresa.departamento
SET GERENTE = '6543'
WHERE CODIGO = '2';

--Adicionando demais empregados:

INSERT INTO eempresa.empregado(ENOME, CPF, ENDERECO, NASC, SEXO, SALARIO, CHEFE, CDEP)
VALUES ('Helenita', '4321', 'rua 2, 2', '02/02/62', 'F', 12000.00, 6543, 2);

INSERT INTO eempresa.empregado(ENOME, CPF, ENDERECO, NASC, SEXO, SALARIO, CHEFE, CDEP)
VALUES ('Pedrin', '5678', 'rua 3, 3', '04/04/64', 'M', 9000.00, 6543, 2);

INSERT INTO eempresa.empregado(ENOME, CPF, ENDERECO, NASC, SEXO, SALARIO, CHEFE, CDEP)
VALUES ('Zulmira', '3456', 'rua 5, 5', '06/06/66', 'F', 12000.00, 8765, 3);

--Adicionando unidades:

INSERT INTO eempresa.dunidade(DCODIGO, DCIDADE)
VALUES (2, 'Morro Branco');

INSERT INTO eempresa.dunidade(DCODIGO, DCIDADE)
VALUES (3, 'Cumbuco');

INSERT INTO eempresa.dunidade(DCODIGO, DCIDADE)
VALUES (3, 'Prainha');

INSERT INTO eempresa.dunidade(DCODIGO, DCIDADE)
VALUES (3, 'Taíba');

INSERT INTO eempresa.dunidade(DCODIGO, DCIDADE)
VALUES (3, 'Icapuí');

INSERT INTO eempresa.dunidade(DCODIGO, DCIDADE)
VALUES (4, 'Fortaleza');