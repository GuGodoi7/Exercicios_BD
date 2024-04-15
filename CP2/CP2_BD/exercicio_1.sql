/*
DROP TABLE PRODUTO;
CREATE TABLE PRODUTO (
    id_produto NUMBER(2) PRIMARY KEY,
    nome_produto VARCHAR2(50),
    vl_vendas NUMBER(10,2),
    vl_comissoes NUMBER(10,2),
    vl_juros NUMBER(10,2),
    vl_lucro NUMBER(10,2)
    );

INSERT INTO PRODUTO (id_produto, nome_produto, vl_vendas, vl_comissoes, vl_juros , vl_lucro) VALUES (1, 'meia', 400,0,0,0);
INSERT INTO PRODUTO (id_produto, nome_produto, vl_vendas, vl_comissoes, vl_juros , vl_lucro) VALUES (2, 'luva' , 500,0,0,0);
INSERT INTO PRODUTO (id_produto, nome_produto, vl_vendas, vl_comissoes, vl_juros , vl_lucro) VALUES (3, 'tenis', 600,0,0,0);
INSERT INTO PRODUTO (id_produto, nome_produto, vl_vendas, vl_comissoes, vl_juros , vl_lucro) VALUES (4, 'calca', 300,0,0,0);
INSERT INTO PRODUTO (id_produto, nome_produto, vl_vendas, vl_comissoes, vl_juros , vl_lucro) VALUES (5, 'toca', 900,0,0,0); */


SET SERVEROUTPUT ON

DECLARE
    --DECLARANDO CURSOR
    CURSOR c_prod is SELECT * FROM PRODUTO;
BEGIN
    --PERCORENDO A TABELA PRODUTO
    FOR reg in c_prod LOOP
        --VERIFICANDO O VALOR DAS VENDAS PARA CULCULAR A COMISSÃO
        if reg.vl_vendas > 700 THEN
            --FAZENDO UPDATE NA TABELA PRODUTO CASO A CONDIÇÃO ACIMA FOR VERDADEIRA
            Update PRODUTO set vl_comissoes = reg.vl_vendas * 1.25 WHERE id_produto = reg.id_produto;
        else
            --FAZENDO UPDATE NA TABELA PRODUTO CASO A CONDIÇÃO FOR VERDADEIRA
            Update PRODUTO set vl_comissoes = reg.vl_vendas * 1.1 WHERE id_produto = reg.id_produto;
        -- ENCERRANDO IF ELSE    
        end if;
    --ENCERRANDO LOOP
    END LOOP;
     --COMFIRMANDO TODAS AS TRANSAÇÕES 
    COMMIT;
END;