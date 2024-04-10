--14) Crie um programa PL/SQL que utilize um cursor expl?cito para diminuir o sal?rio de todos os funcion?rios em um determinado departamento.

--Criar tabela:
CREATE TABLE EMPRESA (
    id_departamento NUMBER,
    id_funcionario NUMBER,
    nm_departamento VARCHAR2(50),
    nm_funcionario VARCHAR2(15),
    vl_salario NUMBER (4)
);

-- Inser??o de dados
INSERT INTO EMPRESA (id_departamento, id_funcionario, nm_departamento, nm_funcionario, vl_salario) VALUES (1, 1, 'Vendas', 'Pedro', 4000);
INSERT INTO EMPRESA (id_departamento,  id_funcionario, nm_departamento, nm_funcionario, vl_salario) VALUES (2, 2, 'Financeiro', 'Maria', 3000);
INSERT INTO EMPRESA (id_departamento, id_funcionario, nm_departamento, nm_funcionario, vl_salario) VALUES (3, 3, 'RH', 'Mario', 5000);
INSERT INTO EMPRESA (id_departamento, id_funcionario, nm_departamento, nm_funcionario, vl_salario) VALUES (4, 4, 'TI', 'Carlos', 3400);
INSERT INTO EMPRESA (id_departamento, id_funcionario, nm_departamento, nm_funcionario, vl_salario) VALUES (5, 5, 'Marketing', 'Joaquina', 4010);


-- Bloco PL/SQL
DECLARE
    id_departamento NUMBER := 1; 
    reducao_salario NUMBER := 1000; 
    CURSOR c_funcionarios IS
        SELECT id_funcionario, vl_salario
        FROM EMPRESA
        WHERE id_departamento = id_departamento FOR UPDATE;
BEGIN
    FOR funcionario IN c_funcionarios LOOP
        UPDATE EMPRESA
        SET vl_salario = funcionario.vl_salario - reducao_salario
        WHERE id_funcionario = funcionario.id_funcionario;
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Sal?rios diminu?dos para o departamento ' || id_departamento);
END;
