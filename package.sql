CREATE OR REPLACE PACKAGE PKG_ALUNO AS
 
-- get nome completo do aluno
FUNCTION get_nome (p_rm NUMBER)
    RETURN VARCHAR2;
 
-- get RM do aluno
FUNCTION get_rm(p_nome VARCHAR2)
    RETURN NUMBER;
END PKG_ALUNO;
 
/
 
CREATE OR REPLACE PACKAGE BODY PKG_ALUNO AS
 
-- get nome completo do aluno
FUNCTION get_nome (p_rm NUMBER) RETURN VARCHAR2 IS
    v_nome VARCHAR2(80);
    BEGIN
        SELECT nome INTO v_nome FROM aluno WHERE rm = p_rm;
        RETURN v_nome;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        WHEN TOO_MANY_ROWS THEN
            RETURN NULL;
    END get_nome;
-- get rm do aluno
FUNCTION get_rm (p_nome VARCHAR2) RETURN NUMBER IS
    v_rm ALUNO.RM%TYPE;
    BEGIN
        SELECT rm INTO v_rm FROM aluno WHERE nome = p_nome;
        RETURN v_rm;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        WHEN TOO_MANY_ROWS THEN
            RETURN NULL;
    END get_rm;   
END PKG_ALUNO; -- end get_nome