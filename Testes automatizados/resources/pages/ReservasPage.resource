*** Settings ***
Documentation    Elementos e ações da página de reservas.

Resource    ../common/Base.resource

*** Keywords ***
Validar página de Reservas
    Wait For Elements State    css=.status-badge >> text="Confirmada"    visible    5
    Wait For Elements State    css=.reservation-details h4 >> text="Interstellar"    visible    5
    Wait For Elements State    css=.detail-item span    visible    5
    Wait For Elements State    css=.detail-item span    visible    5
    Wait For Elements State    css=.detail-item span >> text="D6, D7"    visible    5
    Wait For Elements State    css=.price-info span >> text="Total:"    visible    5
    Wait For Elements State    css=.payment-info span >> text="Cartão de Crédito"    visible    5
    Wait For Elements State    css=.btn-secondary >> text="Voltar para a Página Inicial"    visible    5
    Wait For Elements State    css=.btn-primary >> text="Ver Filmes em Cartaz"    visible    5
    Wait For Elements State    css=.movie-poster    visible    5