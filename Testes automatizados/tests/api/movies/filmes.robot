*** Settings ***
Documentation    Testes de CRUD de filmes pela API

Resource    ../../../resources/common/Base.resource

Suite Setup     Criar Sessão

*** Test Cases ***

CT021 - CRUD de filme com sucesso - PT1 cadastro
    [Tags]    CT021    filme    alta
    Logar usuario admin
    Preparar massa de dados    movies.json    cadastro-valido
    Enviar requisição POST para /movies
    Validar resposta de Registro de filme com sucesso
    Preparar massa de dados    movies.json    edicao-valida
    Enviar requisição PUT para /movies/_id    ${_id}
    Validar resposta de Edição de filme com sucesso
    Enviar requisição DELETE para /movies/_id    ${_id}
    Validar resposta de Exclusão de filme com sucesso
