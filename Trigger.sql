CREATE TRIGGER dbo.lost_credits
ON takes
AFTER DELETE
AS
BEGIN
    /*Atualiza os créditos do aluno após deletar um curso*/
    UPDATE student
    SET tot_cred = tot_cred - c.credits
    FROM student s
    JOIN deleted d ON s.ID = d.ID
    JOIN course c ON d.course_id = c.course_id;
END;

