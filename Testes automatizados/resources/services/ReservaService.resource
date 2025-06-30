*** Settings ***
Documentation    Keywords para o serviço de login de usuário na API.

Resource    ../common/Base.resource

*** Keywords ***
Adicionar id
    [Arguments]    ${_id_sessao}
    Set To Dictionary    ${body}    session=${_id_sessao}

Enviar requisição POST para /reservations
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}

    ${resposta}  POST On Session
        ...          alias=api-cinema
        ...          url=/reservations
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}
    Set Test Variable    ${_id_reserva}    ${RESPOSTA}[data][_id]

Validar resposta de Cadastro de reserva com sucesso
    Set Test Variable    ${body_cadastro}    ${body}

    Validar que o código response           201
    Validar que a resposta contém    _id
    Validar que a resposta contém    user
    Validar que a resposta contém success   ${True}
    Validar que a resposta contém      session
    Validar que a resposta contém           seats
    Validar que a resposta contém    totalPrice
    Validar que a resposta contém    status
    Validar que a resposta contém    paymentStatus
    Validar que a resposta contém dado      paymentMethod    ${body_cadastro}[paymentMethod]
    Validar que a resposta contém    paymentDate
    Validar que a resposta contém    createdAt

Enviar requisição PUT para /reservations
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}

    ${resposta}  PUT On Session
        ...          alias=api-cinema
        ...          url=/reservations/${_id_reserva}
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Validar resposta de Edição de reserva com sucesso
    Validar que o código response           200
    Validar que a resposta contém    _id
    Validar que a resposta contém    user
    Validar que a resposta contém success   ${True}
    Validar que a resposta contém      session
    Validar que a resposta contém           seats
    Validar que a resposta contém    totalPrice
    Validar que a resposta contém dado    status    ${body}[status]
    Validar que a resposta contém    paymentStatus
    Validar que a resposta contém dado      paymentMethod    ${body_cadastro}[paymentMethod]
    Validar que a resposta contém    paymentDate
    Validar que a resposta contém    createdAt

Enviar requisição DELETE para /reservations/_id
    [Arguments]    ${_id_reserva}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}

    ${resposta}  DELETE On Session
        ...          alias=api-cinema
        ...          url=/reservations/${_id_reserva}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Validar resposta de Exclusão de reserva com sucesso
    Validar que o código response    200
    Validar que a resposta contém success    ${True}
    Validar que a resposta contém mensagem    Reservation deleted successfully