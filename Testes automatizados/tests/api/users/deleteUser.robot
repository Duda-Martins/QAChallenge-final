*** Settings ***
Documentation    Testes de deleção de usuário pela API.

Resource    ../../../resources/common/Base.resource

Suite Setup     Criar Sessão

*** Test Cases ***
CT037 - Excluir usuário sem reservas como admin
    [Tags]    CT037    deleteUser    media
    Logar usuario admin
    Preparar massa de dados    delete_user.json    delete-register
    Enviar requisição POST para /auth/register
    Enviar requisição DELETE para /users/_id    ${_id}
    Validar resposta Delete de usuário com sucesso