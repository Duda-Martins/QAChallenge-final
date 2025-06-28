*** Settings ***
Documentation    Keywords para o servisso de gerenciamento de usuários na API.

Resource    ../common/Base.resource

*** Keywords ***
Enviar requisição PUT para /users/_id
    [Arguments]    ${_id}

    Set Test Variable    ${_id}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    ${resposta}  PUT On Session
        ...          alias=api-cinema
        ...          url=/users/${_id}
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Validar resposta Update de usuário com sucesso
    Preparar massa de dados    update_user.json    update-register
    Set Test Variable    ${register}    ${body}
    Validar que o código response    200
    Validar que a resposta contém success    ${True}
    Validar que a resposta contém   _id
    Validar que a resposta contém dado    name    ${register}[name]
    Validar que a resposta contém dado    email    ${register}[email]
    Validar que a resposta contém dado    role    admin
    Validar que a resposta contém   createdAt

Enviar requisição DELETE para /users/_id
    [Arguments]    ${_id}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}

    ${resposta}  DELETE On Session
        ...          alias=api-cinema
        ...          url=/users/${_id}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA_DELETE}    ${resposta.json()}
    Log    ${RESPOSTA_DELETE}
    Log to Console    ${RESPOSTA_DELETE}

Validar resposta Delete de usuário com sucesso
    Validar que o código response    200
    Dictionary Should Contain Item    ${RESPOSTA_DELETE}    success    ${True}
    Dictionary Should Contain Item    ${RESPOSTA_DELETE}    message    User deleted successfully
