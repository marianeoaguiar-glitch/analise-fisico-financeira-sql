-- =====================================================================
-- PROJETO: Análise Físico-Financeira de Contratos de Infraestrutura
-- AUTORA: Mariane Aguiar
-- TECNOLOGIAS: SQL, Power BI
-- =====================================================================

-- 1. CRIAÇÃO DAS TABELAS
CREATE TABLE IF NOT EXISTS Contratos (
    contrato_id INT PRIMARY KEY,
    nome_contrato VARCHAR(100),
    tipo_obra VARCHAR(50),
    data_inicio DATE,
    data_fim_prevista DATE,
    valor_contratado DECIMAL(15, 2)
);

CREATE TABLE IF NOT EXISTS Medicoes (
    medicao_id INT PRIMARY KEY,
    contrato_id INT,
    numero_medicao INT,
    data_medicao DATE,
    valor_previsto_acumulado DECIMAL(15, 2),
    valor_realizado_acumulado DECIMAL(15, 2),
    avanco_fisico_previsto_pct DECIMAL(5, 2),
    avanco_fisico_realizado_pct DECIMAL(5, 2),
    FOREIGN KEY (contrato_id) REFERENCES Contratos(contrato_id)
);

-- 2. INSERÇÃO DE DADOS SIMULADOS DE OPERAÇÕES
INSERT INTO Contratos VALUES
(101, 'Duplicação Rodovia SP-330', 'Infraestrutura Rodoviária', '2024-01-15', '2025-06-30', 45000000.00),
(102, 'Restauração Pista Leste SP-070', 'Infraestrutura Rodoviária', '2024-03-01', '2024-12-20', 18500000.00),
(103, 'Adequação de Passarela e Acessibilidade', 'Obras de Arte Especiais', '2024-02-10', '2024-09-30', 6200000.00);

INSERT INTO Medicoes VALUES
(1, 101, 1, '2024-02-28', 3500000.00, 3100000.00, 7.78, 6.89),
(2, 101, 2, '2024-03-31', 7800000.00, 6900000.00, 17.33, 15.33),
(3, 101, 3, '2024-04-30', 12500000.00, 10200000.00, 27.78, 22.67),
(4, 102, 1, '2024-04-15', 2000000.00, 2100000.00, 10.81, 11.35),
(5, 102, 2, '2024-05-15', 5500000.00, 5300000.00, 29.73, 28.65),
(6, 103, 1, '2024-03-15', 1000000.00, 800000.00, 16.13, 12.90);

-- 3. CONSULTAS ANALÍTICAS E IDENTIFICAÇÃO DE DESVIOS
SELECT 
    c.nome_contrato,
    m.numero_medicao,
    m.data_medicao,
    m.valor_previsto_acumulado,
    m.valor_realizado_acumulado,
    (m.valor_realizado_acumulado - m.valor_previsto_acumulado) AS desvio_financeiro_R$,
    m.avanco_fisico_previsto_pct,
    m.avanco_fisico_realizado_pct,
    ROUND(m.avanco_fisico_realizado_pct - m.avanco_fisico_previsto_pct, 2) AS desvio_fisico_pct,
    CASE 
        WHEN (m.avanco_fisico_realizado_pct - m.avanco_fisico_previsto_pct) < -3.00 THEN 'Atenção: Atraso Crítico'
        WHEN (m.avanco_fisico_realizado_pct - m.avanco_fisico_previsto_pct) < 0 THEN 'Desvio Leve'
        ELSE 'Dentro do Planejado / Adiantado'
    END AS status_alerta
FROM Medicoes m
JOIN Contratos c ON m.contrato_id = c.contrato_id
ORDER BY c.nome_contrato, m.numero_medicao;
