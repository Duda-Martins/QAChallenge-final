*** Settings ***
Documentation    Keywords para o serviço de login de usuário na API.

Resource    ../common/Base.resource

*** Keywords ***

Enviar requisição POST para /theaters
    [Arguments]    ${TOKEN}
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    ${resposta}  POST On Session
        ...          alias=api-cinema
        ...          url=/theaters
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

    Run Keyword And Ignore Error    Set Suite Variable    ${_id}    ${RESPOSTA}[data][_id]

Validar resposta de Registro de teatro com sucesso
    Set Suite Variable    ${teatro}    ${body}
    Validar que o código response    201
    Validar que a resposta contém   _id
    Validar que a resposta contém dado    name              ${body}[name]
    Validar que a resposta contém dado    capacity           ${body}[capacity]
    Validar que a resposta contém dado    type           ${body}[type]
    Validar que a resposta contém   createdAt

Enviar requisição PUT para /theaters/_id
    [Arguments]    ${_id}    ${TOKEN}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    ${resposta}  PUT On Session
        ...          alias=api-cinema
        ...          url=/theaters/${_id}
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Validar resposta de Edição de teatro com sucesso
    Validar que o código response    200
    Validar que a resposta contém   _id
    Validar que a resposta contém dado    name              ${teatro}[name]
    Validar que a resposta contém dado    capacity           ${body}[capacity]
    Validar que a resposta contém dado    type           ${teatro}[type]
    Validar que a resposta contém   createdAt

Enviar requisição DELETE para /theaters/_id
    [Arguments]    ${_id}    ${TOKEN}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    ${resposta}  DELETE On Session
        ...          alias=api-cinema
        ...          url=/theaters/${_id}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

    Set Test Variable    ${RESPOSTA_DELETE}    ${resposta}

Validar resposta de Exclusão de teatro com sucesso
    Validar que o código response    200

Validar resposta de Registro de teatro inválido
    Validar que o código response    400

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
    Enviar requisição DELETE para /sessions/_id    ${_id}

Validar resposta de Exclusão de teatro com sessões ativas
    Status Should Be    409    ${RESPOSTA_DELETE}