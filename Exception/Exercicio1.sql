/*create table aluno (
    rm NUMBER (1),
    nome VARCHAR2 (20));

INSERT INTO aluno (rm, nome) VALUES (1,'Joao');
INSERT INTO aluno (rm, nome) VALUES (2,'Maria');
INSERT INTO aluno (rm, nome) VALUES (3,'José');
INSERT INTO aluno (rm, nome) VALUES (3,'José');*/

SET SERVEROUTPUT ON
DECLARE
    V_RM ALUNO.RM%TYPE := 6;
    V_NOME ALUNO.NOME%TYPE;
BEGIN
    SELECT NOME INTO V_NOME FROM ALUNO WHERE RM = V_RM;
    dbms_output.put(V_RM|| '-' || V_NOME);
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Error: '||SQLCODE);
            dbms_output.put_line('Error: '||SQLERRM);

END;



