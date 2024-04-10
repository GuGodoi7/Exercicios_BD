/* Crie um programa PL/SQL que utilize um cursor explícito para retornar o 
número total de funcionários em um determinado departamento. */

DECLARE
    CURSOR c_fun is SELECT * FROM  FUNCIONARIO;
    fun c_fun %ROWTYPE;
    
    contador NUMBER(2) := 0;
    
BEGIN
    OPEN c_fun;
    LOOP
        FETCH c_fun INTO fun;
        EXIT WHEN c_fun %NOTFOUND;
        if fun.nm_departamento = 'RH' THEN
            contador := contador + 1;

        END IF;

    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Departamento: ' || fun.nm_departamento || ' qtd de funcinario: ' || contador);

    CLOSE c_fun;
END;