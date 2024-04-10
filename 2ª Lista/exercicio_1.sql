/* Escreva um programa PL/SQL que use um cursor implícito para percorrer uma 
tabela de funcionários e exibir seus nomes e salários. */

DECLARE
    CURSOR c_fun is Select Nm_fun, salario FROM FUNCIONARIO;
    
BEGIN
    for contador in c_fun LOOP
        dbms_output.put_line('Nome: ' || contador.nm_fun || ' - Salario: ' || contador.salario);
    END LOOP;
END;