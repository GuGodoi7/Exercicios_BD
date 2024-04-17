SET SERVEROUTPUT ON
DECLARE
    V_CONTA NUMBER(2);
    TURMA_CHEIA EXCEPTION;
BEGIN
    SELECT COUNT(RM) INTO V_CONTA FROM ALUNO;
    if V_CONTA = 5 THEN
        RAISE TURMA_CHEIA;
    ELSE
        INSERT INTO aluno VALUES (4,'Rafaela');
    end if;
    EXCEPTION
        WHEN TURMA_CHEIA THEN
            dbms_output.put_line('Turma cheia');

END;
