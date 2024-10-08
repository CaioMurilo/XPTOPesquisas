/* 
Participantes do Grupo:
-> Gustav Victor Silva Ribeiro
-> João Pedro Gonçalves Oliveira
-> Caio Murilo Silva de Oliveira
*/

-- Criando o nosso Banco de Dados
CREATE DATABASE XPTOPesquisas;
USE XPTOPesquisas;

-- tabela de Endereços
CREATE TABLE Enderecos (
    id INT auto_increment PRIMARY KEY,
    cidade VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL
);

-- tabela de Projetos
CREATE TABLE Projetos (
    id INT auto_increment PRIMARY KEY,
    nome_projeto VARCHAR(255) NOT NULL,
    valor_projeto DECIMAL(10, 2) CHECK (valor_projeto >= 0),
    departamento VARCHAR(255) NOT NULL,
    filial_departamento VARCHAR(8) NOT NULL,
    fonte_financiadora VARCHAR(255) NOT NULL,
    valor_fonteFinanciadora DECIMAL(10, 2) CHECK (valor_fonteFinanciadora >= 0)
);

-- tabela de Pesquisadores
CREATE TABLE Pesquisadores (
    id INT auto_increment PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    status ENUM('Ativo', 'Inativo') default 'Ativo',
    valor_bolsa DECIMAL(10, 2) CHECK (valor_bolsa >= 0),
    departamento VARCHAR(45) NOT NULL,
    endereco_id INT NOT NULL,
    projeto_id INT,
    FOREIGN KEY (endereco_id) REFERENCES Enderecos(id), -- Relaciona a tabela "Pesquisadores" a tabela "Enderecos" (Um para Muitos ou 1-n)
    FOREIGN KEY (projeto_id) REFERENCES Projetos(id)  -- Relaciona a tabela "Pesquisadores" à tabela "Projetos" (Um para Muitos ou 1-n)
);

-- Inserção de dados na tabela de Endereços
INSERT INTO Enderecos (cidade, estado) VALUES 
('Boa Vista', 'Roraima'),
('Palmas', 'Tocantins'),
('Porto Alegre', 'Rio Grande do Sul'),
('Macapá', 'Amapá'),
('Belém', 'Pará'),
('Cabo Frio', 'Rio de Janeiro'),
('Campinas', 'São Paulo'),
('Guarulhos', 'São Paulo'),
('Belo Horizonte', 'Minas Gerais'),
('São Paulo', 'São Paulo');

-- Inserção de dados na tabela de Projetos
INSERT INTO Projetos (nome_projeto, valor_projeto, departamento, filial_departamento, fonte_financiadora, valor_fonteFinanciadora) VALUES 
('Acesso a Oportunidades', 15000.00, 'DIDES', 'NORTE', 'BID - Banco Interamericano de Desenvolvimento', 100000.00),
('Brasil em Desenvolvimento', 19000.00, 'DIRUR', 'SUL', 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social', 30000.00),
('Emprego no Turismo', 35000.00, 'DIMAC', 'NORTE', 'BID - Banco Interamericano de Desenvolvimento', 100000.00),
('Mapa das Organizações da Sociedade Civil', 55000.00, 'DIMAC', 'SUL', 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social', 200000.00),
('Observatório de Gestão do Conhecimento', 20000.00, 'DIDES', 'SUL', 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social', 50000.00),
('Atlas da Violência', 45000.00, 'DINTE', 'SUDESTE', 'BANERJ - Banco do Estado do Rio de Janeiro', 70000.00),
('Centro de Pesquisa em Ciência, Tecnologia e Sociedade', 25000.00, 'DISOC', 'SUDESTE', 'BANESPA - Banco do Estado de São Paulo', 45000.00),
('Retrato das Desigualdades de Gênero e Raça', 32000.00, 'DISOC', 'SUDESTE', 'BANESPA - Banco do Estado de São Paulo', 85000.00),
('Índice de Vulnerabilidade Social', 60000.00, 'DISOC', 'SUDESTE', 'BDMG - Banco de Desenvolvimento de Minas Gerais', 120000.00);

-- Inserção de dados na tabela de Pesquisadores
INSERT INTO Pesquisadores (nome_completo, status, valor_bolsa, departamento, endereco_id, projeto_id)
VALUES 
('Miguel Silva', 'Ativo', 3100.00, 'DIDES', 1, 1),
('Arthur Carvalho', 'Ativo', 2500.00, 'DIMAC', 2, 3),
('Helena Sousa', 'Inativo', 4000.00, 'DIRUR', 3, 2),
('Laura Pereira', 'Ativo', 2500.00, 'DIMAC', 4, 4),
('Gabriel Luz', 'Ativo', 3200.00, 'DIDES', 5, 1),
('Samuel Santos', 'Inativo', 2000.00, 'DIDES', 2, 1),
('Maria Oliveira', 'Ativo', 2500.00, 'DIDES', 1, 1),
('Alice Rodrigues', 'Ativo', 3100.00, 'DIRUR', 9, 2),
('Bernardo Alves', 'Ativo', 2000.00, 'DIMAC', 10, 3),
('Theo Gomes', 'Inativo', 2500.00, 'DIDES', 1, 1),
('Ailton Santos', 'Ativo', 3100.00, 'DINTE', 6, 6),
('Ana Beatriz', 'Ativo', 2100.00, 'DISOC', 7, 7),
('Bruno Gomes', 'Ativo', 3500.00, 'DISOC', 8, 8),
('Leticia Rodrigues', 'Ativo', 2500.00, 'DISOC', 9, 9),
('Vinicius Silva', 'Ativo', 2800.00, 'DINTE', 10, 6);

-- Consulta 01: Recupera o nome do projeto e o nome da fonte financiadora diretamente da tabela Projetos
SELECT nome_projeto, fonte_financiadora
FROM Projetos;

-- Consulta 02: Seleciona os nomes dos projetos e os departamentos responsáveis por cada projeto da tabela Projetos
SELECT nome_projeto, departamento
FROM Projetos;

-- Consulta 03: Utiliza-se "Join" para unir as tabelas Pesquisadores e Projetos, filtrando os resultados para a filial "NORTE"
SELECT P.nome_completo, PR.filial_departamento
FROM Pesquisadores P
JOIN Projetos PR ON P.projeto_id = PR.id
WHERE PR.filial_departamento = 'NORTE';

-- Consulta 04: filtrando pela filial "SUL"
SELECT P.nome_completo, PR.filial_departamento
FROM Pesquisadores P
JOIN Projetos PR ON P.projeto_id = PR.id
WHERE PR.filial_departamento = 'SUL';

SELECT * FROM Pesquisadores;
SELECT * FROM Projetos;

-- Consulta 05: Busca o nome do pesquisador, cidade e nome do projeto, filtrando pelo projeto "Acesso a Oportunidades"
SELECT p.nome_completo, e.cidade, pr.nome_projeto
FROM Pesquisadores p
JOIN Enderecos e ON p.endereco_id = e.id
JOIN Projetos pr ON p.projeto_id = pr.id
WHERE pr.nome_projeto = 'Acesso a Oportunidades';

-- Consulta 06: Busca o nome do pesquisador, o valor da bolsa, o projeto associado e o departamento para pesquisadores que residem em "Roraima"
SELECT p.nome_completo, p.valor_bolsa, pr.nome_projeto, p.departamento
FROM Pesquisadores p
JOIN Projetos pr ON p.projeto_id = pr.id
JOIN Enderecos e ON p.endereco_id = e.id
WHERE e.estado = 'Roraima';

-- Consulta 7: listar todos os pesquisadores, valor da bolsa, projeto, departamento e localização (cidade e estado), utilizando um JOIN
SELECT p.nome_completo, p.valor_bolsa, pr.nome_projeto, p.departamento, e.cidade, e.estado
FROM Pesquisadores p
JOIN Projetos pr ON p.projeto_id = pr.id
JOIN Enderecos e ON p.endereco_id = e.id;

-- Consulta 8: Usar a função COUNT para contar os pesquisadores por estado e mostrar o estado com o maior número de pesquisadores.
SELECT e.estado, COUNT(*) AS quantidade_pesquisadores
FROM Pesquisadores p
JOIN Enderecos e ON p.endereco_id = e.id
GROUP BY e.estado
ORDER BY quantidade_pesquisadores DESC LIMIT 1;

-- Consulta 9: Lista os projetos com informações sobre o departamento, filial, fonte financiadora, valor a ser investido e valor do projeto, ordenando pelos maiores valores de financiamento
SELECT nome_projeto, departamento, filial_departamento, fonte_financiadora, valor_fonteFinanciadora, valor_projeto
FROM Projetos
ORDER BY valor_fonteFinanciadora DESC;