*** Settings ***
Documentation    Keywords para o serviço de cadastro de usuário na API.

Resource    ../common/Base.resource

*** Keywords ***
Enviar requisição POST para /auth/register
    ${resposta}  POST On Session
        ...          alias=api-cinema
        ...          url=/auth/register
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}

    Run Keyword And Ignore Error    Set Test Variable    ${resposta_para_status}    ${resposta}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}
    Run Keyword And Ignore Error    Set Test Variable    ${_id}    ${RESPOSTA}[data][_id]

Validar resposta Registro de usuário com sucesso
    Validar que o código response    201
    Validar que a resposta contém success    ${True}
    Validar que a resposta contém   _id
    Validar que a resposta contém dado    name    ${body}[name]
    Validar que a resposta contém dado    email    ${body}[email]
    Validar que a resposta contém   token

Validar resposta de Registro de usuário duplicado
    Status Should Be    400    ${resposta_para_status}
    Validar que a resposta contém success    ${False}

Validar resposta Registro de usuário com imput inválido
    Validar que o código response    400
    Validar que a resposta contém success    ${False}