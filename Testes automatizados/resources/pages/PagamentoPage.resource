*** Settings ***
Documentation    Elementos e ações da página de pagamento.

Resource    ../common/Base.resource

*** Keywords ***
Validar página de Pagamento
    Wait For Elements State    css=.checkout-header h1 >> text="Finalizar Compra"    visible    5
    Wait For Elements State    css=.order-summary h2 >> text="Resumo do Pedido"    visible    5
    Wait For Elements State    css=.movie-details    visible    5
    Wait For Elements State    css=.seats-info    visible    5
    Wait For Elements State    css=.payment-section h2 >> text="Método de Pagamento"    visible    5
    Wait For Elements State    css=.payment-method span >> text="Cartão de Crédito"    visible    5
    Wait For Elements State    css=.btn-checkout >> text="Finalizar Compra"    visible    5

Escolher forma de pagamento e Finalizar Compra
    Click    css=.payment-method span >> text="Cartão de Crédito"
    Click    css=.btn-checkout >> text="Finalizar Compra"