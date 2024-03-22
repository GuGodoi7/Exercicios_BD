/* Voc� precisa calcular o sal�rio l�quido a partir de um sal�rio X, 
considerando os descontos de Imposto de Renda conforme a tabela abaixo:

- Para sal�rios at� R$ 1.513,69, n�o h� desconto.
- Para sal�rios de R$ 1.513,70 at� R$ 2.725,12, a al�quota � de 16%.
- Para sal�rios acima de R$ 2.725,12, a al�quota � de 28,5%. 
*/


SET SERVEROUTPUT ON

DECLARE 
    v_salario NUMBER (10,2) := &Digite_Salario;

BEGIN
    IF v_salario <=  1513.69 THEN
        dbms_output.put_line('Salario Liquido sem desconto ' || v_salario);
    ELSIF v_salario > 1513.70 and v_salario < 2725.12 THEN
        v_salario := v_salario * 0.84;
        dbms_output.put_line('Salario Liquido com 16% de al�quota ' || v_salario);
    ELSE 
        v_salario := v_salario * 0.715;
        dbms_output.put_line('Salario Liquido com 28,5% de al�quota ' || v_salario);
    END IF;
END;
