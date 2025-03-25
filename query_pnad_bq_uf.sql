SELECT
    x1.mes,
    x1.sigla_uf,
    COUNT(*) AS qtd_amostra,
    SUM(x1.v1032) AS qtd_estimada,


    -- Teve Sintoma
    CASE
        WHEN SAFE_CAST(x1.b0011 AS INT64) = 1 OR SAFE_CAST(x1.b0012 AS INT64) = 1 OR SAFE_CAST(x1.b0013 AS INT64) = 1 OR
             SAFE_CAST(x1.b0014 AS INT64) = 1 OR SAFE_CAST(x1.b0015 AS INT64) = 1 OR SAFE_CAST(x1.b0016 AS INT64) = 1 OR
             SAFE_CAST(x1.b0017 AS INT64) = 1 OR SAFE_CAST(x1.b0018 AS INT64) = 1 OR SAFE_CAST(x1.b0019 AS INT64) = 1 OR
             SAFE_CAST(x1.b00110 AS INT64) = 1 OR SAFE_CAST(x1.b00111 AS INT64) = 1 OR SAFE_CAST(x1.b00112 AS INT64) = 1 OR
             SAFE_CAST(x1.b00113 AS INT64) = 1 THEN 1
        ELSE 0
    END AS teve_sintoma,


    -- Tem Doença
    CASE
        WHEN SAFE_CAST(x1.b0101 AS INT64) = 1 OR SAFE_CAST(x1.b0102 AS INT64) = 1 OR SAFE_CAST(x1.b0103 AS INT64) = 1 OR
             SAFE_CAST(x1.b0104 AS INT64) = 1 OR SAFE_CAST(x1.b0105 AS INT64) = 1 OR SAFE_CAST(x1.b0106 AS INT64) = 1 THEN 1
        ELSE 0
    END AS tem_doenca,

    -- Positivo Covid
    CASE
        WHEN SAFE_CAST(x1.b009b AS INT64) = 1 OR SAFE_CAST(x1.b009d AS INT64) = 1 OR SAFE_CAST(x1.b009f AS INT64) = 1 THEN 1
        ELSE 0
    END AS positivo_covid,

    -- Ficou Internado
    CASE
        WHEN SAFE_CAST(x1.b005 AS INT64) = 1 THEN 1
        ELSE 0
    END AS internado,

    -- Foi Sedado
    CASE
        WHEN SAFE_CAST(x1.b006 AS INT64) = 1 THEN 1
        ELSE 0
    END AS foi_sedado,

    -- Plano de Saúde
    CASE
        WHEN SAFE_CAST(x1.b007 AS INT64) = 1 THEN 1
        ELSE 0
    END AS plano_de_saude,

    -- Fez Teste
    CASE
        WHEN SAFE_CAST(x1.b008 AS INT64) = 1 THEN 1
        ELSE 0
    END AS fez_teste,

    -- Procurou Estabelecimento
    CASE
        WHEN SAFE_CAST(x1.b002 AS INT64) = 1 THEN 1
        ELSE 0
    END AS procurou_estabelecimento,

   
    -- Levantamento quantitativo das caracteristicas
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
    COUNT(CASE WHEN SAFE_CAST(x1.b005 AS INT64) = 1 THEN 1 END) AS ficou_internado,
    COUNT(CASE WHEN SAFE_CAST(x1.b006 AS INT64) = 1 THEN 1 END) AS ficou_sedado,
    COUNT(CASE WHEN SAFE_CAST(x1.b007 AS INT64) = 1 THEN 1 END) AS Tem_plano_saude,
    COUNT(CASE WHEN SAFE_CAST(x1.b008 AS INT64) = 1 THEN 1 END) AS fez_teste_covid,
    COUNT(CASE WHEN SAFE_CAST(x1.b009b AS INT64) = 1 THEN 1 END) AS positivo_swab,
    COUNT(CASE WHEN SAFE_CAST(x1.b009d AS INT64) = 1 THEN 1 END) AS positivo_furo_dedo,
    COUNT(CASE WHEN SAFE_CAST(x1.b009f AS INT64) = 1 THEN 1 END) AS positivo_veia,
    COUNT(CASE WHEN SAFE_CAST(x1.b0101 AS INT64) = 1 THEN 1 END) AS teve_diabetes,
    COUNT(CASE WHEN SAFE_CAST(x1.b0102 AS INT64) = 1 THEN 1 END) AS teve_hipertensao,
    COUNT(CASE WHEN SAFE_CAST(x1.b0103 AS INT64) = 1 THEN 1 END) AS teve_doenca_pulmonar,
    COUNT(CASE WHEN SAFE_CAST(x1.b0104 AS INT64) = 1 THEN 1 END) AS teve_doenca_coracao,
    COUNT(CASE WHEN SAFE_CAST(x1.b0105 AS INT64) = 1 THEN 1 END) AS teve_depressao,
    COUNT(CASE WHEN SAFE_CAST(x1.b0106 AS INT64) = 1 THEN 1 END) AS teve_cancer,
    COUNT(CASE WHEN SAFE_CAST(x1.c001 AS INT64) = 1 THEN 1 END) AS trabalhou,
    COUNT(CASE WHEN SAFE_CAST(x1.c002 AS INT64) = 1 THEN 1 END) AS afastado_trabalho

FROM
    basedosdados.br_ibge_pnad_covid.microdados AS x1
WHERE
    x1.mes BETWEEN 9 AND 11
GROUP BY
    x1.mes,
    x1.sigla_uf,
    teve_sintoma,
    tem_doenca,
    positivo_covid,
    internado,
    foi_sedado,
    plano_de_saude,
    fez_teste,
    procurou_estabelecimento
    
ORDER BY
    x1.mes;