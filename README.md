# 📊 Análise Físico-Financeira e Monitoramento de Desvios em Obras de Infraestrutura

Este repositório contém uma solução de **Análise de Dados de Negócio** desenvolvida em **SQL** para acompanhamento do avanço físico-financeiro de contratos de infraestrutura rodoviária e obras públicas.

---

## 🎯 Objetivo do Projeto
Identificar precocemente desvios de escopo, prazo e custo em relação ao planejado (previsto x realizado), permitindo que gestores e lideranças operacionais tomem decisões preventivas antes do estouro de orçamentos ou atrasos cronológicos severos.

---

## 🛠️ Tecnologias Utilizadas
* **SQL (DDL/DML):** Criação de esquemas relacionais, joins e funções de agregação.
* **SQL Avançado:** *Window Functions* e lógica condicional (`CASE WHEN`) para acompanhamento de desvios.
* **Modelagem de KPIs:** Indicadores de Aderência Físico-Financeira e Alertas Automáticos de Risco.

---

## 📐 Estrutura do Banco de Dados
A modelagem foi estruturada em duas entidades principais:
1. `Contratos`: Dados cadastrais do empreendimento, cronograma base e valor total contratado.
2. `Medicoes`: Histórico periódico de avanço físico e financeiro (previsto vs. realizado).

---

## 🔍 Principais Insights das Consultas SQL
* **Geração de Alertas Automáticos:** Categorização dinâmica de contratos entre `Dentro do Planejado`, `Desvio Leve` e `Atraso Crítico` baseado no limite de tolerância de variação percentual.
* **Métricas de Aderência:** Apuração direta da diferença acumulada em Reais (R$) e em percentual físico (%) para apoiar reuniões de controle.

---

## 👩‍💻 Autora
**Mariane Aguiar**  
*Engenheira | Analista de Planejamento e Dados*  
[LinkedIn](https://www.linkedin.com/in/mariane-de-aguiar)
