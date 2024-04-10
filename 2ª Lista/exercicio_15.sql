--15)Escreva um bloco PL/SQL que utilize um cursor impl?cito para encontrar o nome do departamento que possui a maior soma de sal?rios.

--Utilizando tabela do exercicio passado.
-- Bloco PL/SQL
DECLARE
   dp_maior_salario EMPRESA.nm_departamento%TYPE;
BEGIN
    FOR departamento IN (SELECT nm_departamento
                         FROM EMPRESA
                         GROUP BY nm_departamento
                         ORDER BY SUM(vl_salario) DESC --Ta somando tudo e colocando em ordem decrescente seu burrao
                         FETCH FIRST 1 ROW ONLY) LOOP --Ta pegando o primeiro dessa ordem, voce sabe o pq
        dp_maior_salario := departamento.nm_departamento;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('O departamento com maior soma de sal?rios ?: ' || dp_maior_salario);
END;