--13) Escreva um bloco PL/SQL que utilize um cursor impl?cito para calcular o total de sal?rios pagos pela empresa.

--A tabela ja foi criada no exercicio 11.
-- Bloco PL/SQL
DECLARE
    total_salarios NUMBER := 0; 
BEGIN
    FOR funcionario IN (SELECT vl_salario FROM funcionarios) LOOP
        total_salarios := total_salarios + funcionario.vl_salario;
    END LOOP;
    
    -- Exibi??o do total de sal?rios
    DBMS_OUTPUT.PUT_LINE('Total de Sal?rios Pagos: ' || total_salarios);
END;