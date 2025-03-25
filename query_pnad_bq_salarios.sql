SELECT
    x1.mes,
    x1.sigla_uf,


    AVG(x1.c01012) AS salario_normal,
    AVG(x1.c011a12) AS salario_efetivo,

FROM
    basedosdados.br_ibge_pnad_covid.microdados AS x1
WHERE
    x1.mes BETWEEN 9 AND 11 AND x1.c001 = '1'

GROUP BY
    x1.mes,
    x1.sigla_uf

ORDER BY
    x1.mes;