CREATE TABLE FUNCIONARIO (
    cd_fun NUMBER(20) PRIMARY KEY,
    nm_fun VARCHAR2(50),
    salario NUMBER (10,2),
    dt_adm DATE
);

INSERT INTO FUNCIONARIO (cd_fun, nm_fun, salario, dt_adm) VALUES (1, 'João', 10000, TO_DATE('17/04/2000' , 'dd/mm/yyyy') );
INSERT INTO FUNCIONARIO (cd_fun, nm_fun, salario, dt_adm) VALUES (2, 'Claudia', 16000, TO_DATE('02/10/1998' , 'dd/mm/yyyy') );
INSERT INTO FUNCIONARIO (cd_fun, nm_fun, salario, dt_adm) VALUES (3, 'Joaquim', 5550, TO_DATE('10/07/2010' , 'dd/mm/yyyy') );
INSERT INTO FUNCIONARIO (cd_fun, nm_fun, salario, dt_adm) VALUES (4, 'Valeria', 7300, TO_DATE('08/06/2015' , 'dd/mm/yyyy') );

SET SERVEROUTPUT ON

DECLARE
    CURSOR c_fun is Select Nm_fun, salario FROM FUNCIONARIO;
    
BEGIN

    for contador in c_fun LOOP
        dbms_output.put_line('Nome: ' || contador.nm_fun || ' - Salario: ' || contador.salario);
    
    END LOOP;
END;