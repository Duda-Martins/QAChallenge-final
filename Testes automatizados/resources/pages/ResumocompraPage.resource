*** Settings ***
Documentation    Elementos e ações da página de resumo da compra.

Resource    ../common/Base.resource

*** Keywords ***
Validar página de Resumo da Compra
    Wait For Elements State    css=.confirmation-header h1 >> text="Reserva Confirmada!"    visible    5
    Wait For Elements State    css=.confirmation-header p >> text="Sua reserva foi concluída com sucesso."    visible    5
    Wait For Elements State    css=.info-item .info-label >> text="Filme:"    visible    5
    Wait For Elements State    css=.info-item .info-value >> text="Interstellar"    visible    5
    Wait For Elements State    css=.btn-primary >> text="Visualizar Minhas Reservas"    visible    5

Clicar em Visualizar Minhas Reservas
    Click    css=.btn-primary >> text="Visualizar Minhas Reservas"