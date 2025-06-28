*** Settings ***
Documentation    Testes de deleção de usuário pela API.

Resource    ../../../resources/common/Base.resource

Suite Setup     Criar Sessão

*** Test Cases ***
CT036 - Editar dados de um usuário para promovê-lo à admin
    [Tags]    CT036    updateUser    alta
    Logar usuario admin
    Preparar massa de dados    update_user.json    update-register
    Enviar requisição POST para /auth/register
    Preparar massa de dados    update_user.json    update-promover
    Enviar requisição PUT para /users/_id    ${RESPOSTA}[data][_id]
    Enviar requisição DELETE para /users/_id    ${RESPOSTA}[data][_id]
    Log    ${RESPOSTA}
    Validar resposta Update de usuário com sucesso