SET SERVEROUTPUT ON

DECLARE
    --DECLARANDO CURSOR
    CURSOR c_prod is SELECT * FROM PRODUTO;
    --DECLARANDO OS TIPOS DE DADOS
    prod c_prod %ROWTYPE;
    
    --DECLARANDO VARIAVEL PRODUTO PARA PEGAR O PARAMETRO
    Produto VARCHAR(50) := '&Informe_oProduto';
BEGIN
    --ABRINDO CURSOR
    OPEN c_prod;
    --LOOP PARA --PERCORENDO A TABELA PRODUTO
    LOOP
        --DISPONIBILIZANDO A LINHA E POSICIONANDO NA PRÓXIMA LINHA DO CURSOR
        FETCH c_prod INTO prod;
        --VERIFICANDO SE FETCH RETORNO ALGUMA LINHA
        EXIT WHEN c_prod %NOTFOUND;
        --VERIFICANDO O VALOR DA COMISSÃO PARA CULCULAR O JUROS
        IF prod.vl_comissoes > 200 THEN
            --FAZENDO UPDATE NA TABELA PRODUTO CASO A CONDIÇÃO ACIMA FOR VERDADEIRA
            Update PRODUTO set vl_juros = prod.vl_comissoes * 0.15 WHERE id_produto = prod.id_produto;
            
        --VERIFICANDO O VALOR DA COMISSÃO PARA CULCULAR O JUROS
        ELSIF prod.vl_comissoes <= 200 or prod.vl_comissoes > 100 THEN
        
            --FAZENDO UPDATE NA TABELA PRODUTO CASO A CONDIÇÃO ACIMA FOR VERDADEIRA
            Update PRODUTO set vl_juros = prod.vl_comissoes * 0.1 WHERE id_produto = prod.id_produto;
        else
            --FAZENDO UPDATE NA TABELA PRODUTO CASO A CONDIÇÃO ACIMA FOR VERDADEIRA
            Update PRODUTO set vl_juros = prod.vl_comissoes * 0.5 WHERE id_produto = prod.id_produto;
        end if;
    --ENCERRANDO LOOP
    end loop;
    --FECHANDO CURSOR
    CLOSE c_prod;
    --COMFIRMANDO TODAS AS TRANSAÇÕES 
    COMMIT;
END;