# 🧪 QAChallenge-final

Repositório de automação de testes para um sistema de cinema, desenvolvido como desafio técnico, desenvolvido durante estágio na Compass UOL. Foram implementados testes manuais e automatizados de API e web, com foco em qualidade, rastreabilidade e clareza nos resultados.

🚀 **Destaques da pipeline:**
- 📊 Geração automática de **resumo visual da execução** dos testes, com agrupamento por prioridade e gráfico de pizza.
- 🐞 Criação automatizada de **bugs no Jira** com base nos testes falhos, incluindo título, passos, comparação de resultados e log anexado.

---

## Índice

- [🧪 QAChallenge-final](#-qachallenge-final)
  - [Índice](#índice)
  - [🧾 Sobre o Projeto](#-sobre-o-projeto)
    - [🧠 Competências Desenvolvidas](#-competências-desenvolvidas)
  - [⚙️ Como Executar](#️-como-executar)
    - [Pré-requisitos](#pré-requisitos)
    - [Instalação](#instalação)
  - [📁 Estrutura do Projeto](#-estrutura-do-projeto)
  - [🤖 Automação](#-automação)
    - [Executando os Testes](#executando-os-testes)
    - [📄 Funcionalidades Testadas](#-funcionalidades-testadas)
  - [📊 Relatórios e Evidências](#-relatórios-e-evidências)
  - [🚀 Inovação na Pipeline](#-inovação-na-pipeline)
    - [1. 📊 Resumo Visual dos Testes](#1--resumo-visual-dos-testes)
    - [2. 🐞 Report automático no Jira](#2--report-automático-no-jira)
  - [✨ Destaques Técnicos](#-destaques-técnicos)
  - [📂 Branches](#-branches)
  - [🙋🏻‍♀️ Apresentação Pessoal](#️-apresentação-pessoal)
  - [📬 Contato](#-contato)
  - [📜 Licença](#-licença)

---

## 🧾 Sobre o Projeto

Este repositório contém o projeto final de Quality Assurance desenvolvido durante o programa de estágio na Compass UOL. O objetivo foi aplicar, com profundidade e inovação, os conhecimentos adquiridos ao longo da trilha em uma aplicação de Cinema (frontend + backend).

🔍 O grande diferencial está na automação inteligente de **evidências e relatórios**, com dois recursos inéditos:
1. 🟢 **Resumo visual da execução** dos testes com análise de sucesso, falha e prioridades
2. 🟢 **Integração com Jira**, que transforma testes falhos em bugs automaticamente, já com os detalhes necessários para triagem e correção

Durante o projeto, foram desenvolvidas soluções completas para testes manuais, exploratórios e automatizados — com foco em qualidade funcional e rastreabilidade contínua.

### 🧠 Competências Desenvolvidas

* Testes de API com **Postman** e **Robot Framework**
* Automação funcional com boas práticas (PageObjects, ServiceObjects)
* Integração com **MongoDB**
* Geração de evidências automatizadas
* Organização modular e reutilizável dos scripts
* Uso de Git com branches (`feature/`, `develop`, `main`)
* **Criação de bugs automatizados no Jira** com base nos testes
* **Geração de relatórios visuais de testes na pipeline de CI**

Ferramentas utilizadas:

- **Robot Framework** (Automação de testes)
- **Linguagem Gherkin** com `Robot` e `Browser` Library (sem uso de Selenium)
- **Postman** (Testes manuais de API)
- **Python** 3.10+
- **JSON** (armazenamento de dados)
- **Excel/Planilhas** (planejamento e análise de testes)
- **QAlity** (garantir a rastreabilidade dos testes)
- **Jira REST API** (integração automatizada)
- **ChatGPT** (para suporte na geração de código, criação de plano de testes, automação de relatórios e scripts da pipeline)

---

## ⚙️ Como Executar

### Pré-requisitos

* Python 3.x
* Robot Framework (e as suas bibliotecas)
* Postman
* Chrome
* MongoDB

### Instalação

```bash
# Clone o repositório
git clone https://github.com/Duda-Martins/QAChallenge-final.git
cd QAChallenge-final

# Instale dependências Python
pip install -r requirements.txt
```

> ⚠️ Certifique-se de que o MongoDB está ativo e as credenciais estejam corretas no script `data_base.py`.

---

## 📁 Estrutura do Projeto

```
QAChallenge-final/
├── .github/                                    # Configurações CI/CD e automação
│   ├── scripts/
│   │   ├── gerar_resumo.py                     # Script para gerar resumo visual dos testes
│   │   └── report_jira.py                      # Script para criar bugs automaticamente no Jira
│   └── workflows/
│       └── cicd.yml                            # Pipeline GitHub Actions
├── Documentos/                                 # Documentação e evidências do projeto
│   ├── Jira/                                   # Evidências e relatórios do Jira
│   │   ├── CIN-80.doc                          # Exemplo de bug reportado
│   │   ├── grafico.png                         # Gráfico de execução dos testes
│   │   ├── QAlity.png                          # Screenshot da ferramenta QAlity
│   │   └── Test_Execution_Detailed_Report.xlsx # Relatório detalhado de execução
│   ├── Plano de Testes – Cinema app.pdf        # Plano de testes completo
│   ├── README.md                               # Documentação específica da pasta
│   └── Relatório de Testes – Cinema app.pdf    # Relatório final dos testes
├── Testes automatizados/                       # Estrutura principal dos testes Robot Framework
│   ├── resources/                              # Recursos compartilhados
│   │   ├── common/                             # Recursos comuns a todos os testes
│   │   │   ├── Base.resource                   # Configurações base e setup
│   │   │   ├── Validations.resource            # Keywords de validação
│   │   │   └── Variables.resource              # Variáveis globais
│   │   ├── data/                               # Massa de dados para testes
│   │   ├── libs/
│   │   │   └── data_base.py                    # Biblioteca para conexão com MongoDB
│   │   ├── pages/                              # Page Objects para testes web
│   │   │   ├── components/                     # Componente de logout
│   │   └── services/                           # Service Objects para testes de API
│   ├── results/                                # Resultados e evidências dos testes
│   │   ├── browser/                            # Evidências específicas do browser
│   │   ├── log.html                            # Log detalhado da execução
│   │   ├── output.xml                          # Saída XML do Robot Framework
│   │   ├── playwright-log.txt                  # Log do Playwright
│   │   └── report.html                         # Relatório HTML da execução
│   ├── tests/                                  # Casos de teste organizados
│   │   ├── api/                                # Testes de API REST
│   │   │   ├── auth/                           # Testes de autenticação
│   │   │   │   ├── cadastroUser.robot          # Testes de cadastro de usuário
│   │   │   │   └── login.robot                 # Testes de login
│   │   │   ├── movies/                         # Testes de filmes
│   │   │   │   └── filmes.robot                # CRUD de filmes
│   │   │   ├── reservations/                   # Testes de reservas
│   │   │   │   └── reservas.robot              # CRUD de reservas
│   │   │   ├── sessions/                       # Testes de sessões
│   │   │   │   └── sessions.robot              # Listagem de sessões
│   │   │   ├── theaters/                       # Testes de teatros
│   │   │   │   └── teatros.robot               # Listagem de teatros
│   │   │   └── users/                          # Testes de usuários
│   │   │       └── user.robot                  # CRUD de usuários
│   │   └── frontend/                           # Testes de interface web
│   │       ├── filmes.robot                    # Testes de navegação em filmes
│   │       └── reservas.robot                  # Testes de fluxo de reservas
│   └── README.md                               # Documentação dos testes automatizados
├── Testes Postman/                             # Testes manuais de API
│   ├── Cinema-app.postman_collection.json      # Coleção completa de testes Postman
│   └── README.md                               # Documentação dos testes Postman
├── CONTRIBUTING.md                             # Guia de contribuição
├── LICENSE                                     # Licença MIT
├── prompts_ai.txt                              # Prompts utilizados com IA
├── README.md                                   # Documentação principal do projeto
├── requirements.txt                            # Dependências Python
└── SECURITY.md                                 # Políticas de segurança
```

---

## 🤖 Automação

### Executando os Testes

1. **Instale as dependências**:

```bash
pip install -r requirements.txt
```

2. **Testes de API**

```bash
cd "Testes automatizados"
robot -d results tests/api
```

3. **Testes de Frontend**

```bash
cd "Testes automatizados"
robot -d results tests/frontend
```

4. **Todos os testes**

```bash
cd "Testes automatizados"
robot -d results tests/frontend
```

### 📄 Funcionalidades Testadas

* 📌 Cadastro e login de usuários
* 🎬 Gerenciamento de filmes (Admin)
* 🎟️ Criação e exclusão de reservas
* 🗓️ Listagem de sessões e teatros
* 🔐 Regras de autenticação e autorização

---

## 📊 Relatórios e Evidências

Após a execução, os relatórios são salvos automaticamente em:

* `Testes automatizados/results/report.html`
* `Testes automatizados/results/log.html`

Além disso, foram abertas diversas **issues** no Jira com bugs e melhorias encontrados durante os testes manuais (estão na Execução dos Testes em xlsx e no Relatório de Testes em pdf).

> 🆕 **Resumo Visual Automatizado dos Testes:**
> A pipeline agora gera um **relatório em Markdown**, com:
>
> * Agrupamento dos testes por **prioridade**
> * **Gráfico de pizza** com o percentual de sucesso
> * Indicadores visuais de sucesso/erro (✅❌)
> * Facilita apresentações, auditorias e rastreabilidade técnica

> 🐞 **Report automatizado de bugs no Jira:**
> A pipeline detecta automaticamente falhas nos testes automatizados e envia **tickets para o Jira**, com:
>
> * ID e prioridade do caso de teste
> * Título e passos de reprodução
> * Resultado esperado vs. resultado obtido
> * Anexo automático do `log.html` como evidência

---

## 🚀 Inovação na Pipeline

🎯 Como diferencial técnico, implementei dois sistemas automatizados integrados à CI:

### 1. 📊 Resumo Visual dos Testes

* Interpreta o `output.xml` do Robot Framework
* Gera o arquivo `resumo_testes.md` com:

  * Testes agrupados por **prioridade**
  * Lista de testes que passaram e falharam
  * **Gráfico de pizza** salvo como `resumo_pizza.png`
* Os arquivos são salvos como artefatos no GitHub Actions

### 2. 🐞 Report automático no Jira

* Detecta testes com status `FAIL`
* Cria bugs no Jira com:

  * Título, prioridade e descrição extraída das tags
  * Passos de reprodução e comparativo do resultado
  * Anexo do log completo da execução
* Integração realizada via [Jira REST API v3](https://developer.atlassian.com/cloud/jira/platform/rest/v3/)

Essas duas funcionalidades eliminam tarefas manuais, aumentam a rastreabilidade e tornam o processo de QA mais profissional e escalável.

---

## ✨ Destaques Técnicos

* Cobertura de testes crítica com foco em APIs REST e fluxo do usuário final.
* Organização por PageObjects e ServiceObjects, com separação de responsabilidades.
* Estrutura pensada para **reusabilidade e escalabilidade**.
* Geração automatizada de relatórios e logs.
* **Prompt GenAI** usado para refinar o plano de testes com IA.
* 🌟 **Resumo visual automatizado na pipeline**, com gráfico de pizza e agrupamento por prioridade.
* 🔄 **Integração automatizada com Jira**, criando bugs diretamente da CI com título, passos, comparativo de resultados e anexo de evidência.

---

## 📂 Branches

| Branch                   | Descrição                              |
| ------------------------ | -------------------------------------- |
| `main`                   | Versão final estável                   |
| `develop`                | Desenvolvimento principal              |
| `feature/relatorio`      | Implementação dos relatórios de testes |
| `feature/jira`           | Integração com JIRA                    |
| `feature/testes-postman` | Testes manuais via Postman             |
| `feature/automacao`      | Casos automatizados Robot              |
| `feature/plano-testes`   | Plano e matriz de testes               |
| `feature/cicd`           | Implemntação da pipeline e inovações   |

---

## 🙋🏻‍♀️ Apresentação Pessoal

[**Duda Martins**](https://github.com/Duda-Martins)

| QA | Testes Manuais e Automatizados | Robot Framework

* **Nome:** Maria Eduarda Martins Rodrigues
* **Idade:** 19 anos
* **Curso:** Análise e Desenvolvimento de Sistemas
* **Semestre:** 4º
* **Cidade:** Curitiba
* **Cor dos olhos:** Castanhos
* **Cor dos cabelos:** Castanhos
* **Cor da pele:** Clara

---

## 📬 Contato

Tem interesse em saber mais sobre os testes ou deseja colaborar com o projeto?

Entre em contato comigo pelo [LinkedIn](www.linkedin.com/in/maria-eduarda-martins-rodrigues-564335349)

---

## 📜 Licença

MIT License © 2024 Maria Eduarda Martins Rodrigues