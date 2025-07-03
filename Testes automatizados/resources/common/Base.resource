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
Resource    ../pages/FilmeInterestellarPage.resource
Resource    ../pages/AssentosPage.resource
Resource    ../pages/PagamentoPage.resource
Resource    ../pages/LoginPage.resource
Resource    ../pages/ResumocompraPage.resource
Resource    ../pages/ReservasPage.resource
Resource    ../pages/components/Sair.resource

*** Keywords ***
Abrir página
    New Browser    browser=${BROWSER}    headless=False
    New Page    ${BASE_URL}

Criar Sessão
    Create Session    alias=api-cinema    url=${API_URL}

Preparar massa de dados
    [Arguments]    ${arquivo}    ${cenario}
    ${data}    Load Json From File
    ...    Testes automatizados/resources/data/${arquivo}
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
    Enviar requisição DELETE para /theaters/_id    ${_id_teatro}    ${TOKEN_ADMIN}    ${False}
    Enviar requisição DELETE para /sessions/_id    ${_id_sessao}

Criar usuário
    Preparar massa de dados    cadastro_web.json    valido
    Enviar requisição POST para /auth/register

Apagar usuário
    Logar usuario admin
    Enviar requisição DELETE para /users/_id    ${_id}    ${TOKEN_ADMIN}

Apagar reserva
    Logar usuario admin
    Buscar reserva e sessão pelo id usuário    ${TOKEN_ADMIN}    ${_id}
    Enviar requisição DELETE para /reservations/_id    ${_id_reserva}
    Enviar requisição PUT para /sessions/id/reset-seats    ${_id_sessao}

Buscar reserva e sessão pelo id usuário
    [Arguments]    ${TOKEN}    ${_id_usuario}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    ${resposta}  GET On Session
        ...          alias=api-cinema
        ...          url=/reservations
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

    @{reservas}    Get From Dictionary    ${RESPOSTA}    data

    FOR    ${reserva}    IN    @{reservas}
        ${dados_user}    Get From Dictionary    ${reserva}    user
        ${usuario}    Get From Dictionary    ${dados_user}    _id
        IF    "${usuario}" == "${_id_usuario}"
            Set Test Variable    ${_id_reserva}    ${reserva["_id"]}
            Set Test Variable    ${_id_sessao}    ${reserva["session"]["_id"]}
        END

    END

Enviar requisição PUT para /sessions/id/reset-seats
    [Arguments]    ${_id_sessao}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}

    ${resposta}  PUT On Session
        ...          alias=api-cinema
        ...          url=/sessions/${_id_sessao}/reset-seats
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}