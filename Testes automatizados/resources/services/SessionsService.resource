*** Settings ***
Documentation    Keywords para o serviço de sessões na API.

Resource    ../common/Base.resource

*** Keywords ***
Pegar id filme
    Set Test Variable    ${_id_filme}    ${RESPOSTA}[data][_id]
Pegar id teatro
    Set Test Variable    ${_id_teatro}    ${RESPOSTA}[data][_id]
Adicionar ids
    [Arguments]    ${_id_filme}    ${_id_teatro}
    Set To Dictionary    ${body}    movie=${_id_filme}
    Set To Dictionary    ${body}    theater=${_id_teatro}

Enviar requisição POST para /sessions
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}

    ${resposta}  POST On Session
        ...          alias=api-cinema
        ...          url=/sessions
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}
    Set Test Variable    ${_id}    ${RESPOSTA}[data][_id]

Validar resposta de Cadastro de sessão com sucesso
    Validar que o código response           201
    Validar que a resposta contém success   ${True}
    Validar que a resposta contém           _id
    Validar que a resposta contém dado      movie    ${body}[movie]
    Validar que a resposta contém dado      theater    ${body}[theater]
    Validar que a resposta contém dado      datetime    ${body}[datetime]
    Validar que a resposta contém dado      fullPrice    ${body}[fullPrice]
    Validar que a resposta contém dado      halfPrice    ${body}[halfPrice]
    Validar que a resposta contém           seats
    Validar que a resposta contém           createdAt

Enviar requisição DELETE para /sessions/_id
    [Arguments]   ${_id}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}

    ${resposta}  DELETE On Session
        ...          alias=api-cinema
        ...          url=/sessions/${_id}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA_DELETE}    ${resposta.json()}
    Log    ${RESPOSTA_DELETE}
    Log to Console    ${RESPOSTA_DELETE}