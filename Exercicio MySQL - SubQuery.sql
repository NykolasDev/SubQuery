-- 1.
select nome_funcionario, nome_depto 
from funcionario, departamento
where nome_depto 
like '%Recursos Humanos%';

-- 2.
SELECT DISTINCT nome_funcionario
FROM funcionario
WHERE codfuncionario IN (
    SELECT codfuncionario
    FROM projeto
    WHERE sigla_depto IN ('MKT', 'HR')
);

-- 3.
SELECT nome_depto, (
    SELECT SUM(salario)
    FROM funcionario
    WHERE sigla_depto = sigla_depto
) AS total_salarios
FROM departamento;

-- 4.
SELECT nome_funcionario
FROM funcionario
WHERE sigla_depto = 'IT' and salario > (
     SELECT AVG(salario)
     FROM funcionario
     WHERE sigla_depto = 'IT'
);

-- 5. 
SELECT nome_depto, (
     SELECT COUNT(codfuncionario)
     FROM funcionario
     WHERE sigla_depto = sigla_depto
) AS qtdfuncionariosdepto
FROM departamento;

-- 6.
SELECT nome_funcionario
FROM funcionario
WHERE sigla_depto = 'HR' 
AND salario > (SELECT AVG(salario) FROM funcionario WHERE sigla_depto = 'HR');

-- 7. 
SELECT nome_depto,
       (SELECT GROUP_CONCAT(nome_funcionario SEPARATOR ', ')
        FROM funcionario
        WHERE sigla_depto = d.sigla_depto) AS funcionarios
FROM departamento d;








