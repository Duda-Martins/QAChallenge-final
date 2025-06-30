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
Resource    ../services/SessionsService.resource

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

Criar filme, teatro e sessão
    Preparar massa de dados    movies.json    cadastro-valido
    Enviar requisição POST para /movies    ${TOKEN_ADMIN}
    Pegar id filme
    Preparar massa de dados    theaters.json    cadastro-valido
    Enviar requisição POST para /theaters    ${TOKEN_ADMIN}
    Pegar id teatro
    Preparar massa de dados    sessions.json    cadastro-valido
    Adicionar ids    ${_id_filme}    ${_id_teatro}
    Enviar requisição POST para /sessions

Excluir filme, sessão e teatro
    Enviar requisição DELETE para /movies/_id    ${_id_filme}    ${TOKEN_ADMIN}
    Enviar requisição DELETE para /theaters/_id    ${_id_teatro}    ${TOKEN_ADMIN}
    Enviar requisição DELETE para /sessions/_id    ${_id_sessao}