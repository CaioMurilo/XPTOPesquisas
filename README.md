# XPTOPesquisas - AT2 - Laboratório de Banco de Dados

Descrição do projeto:

Para este projeto, considere que a sua equipe foi contratada pela empresa XPTOPesquisas para desenvolver um banco de dados para o registro de pesquisadores e projetos de pesquisa. A empresa tem por finalidade realizar pesquisas e estudos sociais e econômicos. Ela dá apoio técnico e institucional ao Estado brasileiro na avaliação, formulação e acompanhamento de políticas públicas e programas de desenvolvimento. Foram repassados os seguintes requisitos para a construção do modelo de dados:


• O sistema tem a função de cadastrar pesquisadores e projetos. Cada pesquisador pode participar de apenas um projeto. Por sua vez, um projeto pode ter vários pesquisadores e ser financiado por uma fonte específica;

• O cadastro do pesquisador inclui dados pessoais como nome completo e status, além de informações de localização (cidade e estado). Cada pesquisador deve estar vinculado a um único endereço registrado no sistema, que deve conter uma lista completa de todas as cidades e estados do país (Brasil) para permitir novos cadastros. Além disso, o pesquisador precisa estar vinculado a um único departamento da empresa XPTO-Pesquisas, que pode gerenciar vários projetos em que o pesquisador participa;

• As entradas de dados a serem utilizadas, estão no arquivo anexado (Laboratório de Banco de dados - N1-AT2.xlsx). Você deverá preencher os dados conforme o arquivo anexado;

• Após o cadastro dos dados, realize as seguintes consultas SQL: o Liste os projetos e suas fontes financiadoras, incluindo o nome do projeto e o nome da fonte financiadora;

• Liste os projetos gerenciados pelos departamentos, incluindo o nome do projeto e o nome do departamento;

• Liste os pesquisadores presentes na filial "NORTE", incluindo o nome do pesquisador e a filial do departamento;

• Liste os pesquisadores presentes na filial "SUL", incluindo o nome do pesquisador e a filial do departamento;

• Liste o nome e a cidade dos pesquisadores presentes no projeto "Acesso a Oportunidades", incluindo o nome do pesquisador, a cidade e o nome do projeto;

• Liste o nome do pesquisador, valor da bolsa, nome do projeto e departamento dos pesquisadores que moram em “Roraima”;

• Liste todos os pesquisadores (pesquisador, valor da bolsa, nome do projeto, nome do departamento) e sua localização (cidade e estado);

• Liste o estado que mais possui pesquisadores, apresentando a quantidade de pesquisadores;

• Liste todos os projetos (nome do projeto, departamento, filial departamento, fonte financiadora, valor a investir da fonte financiadora e valor do projeto), considerando a ordem de maior valor a ser investido.



A equipe deverá produzir os seguintes resultados:

• Desenvolver o modelo conceitual, modelo lógico e modelo físico para o projeto
em questão;

• Utilizar a linguagem SQL para construir o modelo físico e definir as consultas ao
banco de dados;

• Disponibilizar o script desenvolvido para fins de testes e validação;

• Fazer o uso de Constraints:

• Definir o status padrão “Ativo”;

• Definir quais campos serão obrigatórios;

• Impedir que sejam cadastrados valores negativos;
