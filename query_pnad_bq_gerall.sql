SELECT
    x1.mes,
    COUNT(*) AS qtd_amostra,

    -- Categorizando por faixa de idade
    CASE
        WHEN SAFE_CAST(x1.a002 AS INT64) <= 9 THEN '0 a 9 anos'
        WHEN SAFE_CAST(x1.a002 AS INT64) BETWEEN 10 AND 19 THEN '10 a 19 anos'
        WHEN SAFE_CAST(x1.a002 AS INT64) BETWEEN 20 AND 29 THEN '20 a 29 anos'
        WHEN SAFE_CAST(x1.a002 AS INT64) BETWEEN 30 AND 59 THEN '30 a 59 anos'
        WHEN SAFE_CAST(x1.a002 AS INT64) >= 60 THEN '60 anos ou mais'
        ELSE 'Outros'
    END AS faixa_idade,

    -- Categorizando por sexo
    CASE
        WHEN SAFE_CAST(x1.a003 AS INT64) = 1 THEN 'Homem'
        WHEN SAFE_CAST(x1.a003 AS INT64) = 2 THEN 'Mulher'
        ELSE 'Outros'
    END AS sexo,

    -- Categorizando raça/cor
    CASE
        WHEN SAFE_CAST(x1.a004 AS INT64) = 1 THEN 'Branca'
        WHEN SAFE_CAST(x1.a004 AS INT64) = 2 THEN 'Preta'
        WHEN SAFE_CAST(x1.a004 AS INT64) = 3 THEN 'Amarela'
        WHEN SAFE_CAST(x1.a004 AS INT64) = 4 THEN 'Parda'
        WHEN SAFE_CAST(x1.a004 AS INT64) = 5 THEN 'Indigena'
        WHEN SAFE_CAST(x1.a004 AS INT64) = 9 THEN 'Ignorado'
        ELSE 'Outros'
    END AS raca,

    -- Categorizando por escolaridade
    CASE
        WHEN SAFE_CAST(x1.a005 AS INT64) = 1 THEN 'Sem instrução'
        WHEN SAFE_CAST(x1.a005 AS INT64) = 2 THEN 'Fundamental incompleto'
        WHEN SAFE_CAST(x1.a005 AS INT64) = 3 THEN 'Fundamental completo'
        WHEN SAFE_CAST(x1.a005 AS INT64) = 4 THEN 'Médio incompleto'
        WHEN SAFE_CAST(x1.a005 AS INT64) = 5 THEN 'Médio completo'
        WHEN SAFE_CAST(x1.a005 AS INT64) = 6 THEN 'Superior incompleto'
        WHEN SAFE_CAST(x1.a005 AS INT64) = 7 THEN 'Superior completo'
        WHEN SAFE_CAST(x1.a005 AS INT64) = 8 THEN 'Pós-graduação, mestrado ou doutorado'
        ELSE 'Outros'
    END AS escolaridade,

    -- Categorizando por presença de pelo menos 1 sintoma
    CASE
        WHEN SAFE_CAST(x1.b0011 AS INT64) = 1 OR SAFE_CAST(x1.b0012 AS INT64) = 1 OR SAFE_CAST(x1.b0013 AS INT64) = 1 OR
             SAFE_CAST(x1.b0014 AS INT64) = 1 OR SAFE_CAST(x1.b0015 AS INT64) = 1 OR SAFE_CAST(x1.b0016 AS INT64) = 1 OR
             SAFE_CAST(x1.b0017 AS INT64) = 1 OR SAFE_CAST(x1.b0018 AS INT64) = 1 OR SAFE_CAST(x1.b0019 AS INT64) = 1 OR
             SAFE_CAST(x1.b00110 AS INT64) = 1 OR SAFE_CAST(x1.b00111 AS INT64) = 1 OR SAFE_CAST(x1.b00112 AS INT64) = 1 OR
             SAFE_CAST(x1.b00113 AS INT64) = 1 THEN 'Sim'
        ELSE 'Nao'
    END AS teve_sintoma,

    -- Categorizando por presença de pelo menos 1 doença
    CASE
        WHEN SAFE_CAST(x1.b0101 AS INT64) = 1 OR SAFE_CAST(x1.b0102 AS INT64) = 1 OR SAFE_CAST(x1.b0103 AS INT64) = 1 OR
             SAFE_CAST(x1.b0104 AS INT64) = 1 OR SAFE_CAST(x1.b0105 AS INT64) = 1 OR SAFE_CAST(x1.b0106 AS INT64) = 1 THEN 'Sim'
        ELSE 'Nao'
    END AS tem_doenca,

    -- Categorizando por resultados positivos e negativos
    CASE
        WHEN SAFE_CAST(x1.b009b AS INT64) = 1 OR SAFE_CAST(x1.b009d AS INT64) = 1 OR SAFE_CAST(x1.b009f AS INT64) = 1 THEN 'Sim'
        ELSE 'Nao'
    END AS positivo_covid,

    -- Categorizando por necessidade de internação
    CASE
        WHEN SAFE_CAST(x1.b005 AS INT64) = 1 THEN 'Sim'
        ELSE 'Nao'
    END AS ficou_internado,

    -- Categorizando por necessidade de sedação
    CASE
        WHEN SAFE_CAST(x1.b006 AS INT64) = 1 THEN 'Sim'
        ELSE 'Nao'
    END AS foi_sedado,

    -- Categorizando por posse de plano de saúde
    CASE
        WHEN SAFE_CAST(x1.b007 AS INT64) = 1 THEN 'Sim'
        ELSE 'Nao'
    END AS plano_de_saude,

    -- Categorizando por realização de teste
    CASE
        WHEN SAFE_CAST(x1.b008 AS INT64) = 1 THEN 'Sim'
        ELSE 'Nao'
    END AS fez_teste,

    -- Categorizando por procura de estabelecimento
    CASE
        WHEN SAFE_CAST(x1.b002 AS INT64) = 1 THEN 'Sim'
        ELSE 'Nao'
    END AS procurou_estabelecimento,

 
    -- Contagem das caracteristicas
    COUNT(CASE WHEN SAFE_CAST(x1.b0011 AS INT64) = 1 THEN 1 END) AS febre,
    COUNT(CASE WHEN SAFE_CAST(x1.b0012 AS INT64) = 1 THEN 1 END) AS tosse,
    COUNT(CASE WHEN SAFE_CAST(x1.b0013 AS INT64) = 1 THEN 1 END) AS dor_garganta,
    COUNT(CASE WHEN SAFE_CAST(x1.b0014 AS INT64) = 1 THEN 1 END) AS dificuldade_respirar,
    COUNT(CASE WHEN SAFE_CAST(x1.b0015 AS INT64) = 1 THEN 1 END) AS dor_cabeca,
    COUNT(CASE WHEN SAFE_CAST(x1.b0016 AS INT64) = 1 THEN 1 END) AS dor_peito,
    COUNT(CASE WHEN SAFE_CAST(x1.b0017 AS INT64) = 1 THEN 1 END) AS nausea,
    COUNT(CASE WHEN SAFE_CAST(x1.b0018 AS INT64) = 1 THEN 1 END) AS nariz_entupido,
    COUNT(CASE WHEN SAFE_CAST(x1.b0019 AS INT64) = 1 THEN 1 END) AS fadiga,
    COUNT(CASE WHEN SAFE_CAST(x1.b00110 AS INT64) = 1 THEN 1 END) AS dor_olhos,
    COUNT(CASE WHEN SAFE_CAST(x1.b00111 AS INT64) = 1 THEN 1 END) AS perda_cheiro,
    COUNT(CASE WHEN SAFE_CAST(x1.b00112 AS INT64) = 1 THEN 1 END) AS dor_muscular,
    COUNT(CASE WHEN SAFE_CAST(x1.b00113 AS INT64) = 1 THEN 1 END) AS diarreia,
    COUNT(CASE WHEN SAFE_CAST(x1.b002 AS INT64) = 1 THEN 1 END) AS procurou_estabelecimento_saude,
    COUNT(CASE WHEN SAFE_CAST(x1.b0031 AS INT64) = 1 THEN 1 END) AS ficou_em_casa,
    COUNT(CASE WHEN SAFE_CAST(x1.b0032 AS INT64) = 1 THEN 1 END) AS ligou_profissional_saude,
    COUNT(CASE WHEN SAFE_CAST(x1.b0033 AS INT64) = 1 THEN 1 END) AS tomou_remedio_conta_propria,
    COUNT(CASE WHEN SAFE_CAST(x1.b0034 AS INT64) = 1 THEN 1 END) AS tomou_remedio_orient_medica,
    COUNT(CASE WHEN SAFE_CAST(x1.b0035 AS INT64) = 1 THEN 1 END) AS recebeu_visita_SUS,
    COUNT(CASE WHEN SAFE_CAST(x1.b0036 AS INT64) = 1 THEN 1 END) AS recebeu_visita_Particular,
    COUNT(CASE WHEN SAFE_CAST(x1.b0037 AS INT64) = 1 THEN 1 END) AS outra_providencia,
    COUNT(CASE WHEN SAFE_CAST(x1.b0041 AS INT64) = 1 THEN 1 END) AS posto_saude,
    COUNT(CASE WHEN SAFE_CAST(x1.b0042 AS INT64) = 1 THEN 1 END) AS UPA,
    COUNT(CASE WHEN SAFE_CAST(x1.b0043 AS INT64) = 1 THEN 1 END) AS hospital_SUS,
    COUNT(CASE WHEN SAFE_CAST(x1.b0044 AS INT64) = 1 THEN 1 END) AS ambulatorio_forcas_armadas,
    COUNT(CASE WHEN SAFE_CAST(x1.b0045 AS INT64) = 1 THEN 1 END) AS pronto_socorro_forcas_armadas,
    COUNT(CASE WHEN SAFE_CAST(x1.b0046 AS INT64) = 1 THEN 1 END) AS hospital_forcas_armadas,
    COUNT(CASE WHEN SAFE_CAST(x1.b005 AS INT64) = 1 THEN 1 END) AS internado,
    COUNT(CASE WHEN SAFE_CAST(x1.b006 AS INT64) = 1 THEN 1 END) AS sedado,
    COUNT(CASE WHEN SAFE_CAST(x1.b007 AS INT64) = 1 THEN 1 END) AS Tem_plano_saude,
    COUNT(CASE WHEN SAFE_CAST(x1.b008 AS INT64) = 1 THEN 1 END) AS fez_teste_covid,
    COUNT(CASE WHEN SAFE_CAST(x1.b009a AS INT64) = 1 THEN 1 END) AS swab,
    COUNT(CASE WHEN SAFE_CAST(x1.b009b AS INT64) = 1 THEN 1 END) AS positivo_swab,
    COUNT(CASE WHEN SAFE_CAST(x1.b009c AS INT64) = 1 THEN 1 END) AS furo_dedo,
    COUNT(CASE WHEN SAFE_CAST(x1.b009d AS INT64) = 1 THEN 1 END) AS positivo_furo_dedo,
    COUNT(CASE WHEN SAFE_CAST(x1.b009e AS INT64) = 1 THEN 1 END) AS veia_do_braco,
    COUNT(CASE WHEN SAFE_CAST(x1.b009f AS INT64) = 1 THEN 1 END) AS positivo_veia,
    COUNT(CASE WHEN SAFE_CAST(x1.b0101 AS INT64) = 1 THEN 1 END) AS teve_diabetes,
    COUNT(CASE WHEN SAFE_CAST(x1.b0102 AS INT64) = 1 THEN 1 END) AS teve_hipertensao,
    COUNT(CASE WHEN SAFE_CAST(x1.b0103 AS INT64) = 1 THEN 1 END) AS teve_doenca_pulmonar,
    COUNT(CASE WHEN SAFE_CAST(x1.b0104 AS INT64) = 1 THEN 1 END) AS teve_doenca_coracao,
    COUNT(CASE WHEN SAFE_CAST(x1.b0105 AS INT64) = 1 THEN 1 END) AS teve_depressao,
    COUNT(CASE WHEN SAFE_CAST(x1.b0106 AS INT64) = 1 THEN 1 END) AS teve_cancer,


FROM
    basedosdados.br_ibge_pnad_covid.microdados AS x1
WHERE
    x1.mes BETWEEN 9 AND 11
GROUP BY
    x1.mes,
    faixa_idade,
    sexo,
    raca,
    escolaridade,
    teve_sintoma,
    tem_doenca,
    positivo_covid,
    ficou_internado,
    foi_sedado,
    plano_de_saude,
    fez_teste,
    procurou_estabelecimento
ORDER BY
    x1.mes;