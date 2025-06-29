*** Settings ***
Documentation    Keywords e imports comuns para todos os testes.

Library    Browser
Library    RequestsLibrary
Library    Collections
Library    String
Library    JSONLibrary

Library    ../libs/data_base.py

Resource    Variables.resource
Resource    Validations.resource

Resource    ../services/RegisterService.resource
Resource    ../services/LoginService.resource
Resource    ../services/FilmeService.resource
Resource    ../services/ReservaService.resource
Resource    ../services/TeatroService.resource
Resource    ../services/UsuarioService.resource

Resource    ../pages/FilmesPage.resource
Resource    ../pages/ReservasPage.resource

*** Keywords ***
Abrir página
    New Browser    browser=${BROWSER}    headless=False
    New Page    ${BASE_URL}

Criar Sessão
    Create Session    alias=api-cinema    url=${API_URL}

Preparar massa de dados
    [Arguments]    ${arquivo}    ${cenario}
    ${data}    Load Json From File
    ...    resources/data/${arquivo}
    ...    encoding=utf-8

    Set Test Variable    ${body}    ${data}[${cenario}]

Logar usuario admin
    Preparar massa de dados    admin_user.json    valido-login
    Enviar requisição POST para /auth/login
    Set Test Variable    ${TOKEN_ADMIN}    ${TOKEN}

Logar usuario comum
    Preparar massa de dados    login.json    valido-cadastro-login
    Enviar requisição POST para /auth/register
    Preparar massa de dados    login.json    valido-login
    Enviar requisição POST para /auth/login
    Set Test Variable    ${TOKEN_COMUM}    ${TOKEN}
    Set Test Variable    ${_id_usuario}    ${RESPOSTA}[data][_id]

    # # ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    # ${resposta}  POST On Session
    #     ...          alias=restful-serverest
    #     ...          url=/produtos
    #     ...          json=${body}
    #     ...          expected_status=${STATUS_REQ}
    #     ...          headers=${headers}

    # Set Test Variable    ${data}

    # Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    # Log    ${RESPOSTA}
    # Log to Console    ${RESPOSTA}
