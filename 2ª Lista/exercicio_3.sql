/* Escreva um bloco PL/SQL que use um cursor impl�cito para atualizar os sal�rios 
de todos os funcion�rios em 10%. */

DECLARE
    CURSOR c_fun is SELECT * FROM FUNCIONARIO;

BEGIN
    FOR reg in c_fun LOOP
        Update FUNCIONARIO set salario = reg.salario * 1.1;
    END LOOP;

END;