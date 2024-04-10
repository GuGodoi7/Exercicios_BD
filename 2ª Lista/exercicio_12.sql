--12) Crie um programa PL/SQL que utilize um cursor expl?cito para retornar o n?mero total de departamentos na empresa.

-- Criar tabela :
CREATE TABLE DEPARTAMENTOS (
    id_departamento NUMBER,
    nm_departamento VARCHAR2(50)
);

-- Inser??o de dados
INSERT INTO departamentos (id_departamento, nm_departamento) VALUES (1, 'Vendas');
INSERT INTO departamentos (id_departamento, nm_departamento) VALUES (2, 'Financeiro');
INSERT INTO departamentos (id_departamento, nm_departamento) VALUES (3, 'RH');
INSERT INTO departamentos (id_departamento, nm_departamento) VALUES (4, 'TI');
INSERT INTO departamentos (id_departamento, nm_departamento) VALUES (5, 'Marketing');


-- Bloco PL/SQL
DECLARE
    CURSOR c_departamentos IS
        SELECT * FROM departamentos; 
BEGIN
    FOR departamento IN c_departamentos LOOP
        DBMS_OUTPUT.PUT_LINE('Departamento: ' || departamento.nm_departamento);
    END LOOP;
END;
