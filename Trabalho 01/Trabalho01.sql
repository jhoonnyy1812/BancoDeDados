-- RODAR NO CMD: createdb -U postgres fbd2020 "Banco usado na disciplina de FBD."
-- RODAR NO CMD: psql -U postgres fbd2020
--Criando SCHEMA eempresa
CREATE SCHEMA IF NOT EXISTS eempresa;
--Criando table "empregado" dentro do schema "eempresa"
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

ALTER TABLE eempresa.empregado
ADD CDEP SMALLINT REFERENCES eempresa.departamento(CODIGO);

INSERT INTO eempresa.departamento(DNOME, CODIGO, GERENTE)
VALUES ('Administracao', 4, Null);

INSERT INTO eempresa.empregado(ENOME, CPF, ENDERECO, NASC, SEXO, SALARIO, CHEFE, CDEP)
VALUES ('Valtin', '8765', 'rua 4, 4', '05/05/65', 'M', 15000.00, Null, 4);

UPDATE eempresa.departamento
SET GERENTE = '8765'
WHERE CODIGO = '4';