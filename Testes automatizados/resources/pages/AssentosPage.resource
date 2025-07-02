*** Settings ***
Documentation    Elementos e ações da página de assentos.

Resource    ../common/Base.resource

*** Keywords ***
Selecionar Assentos
    Click    xpath=(//div[contains(@class, 'seat-row')])[4]//button[contains(@class, 'seat')][6]
    Click    xpath=(//div[contains(@class, 'seat-row')])[4]//button[contains(@class, 'seat')][7]

Validar página de Assentos
    Wait For Elements State    css=.seat-legend    visible    5
    Wait For Elements State    css=.session-details h1 >> text="Interstellar"    visible    5
    Wait For Elements State    css=.selected-seats h3 >> text="Assentos Selecionados:"    visible    5
    Wait For Elements State    css=.price-item span >> text="Total:"    visible    5
    Wait For Elements State    css=.checkout-button >> text="Continuar para Pagamento"    visible    5

Clicar em Continuar para Pagamento
    Click    css=.checkout-button >> text="Continuar para Pagamento"

Validar se Assentos ocupados disabled
    Wait For Elements State    xpath=(//div[contains(@class, 'seat-row')])[4]//button[contains(@class, 'seat')][6]    disabled    5
    Wait For Elements State    xpath=(//div[contains(@class, 'seat-row')])[4]//button[contains(@class, 'seat')][7]    disabled    5

Validar se o botão Continuar para Pagamento está disabled
    Wait For Elements State    css=.checkout-button >> text="Continuar para Pagamento"    disabled    5