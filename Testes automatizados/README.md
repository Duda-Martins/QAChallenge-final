# Testes automatizados

## Objetivo da pasta
Esta pasta contém a automação de testes para o sistema de cinema, abrangendo tanto testes de API quanto de frontend. Seu foco é garantir a qualidade funcional do sistema por meio de scripts reutilizáveis e organizados.

## Tecnologias e Frameworks usados
- Robot Framework (versão compatível com Python 3.10+)
- Python 3.x
- Biblioteca Browser do Robot Framework (para automação frontend)
- JSON (para dados estruturados)
- MongoDB (integração e testes relacionados)
- PageObjects e ServiceObjects para organização dos scripts

## Como executar/testar
1. Certifique-se de que as dependências estão instaladas:

```bash
pip install -r requirements.txt
```

2. Para executar os testes de API:

```bash
cd Testes\ automatizados
robot -d results tests/api
```

2. Para executar os testes de frontend:

```bash
cd Testes\ automatizados
robot -d results tests/frontend
```

3. Os relatórios gerados ficarão na pasta:

```bash
Testes automatizados/results/
```

## Organização dos arquivos

* tests/api/ — scripts de testes automatizados para a API do sistema
* tests/frontend/ — scripts de testes automatizados para interface web
* resources/data/ — arquivos JSON com dados de teste (usuários, filmes, cadastros etc.)
* resources/libs/ — bibliotecas auxiliares, incluindo data_base.py para manipulação do banco MongoDB
* results/ — pasta para armazenamento dos relatórios gerados pela execução dos testes (logs, reports)

## Observações importantes

* MongoDB deve estar ativo e configurado conforme especificado em data_base.py.
* Evite alterar os dados em resources/data/ sem necessidade para manter a integridade dos testes.
* A automação segue boas práticas com uso de PageObjects e ServiceObjects para facilitar manutenção e escalabilidade.