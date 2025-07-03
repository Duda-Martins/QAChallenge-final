*** Settings ***
Documentation    Testes de gerenciamento de usuários pela API.

Resource    ../../../resources/common/Base.resource

Suite Setup     Criar Sessão

*** Test Cases ***
CT037 - Excluir usuário sem reservas como admin
    [Tags]    CT037    deleteUser    media    allure.tms:CIN-72
    Logar usuario admin
    Preparar massa de dados    delete_user.json    delete-register
    Enviar requisição POST para /auth/register
    Enviar requisição DELETE para /users/_id    ${_id}    ${TOKEN_ADMIN}
    Validar resposta Delete de usuário com sucesso

CT036 - Editar dados de um usuário para promovê-lo à admin
    [Tags]    CT036    updateUser    alta    allure.tms:CIN-71
    Logar usuario admin
    Preparar massa de dados    update_user.json    update-register
    Enviar requisição POST para /auth/register
    Preparar massa de dados    update_user.json    update-promover
    Enviar requisição PUT para /users/_id    ${RESPOSTA}[data][_id]    ${TOKEN_ADMIN}
    Enviar requisição DELETE para /users/_id    ${RESPOSTA}[data][_id]    ${TOKEN_ADMIN}
    Validar resposta Update de usuário com sucesso

CT039 - Bloqueio de acesso aos endpoints de usuários por usuário comum
    [Tags]    CT039    user    alta    allure.tms:CIN-74
    Logar usuario comum
    Preparar massa de dados    comum_user.json    register-comum
    Enviar requisição POST para /auth/register

    Enviar requisição GET para /users    ${TOKEN_COMUM}
    Validar resposta rota não autorizada para usuário comum

    Enviar requisição GET para /users/_id    ${_id}    ${TOKEN_COMUM}
    Validar resposta rota não autorizada para usuário comum

    Preparar massa de dados    comum_user.json    promover-comum
    Enviar requisição PUT para /users/_id    ${_id}    ${TOKEN_COMUM}
    Validar resposta rota não autorizada para usuário comum

    Enviar requisição DELETE para /users/_id    ${_id}    ${TOKEN_COMUM}
    Validar resposta rota não autorizada para usuário comum

    Logar usuario admin
    Enviar requisição DELETE para /users/_id    ${_id}    ${TOKEN_ADMIN}
    Enviar requisição DELETE para /users/_id    ${_id_usuario}    ${TOKEN_ADMIN}