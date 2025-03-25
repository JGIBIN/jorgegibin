# Análise do Comportamento da População durante a Pandemia de COVID-19

## Resumo

Este projeto foi realizado com o objetivo de compreender o impacto da pandemia de COVID-19 na população brasileira. A análise utilizou dados da **PNAD-COVID19**, fornecida pelo IBGE, abrangendo o período de setembro a novembro de 2020. O estudo visou identificar padrões de comportamento e sintomas prevalentes em diferentes faixas etárias, além de explorar a relação entre doenças crônicas e complicações associadas, como internações e intubações. Os resultados foram utilizados para fornecer recomendações estratégicas visando otimizar a gestão de recursos durante novos surtos.

## Objetivos

O principal objetivo deste estudo foi:

- **Identificar padrões de comportamento** e **sintomas prevalentes** em diferentes faixas etárias.
- **Explorar a relação entre doenças crônicas** e complicações como internações e necessidade de intubação.
- **Auxiliar na gestão de recursos hospitalares**, com foco no planejamento de estoques de medicamentos e alocação de equipes médicas.

## Etapas do Projeto

O processo de análise foi dividido nas seguintes etapas:

### 1. **Análise Exploratória de Dados**
   - Análise das características gerais dos entrevistados durante o período analisado.
   - Identificação da prevalência dos sintomas mais comuns nas distintas faixas etárias.
   - Investigação dos padrões de comportamento da população, como adesão a medidas de distanciamento social, uso de máscaras e outros fatores de prevenção.

### 2. **Análise de Cluster (K-means)**
   - Aplicação de **Multiple Correspondence Analysis (MCA)** para analisar dados categóricos e identificar relações entre variáveis.
   - Utilização do algoritmo **K-means** para agrupar a população em clusters, revelando padrões de sintomas e características sociodemográficas similares.

### 3. **Correlação de Variáveis**
   - Análise das correlações entre a presença de sintomas e a ocorrência de comorbidades, internações e complicações graves, como a necessidade de intubação.

## Tecnologias Utilizadas

- **Python**: Utilizado para análise de dados, tratamento de dados categóricos e execução de algoritmos de Machine Learning, como o K-means.
- **Power BI e Looker Studio**: Para criação de dashboards interativos e visualizações dinâmicas dos dados.
- **BigQuery**: Utilizado para acessar e manipular a base de dados em nuvem.

## Resultados

- **Sintomas mais relevantes**: A análise identificou que os sintomas mais prevalentes em casos de COVID-19 foram comuns em populações mais vulneráveis, especialmente em indivíduos com comorbidades e idosos.
- **Segmentação por Clusters**: A análise de cluster permitiu segmentar a população em grupos com características similares, ajudando no planejamento de recursos hospitalares e priorização de atendimentos.
- **Recomendações Estratégicas**: Foram elaboradas recomendações para o planejamento de estoques de medicamentos e a alocação eficiente de equipes médicas, com base nas previsões de demanda para diferentes grupos da população.

## Conclusão

O estudo forneceu insights valiosos sobre o comportamento da população brasileira durante a pandemia de COVID-19 e as principais características associadas ao agravamento da doença. A análise de dados ajudou a desenvolver uma compreensão mais profunda das necessidades da população, proporcionando recomendações para otimizar a resposta de saúde pública em futuros surtos.

## Referências

- **IBGE**: Base de dados PNAD-COVID19 (2020).
- **Power BI e Looker Studio**: Utilização de Power BI para criação de dashboards interativos.
- **Python**: Bibliotecas utilizadas para análise de dados no Google Colab.

## Licença

Este repositório está licenciado sob a Licença MIT. Veja o arquivo `LICENSE` para mais informações.
