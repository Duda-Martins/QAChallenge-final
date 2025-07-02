*** Settings ***
Documentation    Keywords de validações comuns para todos os testes.

Resource    Base.resource

*** Keywords ***
Validar que o código response
    [Arguments]    ${status_sucesso}
    Status Should Be    ${status_sucesso}

Validar que a resposta contém success
    [Arguments]    ${success}
    Dictionary Should Contain Item    ${RESPOSTA}    success    ${success}

Validar que a resposta contém
    [Arguments]    ${key}
    Dictionary Should Contain Key    ${RESPOSTA}[data]    ${key}

Validar que a resposta contém dado
    [Arguments]    ${key}    ${dado}
    Dictionary Should Contain Item    ${RESPOSTA}[data]    ${key}    ${dado}

Validar que a resposta contém mensagem
    [Arguments]    ${dado}
    Dictionary Should Contain Item    ${RESPOSTA}    message    ${dado}

Validar que a resposta contém os gêneros informados
    [Arguments]    @{lista}
    FOR    ${genero}    IN    @{lista}
        Should Contain    ${RESPOSTA}[data][genres]    ${genero}
    END

Validar resposta rota não autorizada para usuário comum
    Validar que o código response    403
    Validar que a resposta contém success    ${False}