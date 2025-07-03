*** Settings ***
Documentation    Testes de sessão pela API.

Resource    ../../../resources/common/Base.resource

Suite Setup     Criar Sessão

*** Test Cases ***
CT028 - Criar nova sessão de filme por Admin
    [Tags]    CT028    sessao    media    allure.issue:CIN-109    allure.tms:QALITY-CIN-63
    Logar usuario admin
    Preparar massa de dados    movies.json    cadastro-valido
    Enviar requisição POST para /movies    ${TOKEN_ADMIN}
    Pegar id filme
    Preparar massa de dados    theaters.json    cadastro-valido
    Enviar requisição POST para /theaters    ${TOKEN_ADMIN}
    Pegar id teatro

    Preparar massa de dados    sessions.json    cadastro-valido
    Adicionar ids    ${_id_filme}    ${_id_teatro}
    Enviar requisição POST para /sessions
    Validar resposta de Cadastro de sessão com sucesso

    Enviar requisição DELETE para /movies/_id    ${_id_filme}    ${TOKEN_ADMIN}
    Enviar requisição DELETE para /theaters/_id    ${_id_teatro}    ${TOKEN_ADMIN}    ${False}
    Enviar requisição DELETE para /sessions/_id    ${_id_sessao}