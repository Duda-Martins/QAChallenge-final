*** Settings ***
Documentation    Keywords para o serviço de login de usuário na API.

Resource    ../common/Base.resource

*** Keywords ***
Enviar requisição POST para /auth/login
    ${resposta}  POST On Session
        ...          alias=api-cinema
        ...          url=/auth/login
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

    Run Keyword And Ignore Error    Set Test Variable    ${TOKEN}    ${RESPOSTA}[data][token]
    Run Keyword And Ignore Error    Log    ${TOKEN}
    Run Keyword And Ignore Error    Log to Console    ${TOKEN}

Validar resposta Login de usuário com sucesso
    Preparar massa de dados    login.json    valido-cadastro-login
    Validar que o código response    200
    Validar que a resposta contém success    ${True}
    Validar que a resposta contém   _id
    Validar que a resposta contém dado    name    ${body}[name]
    Validar que a resposta contém dado    email    ${body}[email]
    Validar que a resposta contém dado    role    user
    Validar que a resposta contém   token

Validar resposta Login de usuário com senha errada
    Validar que a resposta contém success    ${False}
    Validar que a resposta contém mensagem    Invalid credentials
    Validar que o código response    400

Validar resposta Login de usuário inexistente
    Validar que a resposta contém success    ${False}
    Validar que a resposta contém mensagem    Invalid credentials
    Validar que o código response    400