*** Settings ***
Documentation    Keywords para o serviço de CRUD de teatros na API.

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
    [Arguments]    ${_id}    ${TOKEN}    ${guardar_resposta}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    ${resposta}  DELETE On Session
        ...          alias=api-cinema
        ...          url=/theaters/${_id}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Run Keyword If    ${guardar_resposta} == ${True}
    ...    Set Test Variable    ${resposta_para_status}    ${resposta}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Validar resposta de Exclusão de teatro com sucesso
    Validar que o código response    200

Validar resposta de Registro de teatro inválido
    Validar que o código response    400

Validar resposta de Exclusão de teatro com sessões ativas
    Status Should Be    409    ${resposta_para_status}