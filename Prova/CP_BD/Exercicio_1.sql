/* Você precisa calcular o salário líquido a partir de um salário X, 
considerando os descontos de Imposto de Renda conforme a tabela abaixo:

- Para salários até R$ 1.513,69, não há desconto.
- Para salários de R$ 1.513,70 até R$ 2.725,12, a alíquota é de 16%.
- Para salários acima de R$ 2.725,12, a alíquota é de 28,5%. 
*/


SET SERVEROUTPUT ON

DECLARE 
    v_salario NUMBER (10,2) := &Digite_Salario;

BEGIN
    IF v_salario <=  1513.69 THEN
        dbms_output.put_line('Salario Liquido sem desconto ' || v_salario);
    ELSIF v_salario > 1513.70 and v_salario < 2725.12 THEN
        v_salario := v_salario * 0.84;
        dbms_output.put_line('Salario Liquido com 16% de alíquota ' || v_salario);
    ELSE 
        v_salario := v_salario * 0.715;
        dbms_output.put_line('Salario Liquido com 28,5% de alíquota ' || v_salario);
    END IF;
END;
