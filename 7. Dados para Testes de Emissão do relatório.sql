INSERT INTO professor(nome, matricula) VALUES('Ricardo', '1510007777');
INSERT INTO professor(nome, matricula) VALUES('Fujioka', '1510008888');

INSERT INTO curso(nome) VALUES('Sistemas para Internet');
INSERT INTO curso(nome) VALUES('Redes de Computadores');

INSERT INTO status_entrega(devolucao, data_devolucao) VALUES(True, '2016-04-29');
INSERT INTO status_entrega(devolucao, data_devolucao) VALUES(False, NULL);

INSERT INTO prova(id_status, estagio, data_prova, data_limite) VALUES(1, 2, '2016-04-27', '2016-04-29');
INSERT INTO prova(id_status, estagio, data_prova, data_limite) VALUES(2, 2, '2016-04-25', '2016-04-28');

INSERT INTO disciplina(id_prova, nome, periodo) VALUES(1, 'Analise de Projeto de Sistema', 'P3');
INSERT INTO disciplina(id_prova, nome, periodo) VALUES(2, 'Tecnologia de Acesso a Dados na Internet', 'P3');

INSERT INTO disciplina_curso VALUES(1, 1);
INSERT INTO disciplina_curso VALUES(2, 2);

INSERT INTO disciplina_professor VALUES (1, 1);
INSERT INTO disciplina_professor VALUES (2, 2);
