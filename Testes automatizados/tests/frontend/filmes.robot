*** Settings ***
Documentation    Testes de CRUD de filmes pela API

Resource    ../../resources/common/Base.resource

Suite Setup     Run Keywords    Criar Sessão    AND    Abrir página

*** Test Cases ***
CT015 - Listagem de filmes com filtros e paginação
    [Tags]    CT015    filme    media
    Ir para a página de filmes em cartaz