# 📁 Diretório `.github`

Este diretório contém arquivos relacionados à automação e configurações específicas do repositório, especialmente para o GitHub Actions e scripts de suporte.

---

## 🗂 Estrutura

### 📂 `scripts/`

Contém scripts Python usados nas pipelines de CI/CD para geração de relatórios e integração com ferramentas externas.

- `gerar_resumo.py`  
  Script responsável por gerar um resumo visual da execução dos testes, criando um arquivo Markdown com análises e gráficos.
  
- `report_jira.py`  
  Script que automatiza o reporte de bugs no Jira a partir dos resultados dos testes automatizados, criando issues automaticamente.

---

### 📂 `workflows/`

Contém os arquivos de workflow do GitHub Actions que definem os processos automatizados.

- `cicd.yml`  
  Workflow principal de Integração Contínua e Entrega Contínua (CI/CD), que executa os testes, gera relatórios, e realiza o reporte automático no Jira.

---

## ⚙️ Objetivo deste diretório

Centralizar as automações que suportam a qualidade do projeto, garantindo que:

- Os testes sejam executados automaticamente em cada alteração.
- Os resultados sejam analisados e resumidos de forma visual e acessível.
- Os bugs identificados sejam reportados automaticamente para o time de desenvolvimento no Jira, aumentando a rastreabilidade e agilidade na resolução.

---

## 📌 Observações

- Os scripts são escritos em Python e requerem que as dependências estejam instaladas.
- As variáveis de ambiente (secrets do Actions) para autenticação e URLs do Jira devem estar configuradas para que o `report_jira.py` e funcione corretamente.
  - Elas são:
    - `JIRA_API_TOKEN`: O token da api do Jira usado.
    - `JIRA_EMAIL`: E-mail do Jira usado.
    - `JIRA_URL`: Url do projeto do Jira.
  - Elas devem ser configuradas no Secrets e Variables do GitHub Actions.
- O workflow `cicd.yml` orquestra a execução dos testes e chamadas aos scripts, promovendo integração entre as etapas.

---

Se precisar adicionar ou modificar algo relacionado a automação do projeto, este é o local ideal para manter a organização e clareza para toda a equipe.

---

*Desenvolvido com cuidado e atenção para manter a qualidade e eficiência do pipeline de CI/CD.*