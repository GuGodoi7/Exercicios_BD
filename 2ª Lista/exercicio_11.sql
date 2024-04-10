--11) Escreva um programa PL/SQL que utilize um cursor impl?cito para exibir o nome e o sal?rio de todos os funcion?rios que t?m um sal?rio acima de uma determinada quantia recebida por par?metro.

--Criar Tabela :
CREATE TABLE FUNCIONARIOS (
    nm_funcionario VARCHAR2(15),
    vl_salario NUMBER(8,2)  
);

-- Inser??o de dados :
INSERT INTO FUNCIONARIOS (nm_funcionario, vl_salario) VALUES ('Jo?o', 3500);
INSERT INTO FUNCIONARIOS (nm_funcionario, vl_salario) VALUES ('Maria', 4000);
INSERT INTO FUNCIONARIOS (nm_funcionario, vl_salario) VALUES ('Pedro', 2800);
INSERT INTO FUNCIONARIOS (nm_funcionario, vl_salario) VALUES ('Ana', 3200);

-- Habilita o output :
SET SERVEROUTPUT ON;

-- Bloco PL/SQL :
DECLARE
    pr_salario NUMBER := &Valor_minimo; 
BEGIN
    FOR funcionario IN (SELECT nm_funcionario, vl_salario FROM funcionarios WHERE vl_salario > pr_salario) LOOP        
        DBMS_OUTPUT.PUT_LINE('Nome: ' || funcionario.nm_funcionario || ', Sal?rio: ' || funcionario.vl_salario);
    END LOOP;
END;