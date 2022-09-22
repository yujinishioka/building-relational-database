-- Generated by Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   at:        2022-09-21 21:45:40 BRT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

-- DROP TABLES

DROP TABLE candidato_curso;

DROP TABLE candidato_vaga;

DROP TABLE vaga_questionario;

DROP TABLE vaga;

DROP TABLE empresa;

DROP TABLE candidato;

DROP TABLE curso;

DROP TABLE questionario;

CREATE TABLE candidato (
    id_candidato       INTEGER NOT NULL,
    nome_candidato     VARCHAR2(100) NOT NULL,
    cpf                VARCHAR2(14) NOT NULL,
    data_nascimento    VARCHAR2(10) NOT NULL,
    hardskills         VARCHAR2(2000) NOT NULL,
    interesses         VARCHAR2(2000) NOT NULL,
    endereco_candidato VARCHAR2(100) NOT NULL,
    cidade_candidato   VARCHAR2(100) NOT NULL,
    estado_candidato   VARCHAR2(100) NOT NULL
);

ALTER TABLE candidato ADD CONSTRAINT candidato_pk PRIMARY KEY ( id_candidato );

CREATE TABLE candidato_curso (
    id_candidato_curso     INTEGER NOT NULL,
    candidato_id_candidato INTEGER NOT NULL,
    cursos_id_curso        INTEGER NOT NULL
);

ALTER TABLE candidato_curso ADD CONSTRAINT candidato_curso_pk PRIMARY KEY ( id_candidato_curso );

CREATE TABLE candidato_vaga (
    id_candidato_vaga      INTEGER NOT NULL,
    candidato_id_candidato INTEGER NOT NULL,
    vagas_id_vaga          INTEGER NOT NULL
);

ALTER TABLE candidato_vaga ADD CONSTRAINT candidato_vaga_pk PRIMARY KEY ( id_candidato_vaga );

CREATE TABLE curso (
    id_curso   INTEGER NOT NULL,
    nome_curso VARCHAR2(50) NOT NULL,
    descricao  VARCHAR2(2000) NOT NULL,
    preco      VARCHAR2(50) NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT cursos_pk PRIMARY KEY ( id_curso );

CREATE TABLE empresa (
    id_empresa       INTEGER NOT NULL,
    nome_empresa     VARCHAR2(100) NOT NULL,
    cnpj             VARCHAR2(20) NOT NULL,
    endereco_empresa VARCHAR2(100) NOT NULL,
    cidade_empresa   VARCHAR2(100) NOT NULL,
    estado_empresa   VARCHAR2(100) NOT NULL
);

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( id_empresa );

CREATE TABLE questionario (
    id_questionario INTEGER NOT NULL,
    enunciado       VARCHAR2(2000) NOT NULL,
    alternativa_a   VARCHAR2(100) NOT NULL,
    alternativa_b   VARCHAR2(100) NOT NULL,
    alternativa_c   VARCHAR2(100) NOT NULL,
    alternativa_d   VARCHAR2(100) NOT NULL,
    resposta        CHAR(1) NOT NULL
);

ALTER TABLE questionario ADD CONSTRAINT questionario_pk PRIMARY KEY ( id_questionario );

CREATE TABLE vaga (
    id_vaga            INTEGER NOT NULL,
    cargo              VARCHAR2(50) NOT NULL,
    salario            FLOAT(12) NOT NULL,
    empresa_id_empresa INTEGER NOT NULL
);

ALTER TABLE vaga ADD CONSTRAINT vagas_pk PRIMARY KEY ( id_vaga );

CREATE TABLE vaga_questionario (
    id_vaga_questionario         INTEGER NOT NULL,
    vagas_id_vaga                INTEGER NOT NULL,
    questionario_id_questionario INTEGER NOT NULL
);

ALTER TABLE vaga_questionario ADD CONSTRAINT vaga_questionario_pk PRIMARY KEY ( id_vaga_questionario );

ALTER TABLE candidato_curso
    ADD CONSTRAINT candidato_curso_candidato_fk FOREIGN KEY ( candidato_id_candidato )
        REFERENCES candidato ( id_candidato );

ALTER TABLE candidato_curso
    ADD CONSTRAINT candidato_curso_cursos_fk FOREIGN KEY ( cursos_id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE candidato_vaga
    ADD CONSTRAINT candidato_vaga_candidato_fk FOREIGN KEY ( candidato_id_candidato )
        REFERENCES candidato ( id_candidato );

ALTER TABLE candidato_vaga
    ADD CONSTRAINT candidato_vaga_vagas_fk FOREIGN KEY ( vagas_id_vaga )
        REFERENCES vaga ( id_vaga );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE vaga_questionario
    ADD CONSTRAINT vaga_questionario_questionario_fk FOREIGN KEY ( questionario_id_questionario )
        REFERENCES questionario ( id_questionario );

ALTER TABLE vaga_questionario
    ADD CONSTRAINT vaga_questionario_vagas_fk FOREIGN KEY ( vagas_id_vaga )
        REFERENCES vaga ( id_vaga );

ALTER TABLE vaga
    ADD CONSTRAINT vagas_empresa_fk FOREIGN KEY ( empresa_id_empresa )
        REFERENCES empresa ( id_empresa );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0