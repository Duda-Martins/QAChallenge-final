# 🧪 QAChallenge-final

Repositório de automação de testes para um sistema de cinema, desenvolvido como desafio técnico, desenvolvido durante estágio na Compass UOL. Foram implementados testes manuais e automatizados de API e web, com foco em qualidade, rastreabilidade e clareza nos resultados.

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
  - [✨ Destaques Técnicos](#-destaques-técnicos)
  - [📂 Branches](#-branches)
  - [🙋🏻‍♀️ Apresentação Pessoal](#️-apresentação-pessoal)
  - [📬 Contato](#-contato)
  - [📜 Licença](#-licença)

---

## 🧾 Sobre o Projeto

Este repositório contém o projeto final de Quality Assurance desenvolvido durante o programa de estágio na Compass UOL. O objetivo foi aplicar, com profundidade e inovação, os conhecimentos adquiridos ao longo da trilha em uma aplicação de Cinema (frontend + backend).

Durante o projeto, foram desenvolvidas soluções completas para testes manuais, exploratórios e automatizados — com foco na qualidade funcional da aplicação e cobertura de cenários críticos.

### 🧠 Competências Desenvolvidas

* Testes de API com **Postman** e **Robot Framework**
* Automação funcional com boas práticas (PageObjects, ServiceObjects)
* Integração com **MongoDB**
* Geração de evidências automatizadas
* Organização modular e reutilizável dos scripts
* Uso de Git com branches (`feature/`, `develop`, `main`)

- **Robot Framework** (Automação de testes)
- **Linguagem Gherkin** com `Robot` e `Browser` Library (sem uso de Selenium)
- **Postman** (Testes manuais de API)
- **Python** 3.10+
- **JSON** (armazenamento de dados)
- **Excel/Planilhas** (planejamento e análise de testes)
- **QAlity** (garantir a rastreabilidade dos testes)

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
├── Testes automatizados/
│   ├── tests/
│   │   ├── api/
│   │   └── frontend/
│   ├── resources/
│   │   ├── data/
│   │   │   ├── admin_user.json
│   │   │   ├── cadastro.json
│   │   │   ├── movies.json
│   │   │   └── ...              # Outros arquivos de dados
│   │   └── libs/
│   │       └── data_base.py
│   └── results/
│       ├── report.html
│       └── log.html
├── Testes Postman/
│   └── Cinema-app.postman_collection.json
├── Documentos/
│   ├── MapaMental.png
│   ├── PlanoDeTeste.pdf
│   └── PromptGenAI.txt
└── requirements.txt
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
cd Testes\ automatizados
robot -d results tests/api
```

3. **Testes de Frontend**

```bash
cd Testes\ automatizados
robot -d results tests/frontend
```

4. **Todos os testes**

```bash
cd Testes\ automatizados
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

---

## ✨ Destaques Técnicos

* Cobertura de testes crítica com foco em APIs REST e fluxo do usuário final.
* Organização por PageObjects e ServiceObjects, com separação de responsabilidades.
* Estrutura pensada para **reusabilidade e escalabilidade**.
* Geração automatizada de relatórios e logs.
* **Prompt GenAI** usado para refinar o plano de testes com IA.

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