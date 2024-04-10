/*
Escreva um bloco PL/SQL que utilize um cursor impl�cito para calcular a soma 
total dos sal�rios de todos os funcion�rios.
*/


DECLARE
    CURSOR c_fun IS SELECT * FROM FUNCIONARIO;
    funcionario c_fun%ROWTYPE;
    
    salario_total NUMBER(10,2) := 0;

BEGIN 
        FOR REG IN c_fun LOOP
            salario_total := salario_total + reg.salario;
            
            
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Salario total: ' ||salario_total);
END;