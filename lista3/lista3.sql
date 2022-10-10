SELECT CONCAT(primeiro_nome, ' ', sobrenome) as nome_completo, nome as nome_dep, descricao as descricao_escolaridade, 
salario+bonus as rendimento_total, 
salario+bonus + (((salario+bonus)*5)/100) as rendimento_total_acrescido 
from empregado join departamento USING(id_departamento) 
join nivel_escolaridade USING (id_nivel_escolaridade) 
where salario+bonus + (((salario+bonus)*5)/100) <= 20000 ORDER by sobrenome;

SELECT sobrenome, nome as nome_departamento, descricao as nivel_escolaridade, (salario+1200) as novo_salario, (bonus/2) as novo_bonus 
from empregado JOIN departamento USING (id_departamento) 
join nivel_escolaridade USING (id_nivel_escolaridade) 
where id_nivel_escolaridade BETWEEN 2 and 7 ORDER by sobrenome;

SELECT sobrenome, nome as nome_departamento, salario, salario-100 as salario_reduzido 
from empregado JOIN departamento USING (id_departamento) 
where departamento.nome LIKE 'Testes' or (salario - (salario*0.8)) or (salario +(salario*120)/100) >= 5000;

select departamento.id_departamento, nome, coalesce(id_departamento_gerencia,'Desconhecido'), sobrenome from departamento  
join empregado on id_gerente=id_empregado;

select id_empregado, sobrenome, format((datediff(data_contratacao, data_nascimento)/365),0) as 'idade de contratacao' from empregado 
where (datediff(data_contratacao, data_nascimento)/365)<25 order by datediff(curdate(),data_nascimento);