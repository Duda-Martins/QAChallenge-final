*** Settings ***
Documentation    Testes de CRUD de filmes pela API

Resource    ../../../resources/common/Base.resource

Suite Setup     Criar Sessão

*** Test Cases ***

CT021 - CRUD de filme por Admin (sucesso)
    [Tags]    CT021    filme    alta    allure.tms:CIN-56
    Logar usuario admin
    Preparar massa de dados    movies.json    cadastro-valido
    Enviar requisição POST para /movies    ${TOKEN_ADMIN}
    Validar resposta de Registro de filme com sucesso
    Preparar massa de dados    movies.json    edicao-valida
    Enviar requisição PUT para /movies/_id    ${_id}    ${TOKEN_ADMIN}
    Validar resposta de Edição de filme com sucesso
    Enviar requisição DELETE para /movies/_id    ${_id}    ${TOKEN_ADMIN}
    Validar resposta de Exclusão de filme com sucesso

CT022 - Validação de payload inválido ao criar filme
    [Tags]    CT022    filme    media    allure.tms:CIN-57
    Logar usuario admin
    Preparar massa de dados    movies.json    cadastro-invalido
    Enviar requisição POST para /movies    ${TOKEN_ADMIN}
    Validar resposta de Registro de filme inválido

CT023 - Bloqueio de CRUD de filme por usuário comum
    [Tags]    CT023    filme    baixa    allure.tms:CIN-58
    Logar usuario comum
    Preparar massa de dados    movies.json    cadastro-usuario-comum
    Enviar requisição POST para /movies    ${TOKEN_COMUM}
    Validar resposta rota não autorizada para usuário comum
    Preparar massa de dados    movies.json    edicao-usuario-comum
    Enviar requisição PUT para /movies/_id    ${_id}    ${TOKEN_COMUM}
    Validar resposta rota não autorizada para usuário comum
    Enviar requisição DELETE para /movies/_id    ${_id}    ${TOKEN_COMUM}
    Validar resposta rota não autorizada para usuário comum
    Logar usuario admin
    Enviar requisição DELETE para /users/_id    ${_id_usuario}    ${TOKEN_ADMIN}