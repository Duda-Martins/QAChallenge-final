import os
import re
import requests
from datetime import datetime
from robot.api import ExecutionResult

# Configurações via secrets do GitHub Actions
JIRA_API_TOKEN = os.getenv("JIRA_API_TOKEN")
JIRA_EMAIL = os.getenv("JIRA_EMAIL")
JIRA_URL = os.getenv("JIRA_URL")  # Exemplo: https://minhaempresa.atlassian.net

if not all([JIRA_API_TOKEN, JIRA_EMAIL, JIRA_URL]):
    raise Exception("Configure os secrets JIRA_API_TOKEN, JIRA_EMAIL e JIRA_URL")

auth = (JIRA_EMAIL, JIRA_API_TOKEN)
headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
}

# Mapeamento das prioridades da 3ª tag para nomes do Jira
PRIORIDADE_MAPA = {
    "alta": "High",
    "media": "Medium",
    "baixa": "Low"
}

def extrair_esperado_obtido(mensagem):
    esperado = ""
    obtido = ""

    # Caso 1: Expected: ...\nBut found: ...
    padrao = re.search(r"Expected: (.+?)\nBut found: (.+)", mensagem, re.DOTALL)
    if padrao:
        return padrao.group(1).strip(), padrao.group(2).strip()

    # Caso 2: Esperava ... mas recebeu ...
    padrao2 = re.search(r"Esperava\s+(.*?)\s+.*?mas recebeu\s+(.*)", mensagem, re.DOTALL | re.IGNORECASE)
    if padrao2:
        return padrao2.group(1).strip(), padrao2.group(2).strip()

    # Caso 3: padrão "X != Y"
    padrao3 = re.search(r"(.+?)\s*!=\s*(.+)", mensagem)
    if padrao3:
        return padrao3.group(2).strip(), padrao3.group(1).strip()

    # Default
    return "", mensagem.strip()

    # Padrão em português: Esperava ... mas recebeu ...
    padrao2 = re.search(r"Esperava\s+(.*?)\s+.*?mas recebeu\s+(.*)", mensagem, re.DOTALL | re.IGNORECASE)
    if padrao2:
        esperado = padrao2.group(1).strip()
        obtido = padrao2.group(2).strip()
        return esperado, obtido

    # Se não encontrar, mensagem toda fica em obtido
    obtido = mensagem.strip()
    return esperado, obtido

def buscar_testes_com_falha(suite):
    for test in suite.tests:
        print(f"🧪 Teste: {test.name} - status: {test.status}")
        if test.status == "FAIL":
            yield test
    for subsuite in suite.suites:
        yield from buscar_testes_com_falha(subsuite)

def main():
    resultado = ExecutionResult('../../Testes automatizados/results/output.xml')

    print("[DEBUG] Suites encontradas:")
    for suite in resultado.suite.suites:
        print(f"  📁 Suite: {suite.name}")
        for test in buscar_testes_com_falha(resultado.suite):
            print(f"    🧪 Teste: {test.name} - status: {test.status}")
            if test.status == "FAIL":
                tags = test.tags
                if len(tags) < 3:
                    print(f"[AVISO] Teste {test.name} não tem tags suficientes para ID e prioridade.")
                    continue

                case_id = tags[0]
                prioridade_raw = tags[2].lower()
                prioridade = PRIORIDADE_MAPA.get(prioridade_raw, "Medium")
                nome = test.name
                erro = test.message.strip()
                hora = datetime.now().strftime("%d/%m/%Y %H:%M")

                passos = "\n".join([f"{i+1}. {kw.name}" for i, kw in enumerate(test.body)])

                esperado, obtido = extrair_esperado_obtido(erro)

                resumo = f"Bug Report: {erro[:70]}"

                descricao = f"""**ID Caso de Teste:** {case_id}  
**Título:** {nome}  
**Prioridade:** {prioridade}  
**Status:** Aberto  
**Proprietário:** @Maria Eduarda Martins Rodrigues  
**Data e Hora do Registro:** {hora}  

---

**🧭 Reproduction Steps**  
{passos}

---

**✅ Resultado Esperado**  
{esperado if esperado else '(Não disponível)'}

---

**❌ Resultado Obtido**  
{obtido}

---

**📎 Evidência**  
O log do teste está anexado abaixo."""

                issue_payload = {
                    "fields": {
                        "project": {"key": "CIN"},
                        "summary": resumo,
                        "description": {
                            "type": "doc",
                            "version": 1,
                            "content": [{
                                "type": "paragraph",
                                "content": [{"type": "text", "text": descricao}]
                            }]
                        },
                        "issuetype": {"name": "Bug"},
                        "priority": {"name": prioridade},
                        "labels": ["robotframework", "automated-test"]
                    }
                }

                # Criar issue no Jira
                response = requests.post(
                    f"{JIRA_URL}/rest/api/3/issue",
                    json=issue_payload,
                    auth=auth,
                    headers=headers
                )

                if response.status_code != 201:
                    print(f"[ERRO] Não foi possível criar o bug para {case_id}: {response.status_code} - {response.text}")
                    continue

                issue_key = response.json()["key"]
                print(f"[OK] Bug criado: {issue_key}")

                # Anexar log
                log_path = "Testes automatizados/results/log.html"
                if os.path.exists(log_path):
                    with open(log_path, "rb") as f:
                        files = {'file': ("log.html", f, 'text/html')}
                        r = requests.post(
                            f"{JIRA_URL}/rest/api/3/issue/{issue_key}/attachments",
                            auth=auth,
                            headers={"X-Atlassian-Token": "no-check"},
                            files=files
                        )
                        if r.status_code == 200:
                            print(f"[OK] log.html anexado ao ticket {issue_key}")
                        else:
                            print(f"[ERRO] Falha ao anexar log: {r.status_code} - {r.text}")
                else:
                    print(f"[AVISO] log.html não encontrado em '{log_path}'")

if __name__ == "__main__":
    print("[DEBUG] Script iniciado.")
    main()