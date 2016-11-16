--Base de dados--
CREATE DATABASE entregadeprovas;

--Tabela Usuário--
CREATE TABLE usuario(
	id_usuario SERIAL NOT NULL,
	user_name CHARACTER VARYING(20) NOT NULL UNIQUE,
	senha CHARACTER VARYING(35) NOT NULL,
	email CHARACTER VARYING(30) NOT NULL UNIQUE, --Usado para validar e redefinir senha
	CONSTRAINT pk_usuario
	PRIMARY KEY(id_usuario)
);

--Tabela Curso--
CREATE TABLE curso(
	id_curso SERIAL NOT NULL,
	nome CHARACTER VARYING(60) NOT NULL,
	turma CHARACTER(1) DEFAULT NULL,
	CONSTRAINT pk_curso
	PRIMARY KEY(id_curso)
);

--Tabela Professor--
CREATE TABLE professor(
	id_professor SERIAL NOT NULL,
	nome CHARACTER VARYING(80) NOT NULL,
	matricula CHARACTER VARYING(15),
	CONSTRAINT pk_professor
	PRIMARY KEY(id_professor)
);

--Tabela de Status--
CREATE TABLE status_entrega(
	id_status SERIAL NOT NULL,
	devolucao BOOLEAN NOT NULL DEFAULT 'FALSE',
	data_devolucao DATE DEFAULT NULL,
	CONSTRAINT pk_status_entrega
	PRIMARY KEY(id_status)
);

--Tabela Secretária--
--Procedimento para validação de CPF
CREATE TABLE secretaria(
	id_secretaria SERIAL NOT NULL,
	id_usuario INTEGER NOT NULL,
	nome CHARACTER VARYING(80) NOT NULL,
	cpf CHARACTER VARYING(14) NOT NULL UNIQUE,
	CONSTRAINT pk_secretaria
	PRIMARY KEY(id_secretaria),
	CONSTRAINT fk_usuario
	FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario)
);

--Tabela Prova--
CREATE TABLE prova(
	id_prova SERIAL NOT NULL,
	estagio INTEGER NOT NULL,
	data_prova DATE NOT NULL,
	data_limite DATE NOT NULL,
	id_status INTEGER NOT NULL,
	CONSTRAINT pk_prova
	PRIMARY KEY(id_prova),
	CONSTRAINT fk_status_entrega
	FOREIGN KEY(id_status) REFERENCES status_entrega(id_status)
);

--Tabela Disciplina--
CREATE TABLE disciplina(
	id_disciplina SERIAL NOT NULL,
	id_prova INTEGER,
	nome CHARACTER VARYING(60) NOT NULL,
	periodo CHARACTER(3) NOT NULL,
	CONSTRAINT pk_disciplina
	PRIMARY KEY(id_disciplina),
	CONSTRAINT fk_prova
	FOREIGN KEY(id_prova) REFERENCES prova(id_prova)
);

--Tabela de relação entre as tabelas Disciplina e Professor--
CREATE TABLE disciplina_professor(
	id_disciplina INTEGER NOT NULL,
	id_professor INTEGER NOT NULL,
	CONSTRAINT fk_disciplina_professor_id_disciplina
	FOREIGN KEY(id_disciplina) REFERENCES disciplina(id_disciplina),
	CONSTRAINT fk_disciplina_professor_id_prfessor
	FOREIGN KEY(id_professor) REFERENCES professor(id_professor)
);

--Tabela de relação entre as tabelas Disciplina e Curso--
CREATE TABLE disciplina_curso(
	id_disciplina INTEGER NOT NULL,
	id_curso INTEGER NOT NULL,
	CONSTRAINT fk_disciplina_curso_id_disciplina
	FOREIGN KEY(id_disciplina) REFERENCES disciplina(id_disciplina),
	CONSTRAINT fk_disciplina_curso_id_curso
	FOREIGN KEY(id_curso) REFERENCES curso(id_curso)
);
