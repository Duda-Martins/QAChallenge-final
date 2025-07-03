# Meus prompts com GenAI - ChatGPT
## 📁 DOCUMENTAÇÃO DE REPOSITÓRIO QA

### 🟣 Prompt:
"Esse é o link do repositório [...] Quero documentar ele melhor (criar READMEs e coisas do tipo). A base para o README é que o projeto deve seguir a descrição do Challenge abaixo."

### 🔎 Objetivo:
Criar um README atrativo, técnico e voltado para recrutadores, focado na execução real do projeto.

---

## 📁 RELATÓRIO DE TESTES API

### 🟣 Prompt:
"Faça a tabela de resumo dos resultados com base no Test execution (excel) e na prioridade (mesmos casos do excel, mas com a prioridade):"

"Adicionar gráficos de falhas vs. sucessos  
Destacar os bugs em cores  
Incluir um dashboard visual no Excel"

### 🔎 Objetivo:
Transformar os dados de execução manual e automatizada em um relatório visual e analítico, facilitando a apresentação de resultados e bugs encontrados.

---

## 📁 BUG REPORT — FALHA AO EXCLUIR RESERVA

### 🟣 Prompt:
"Bug Report Falha Senha:  
CIN-69 Excluir uma reserva (Admin) – Failed  
BUG012 – Divergência na mensagem de retorno ao excluir reserva  
Destacar os bugs em cores"

### 🔎 Objetivo:
Formalizar e destacar falhas funcionais nas APIs, com detalhamento da divergência entre resposta esperada e obtida. Base para abertura de issues e rastreabilidade.

---

## 📁 PLANO DE TESTES CINEMA

### 🟣 Prompt:
"Quais desses testes eu devo automatizar?

Mande a tabela (pelo chat)"

"Atualizar a matriz de rastreabilidade"

### 🔎 Objetivo:
Refinar o plano de testes com base em requisitos atualizados, segmentando casos para cobrir caminhos felizes e negativos, com foco em clareza e rastreabilidade.

---

## 📁 MATRIZ DE RISCO API

### 🟣 Prompt:
"Análise Inicial  
Requisitos: User Stories detalhadas e documentação Swagger  
Riscos Identificados:  
- Instabilidade do ambiente  
- Falhas intermitentes nos endpoints  
- Possíveis erros de validação de payload  
- Falta de mensagens claras de erro  
- Tratamento inconsistente de permissões"

### 🔎 Objetivo:
Elaborar uma análise de riscos para priorização de testes funcionais, considerando falhas técnicas e impacto no usuário final.

---

## 📁 RESUMO VISUAL DA EXECUÇÃO DOS TESTES

### 🟣 Prompt:
"Quero um script que gere um resumo visual da execução dos testes com base no log."

"Quero que a saída `resumo_testes.md` tenha os testes divididos por prioridade"

"Tem como colocar um gráfico de pizza com os testes que passaram e falharam?"

"Quero que o gráfico fique no resumo"

### 🔎 Objetivo:
Gerar um relatório legível por humanos, direto na pipeline, que resuma os testes executados, destacando o percentual de sucesso, falhas e prioridades. Inclui gráfico e markdown estruturado.

---

## 📁 REPORT AUTOMÁTICO DE BUGS NO JIRA

### 🟣 Prompt:
"Quero fazer uma integração para fazer o report de alguns bugs dos testes automatizados no Jira automaticamente via pipeline."

"Esse é um test case:  
CT015 - Listagem de filmes com filtros e paginação [...]  
Quero que quando for executada a pipeline, faça um report parecido com esse [...]"

"Quero que cada bug anexe o log inteiro"

"Use variáveis de ambiente: JIRA_API_TOKEN, JIRA_EMAIL, JIRA_URL"

### 🔎 Objetivo:
Automatizar o report de bugs a partir de falhas nos testes, criando issues no Jira com dados extraídos do log: título, prioridade, data, passos, resultado esperado/obtido e anexo da evidência.

---

## 📁 OTIMIZAÇÃO DO README COM INOVAÇÕES DA PIPELINE

### 🟣 Prompt:
"Agora eu gostaria de falar sobre a criação dessa inovação na minha pipeline de CI no README."

"Sim, mande o arquivo completo. Mas eu quero que destaque mais essa parte, chame a atenção!"

"Fale também do report automatizado no Jira"

### 🔎 Objetivo:
Atualizar o README destacando as inovações técnicas implementadas na pipeline de CI/CD, voltadas à automação de evidências, rastreabilidade e comunicação com times de desenvolvimento.

---

## 📎 Observações

Todos os prompts acima foram utilizados para construir e documentar o projeto de QA Challenge final, com apoio de IA para:

✔ Estruturação de documentação técnica  
✔ Elaboração e priorização de testes  
✔ Geração de evidências e análises de bugs  
✔ Automatização de validações com Robot Framework  
✔ Criação de relatórios visuais e integração com Jira  
✔ Melhoria contínua da pipeline e entrega profissional

🧠 Todos os artefatos gerados com IA passaram por:  
- ✅ Revisão detalhada de conteúdo e coerência  
- ✅ Validação de cada linha de código antes da aplicação em produção  
- ✅ Correção de erros lógicos e ajustes nos scripts (ex: parsing de tags, anexos, status de retorno)  
- ✅ Personalização dos outputs para refletirem o padrão de qualidade exigido no projeto

🛡️ O uso da IA foi intencional, ético e sempre acompanhado de **curadoria manual criteriosa**, garantindo qualidade, precisão e alinhamento com os objetivos reais do projeto.