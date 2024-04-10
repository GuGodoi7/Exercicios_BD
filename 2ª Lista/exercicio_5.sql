/*  Escreva um programa PL/SQL que use um cursor implícito para excluir todos os 
registros de uma tabela de departamentos */

SET SERVEROUTPUT ON
DECLARE
    CURSOR c_funcionario IS SELECT * FROM funcionario;
BEGIN
    FOR reg IN c_funcionario LOOP
        DELETE FROM funcionario
        WHERE cd_fun = reg.cd_fun;
    END LOOP;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Todos os registros da tabela de funcion?rios foram exclu?dos com sucesso.');

END;