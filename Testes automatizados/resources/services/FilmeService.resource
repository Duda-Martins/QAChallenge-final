*** Settings ***
Documentation    Keywords para o serviço de login de usuário na API.

Resource    ../common/Base.resource

*** Keywords ***

Enviar requisição POST para /movies
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}

    ${resposta}  POST On Session
        ...          alias=api-cinema
        ...          url=/movies
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

    Set Suite Variable    ${_id}    ${RESPOSTA}[data][_id]

Validar resposta de Registro de filme com sucesso
    Set Suite Variable    ${filme}    ${body}
    Validar que o código response    201
    Validar que a resposta contém success    ${True}
    Validar que a resposta contém   _id
    Validar que a resposta contém dado    title              ${body}[title]
    Validar que a resposta contém dado    synopsis           ${body}[synopsis]
    Validar que a resposta contém dado    director           ${body}[director]
    Validar que a resposta contém os gêneros informados    @{body}[genres]
    Validar que a resposta contém dado    duration           ${body}[duration]
    Validar que a resposta contém dado    classification     ${body}[classification]
    Validar que a resposta contém dado    poster             ${body}[poster]
    Validar que a resposta contém    releaseDate
    Validar que a resposta contém   createdAt

Enviar requisição PUT para /movies/_id
    [Arguments]    ${_id}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}

    ${resposta}  PUT On Session
        ...          alias=api-cinema
        ...          url=/movies/${_id}
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Validar resposta de Edição de filme com sucesso
    Validar que o código response    200
    Validar que a resposta contém success    ${True}
    Validar que a resposta contém   _id
    Validar que a resposta contém dado    title              ${filme}[title]
    Validar que a resposta contém dado    synopsis           ${filme}[synopsis]
    Validar que a resposta contém dado    director           ${filme}[director]
    Validar que a resposta contém os gêneros informados    @{filme}[genres]
    Validar que a resposta contém dado    duration           ${filme}[duration]
    Validar que a resposta contém dado    classification     ${filme}[classification]
    Validar que a resposta contém dado    poster             ${body}[poster]
    Validar que a resposta contém    releaseDate
    Validar que a resposta contém   createdAt

Enviar requisição DELETE para /movies/_id
    [Arguments]    ${_id}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}

    ${resposta}  DELETE On Session
        ...          alias=api-cinema
        ...          url=/movies/${_id}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Validar resposta de Exclusão de filme com sucesso
    Validar que o código response    200
    Validar que a resposta contém mensagem    Movie removed