/*2) Vamos criar uma tabela chamada 'Aluno' com as colunas 'Rm', 'nome', 
'nota', 'm�dia' e 'situa��o'. Em seguida, criaremos um bloco para incluir 3 
linhas na tabela sem preencher os dados na coluna 'm�dia' e 'situa��o'.

A 'situa��o' do aluno ser� preenchida por um bloco de programa��o onde o 
usu�rio ir� digitar o 'Rm' do aluno. Em seguida, o sistema ir� determinar a 
situa��o do aluno da seguinte forma:

- Se a m�dia for maior que 6, o aluno ser� marcado como 'Aprovado'.

- Se a m�dia for menor ou igual a 6, o aluno ser� marcado como 

'Reprovado'. 

Finalmente, o sistema ir� gravar a m�dia e a situa��o na tabela 'Aluno'. 
*/


CREATE TABLE ALUNO (
    Rm NUMBER (10),
    Nome VARCHAR2 (50),
    Nota NUMBER (10),
    Media NUMBER (5),
    Situacao VARCHAR2 (50)
);

SET SERVEROUTPUT ON

DECLARE 
    v_rm NUMBER (10); 
    v_nome VARCHAR2 (50);
    v_nota NUMBER (2);
BEGIN
    FOR i IN 1..3 LOOP
        v_rm := 99585 + 1 ;
        v_nome := 'Gustavo';
        v_nota := 9 - 1;
        
       INSERT INTO ALUNO  (RM , Nome , Nota) VALUES  (v_rm, v_nome, v_nota );
    END LOOP;
    

END;

SET SERVEROUTPUT ON

DECLARE 
    v_media NUMBER (10,2) := 0;
    n_rm NUMBER (10) := &Digite_o_rm;
    v_msg VARCHAR2 (100) := 'Aprovado';
    v_msg2 VARCHAR2 (100) := 'Reprovado';

BEGIN
    SELECT AVG (Nota) INTO v_media FROM ALUNO;
    dbms_output.put_line(v_media);
   
    IF v_media > 6 THEN
        UPDATE ALUNO SET Media = v_media , Situacao = v_msg WHERE Rm = n_rm; 
        dbms_output.put_line('aprovado');
        
    
    ELSE 
        UPDATE ALUNO SET Media = v_media , Situacao = v_msg WHERE Rm = n_rm; 
        dbms_output.put_line('aprovado');
    END IF;
    COMMIT;
END;



















