-- Extrair Relatório do Banco de Dados --
CREATE VIEW envelope AS 
	SELECT prof.nome AS Professor, c.nome AS Curso, d.periodo AS Periodo, d.nome AS Disciplina, 
	prov.data_prova AS Data_da_Prova, prov.data_limite AS Data_Limite, s.data_devolucao AS Data_de_Entrega
	FROM curso c  
	INNER JOIN disciplina_curso dc ON dc.id_curso = c.id_curso 
	INNER JOIN disciplina d ON d.id_disciplina = dc.id_disciplina 
	INNER JOIN disciplina_professor dp ON dp.id_disciplina = d.id_disciplina 
	INNER JOIN professor prof ON prof.id_professor = dp.id_professor 
	INNER JOIN prova prov ON prov.id_prova = d.id_prova 
	INNER JOIN status_entrega s ON s.id_status = prov.id_status;
	
-- Chamar View de Relatório --
SELECT * FROM envelope;


