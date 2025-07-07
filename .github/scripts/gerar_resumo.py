from robot.api import ExecutionResult
from datetime import datetime
from collections import defaultdict
import matplotlib.pyplot as plt
import os

def obter_prioridade(tags):
    PRIORIDADES_VALIDAS = ["alta", "media", "média", "baixa"]
    for tag in tags:
        prioridade = tag.lower()
        if prioridade in PRIORIDADES_VALIDAS:
            return "média" if prioridade == "media" else prioridade
    return "não definida"

def gerar_grafico_pizza(qtd_sucesso, qtd_falha, nome_arquivo="resumo_pizza.png"):
    labels = ['Passaram', 'Falharam']
    sizes = [qtd_sucesso, qtd_falha]
    colors = ['#4CAF50', '#F44336']

    plt.figure(figsize=(6, 6))
    plt.pie(sizes, labels=labels, autopct='%1.1f%%', colors=colors, startangle=140)
    plt.title("Resumo dos Testes Automatizados")
    plt.axis('equal')
    plt.savefig(nome_arquivo)
    plt.close()
    print(f"[OK] Gráfico salvo em: {nome_arquivo}")

def gerar_resumo_visual(path_output="Testes automatizados/results/output.xml", arquivo_saida="resumo_testes.md", grafico="resumo_pizza.png"):
    resultado = ExecutionResult(path_output)

    todos_testes = []

    def buscar_todos_testes(suite):
        for test in suite.tests:
            todos_testes.append(test)
        for subsuite in suite.suites:
            buscar_todos_testes(subsuite)

    buscar_todos_testes(resultado.suite)

    total = len(todos_testes)
    falhas = [t for t in todos_testes if t.status == "FAIL"]
    sucessos = [t for t in todos_testes if t.status == "PASS"]
    percentual = round((len(sucessos) / total) * 100, 1) if total > 0 else 0
    hora = datetime.now().strftime("%d/%m/%Y às %H:%M")

    testes_por_prioridade = defaultdict(list)
    for test in todos_testes:
        prioridade = obter_prioridade(test.tags)
        testes_por_prioridade[prioridade].append(test)

    icones = {
        "alta": "🔺",
        "média": "🟡",
        "baixa": "🔻",
        "não definida": "❓"
    }

    gerar_grafico_pizza(len(sucessos), len(falhas), grafico)

    with open(arquivo_saida, "w", encoding="utf-8") as f:
        f.write(f"# ✅ Resumo da Execução dos Testes\n\n")
        f.write(f"📅 Data: {hora}  \n")
        f.write(f"📦 Total de Testes: {total}  \n")
        f.write(f"✅ Passaram: {len(sucessos)}  \n")
        f.write(f"❌ Falharam: {len(falhas)}  \n")
        f.write(f"📊 Sucesso: {percentual}%\n\n")
        f.write(f"![Resumo visual da execução]({grafico})\n\n")
        f.write("---\n\n")

        for prioridade in ["alta", "média", "baixa", "não definida"]:
            if prioridade in testes_por_prioridade:
                icone = icones[prioridade]
                f.write(f"## {icone} Prioridade: {prioridade.capitalize()}\n\n")
                for test in testes_por_prioridade[prioridade]:
                    status = "✅" if test.status == "PASS" else "❌"
                    f.write(f"{status} {test.name}\n\n")
                f.write("\n---\n\n")

    print(f"[OK] Resumo salvo em: {arquivo_saida}")

if __name__ == "__main__":
    gerar_resumo_visual()
