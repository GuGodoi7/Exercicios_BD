/*
 Crie um programa PL/SQL que utilize um cursor expl�cito para retornar o nome 
do funcion�rio com o maior sal�rio.
*/


SET SERVEROUTPUT ON

DECLARE 
    CURSOR c_fun IS SELECT nm_fun, salario FROM funcionario;
    funcionario c_fun%ROWTYPE;
    
    salario_max NUMBER(10,2) := 0;
    nome_max funcionario.nm_fun%TYPE;

BEGIN
    OPEN c_fun;
    LOOP
        FETCH c_fun INTO funcionario;
        EXIT WHEN c_fun%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Sal�rio do funcion�rio ' || funcionario.nm_fun || ': ' || funcionario.salario);
        
        IF funcionario.salario > salario_max THEN
            salario_max := funcionario.salario;
            nome_max := funcionario.nm_fun;
        END IF;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE('O funcion�rio com o maior sal�rio �: ' || nome_max || ', com sal�rio de ' || salario_max);

    
    CLOSE c_fun;
END;


