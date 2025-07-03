*** Settings ***
Documentation    Testes de CRUD de filmes pela API

Resource    ../../resources/common/Base.resource

Suite Setup     Run Keywords    Criar Sessão    AND    Abrir página
Test Teardown    Take Screenshot

*** Test Cases ***
CT018 - Fluxo de reserva com sucesso
    [Tags]    CT018    reserva    alta    allure.tms:CIN-53
    Criar usuário
    Clicar em Sair
    Logar usuario
    Sleep    5
    Ir para a página de filmes em cartaz
    Clicar em Ver Detalhes
    Clicar em Selecionar Assentos
    Validar página de Assentos
    Selecionar Assentos
    Clicar em Continuar para Pagamento
    Validar página de Pagamento
    Escolher forma de pagamento e Finalizar Compra
    Validar página de Resumo da Compra

    Apagar reserva
    Apagar usuário

CT019 - Tentar reservar assentos ocupados
    [Tags]    CT019    reserva    media    allure.tms:CIN-54
    Criar usuário
    Clicar em Sair
    Logar usuario
    Sleep    5
    Ir para a página de filmes em cartaz
    Clicar em Ver Detalhes
    Clicar em Selecionar Assentos
    Selecionar Assentos
    Clicar em Continuar para Pagamento
    Escolher forma de pagamento e Finalizar Compra

    Ir para a página de filmes em cartaz
    Clicar em Ver Detalhes
    Clicar em Selecionar Assentos
    Validar se Assentos ocupados disabled
    Validar se o botão Continuar para Pagamento está disabled

    Apagar reserva
    Apagar usuário

CT020 - Histórico de reservas
    [Tags]    CT020    reserva    alta    allure.tms:CIN-55
    Criar usuário
    Clicar em Sair
    Logar usuario
    Sleep    5
    Ir para a página de filmes em cartaz
    Clicar em Ver Detalhes
    Clicar em Selecionar Assentos
    Selecionar Assentos
    Clicar em Continuar para Pagamento
    Escolher forma de pagamento e Finalizar Compra
    Clicar em Visualizar Minhas Reservas
    Validar página de Reservas
    Apagar reserva
    Apagar usuário