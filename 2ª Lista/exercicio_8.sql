/* Crie um programa PL/SQL que utilize um cursor expl�cito para aumentar o 
sal�rio de todos os funcion�rios em um departamento espec�fico */


DECLARE
    CURSOR c_fun IS SELECT * FROM funcionario;
    funcionario c_fun%ROWTYPE;

    v_valor_futuro NUMBER := '&Digite_o_valor';
    salario_atualizado NUMBER(10) := 0;
BEGIN
    OPEN c_fun;
        LOOP
            FETCH c_fun INTO funcionario;
            EXIT WHEN c_fun%NOTFOUND;
            
            IF funcionario.nm_departamento = 'RH' THEN
                salario_atualizado := funcionario.salario + v_valor_futuro;
                UPDATE funcionario SET salario = salario_atualizado WHERE nm_departamento = 'RH';
            END IF;
        END LOOP;
            DBMS_OUTPUT.PUT_LINE('Salario total: ' ||salario_atualizado);

    CLOSE c_fun;

END;