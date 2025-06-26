*** Settings ***
Documentation    Keywords e Imports Comuns para Todos os Testes.

Library    Browser
Library    RequestsLibrary
Library    Collections
Library    String
Library    JSONLibrary

Library    ../libs/data_base.py

Resource    Variables.resource
Resource    Validations.resource

Resource    ../services/AuthService.resource
Resource    ../services/FilmeService.resource
Resource    ../services/ReservaService.resource
Resource    ../services/TeatroService.resource
Resource    ../services/UsuarioService.robot

Resource    ../pages/FilmesPage.resource
Resource    ../pages/ReservasPage.resource


*** Keywords ***
Abrir página
    New Browser    browser=${BROWSER}    headless=False
    New Page    ${BASE_URL}

Criar Sessão
    Create Session    alias=api-cinema    url=${API_URL}

Validar que o código response
    [Arguments]    ${status_sucesso}
    Status Should Be    ${status_sucesso}

Validar que a resposta contém success
    [Arguments]    ${success}
    Dictionary Should Contain Item    ${RESPOSTA}    success    ${success}

Validar que a resposta contém
    [Arguments]    ${key}
    Dictionary Should Contain Key    ${RESPOSTA}[data]    ${key}

Validar que a resposta contém dado
    [Arguments]    ${key}    ${dado}
    Dictionary Should Contain Item    ${RESPOSTA}[data]    ${key}    ${dado}

Preparar massa de dados
    [Arguments]    ${arquivo}    ${cenario}
    ${data}    Load Json From File
    ...    resources/data/${arquivo}
    ...    encoding=utf-8

    Set Test Variable    ${body}    ${data}[${cenario}]

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
