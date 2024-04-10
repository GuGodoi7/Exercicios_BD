/*Crie um programa PL/SQL que use um cursor explícito para calcular o salário 
médio dos funcionários de um determinado departamento, caso não tenha 
funcionários no departamento gerar a mensagem “'Nenhum funcionário 
encontrado para o departamento */

SET SERVEROUTPUT ON

DECLARE
    Cursor c_fun is SELECT * FROM FUNCIONARIO;
    fun c_fun %ROWTYPE;
    v_media NUMBER(10,2) := 0;
    v_contador NUMBER(10) := 0;
    
BEGIN
    OPEN c_fun;
    LOOP
        FETCH c_fun INTO fun;
        EXIT WHEN c_fun %NOTFOUND;
        if fun.nm_departamento = 'RH' then
                v_media := v_media + fun.salario;
                v_contador := v_contador + 1;
    END IF;
    
    END LOOP;
    
    if v_contador = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum funcion�rio encontrado para o departamento RH');
    else v_media:= v_media / v_contador;
        DBMS_OUTPUT.PUT_LINE('M�dia dos sal�rios de RH : ' || V_MEDIA);
    end if;

    CLOSE c_fun;
END;