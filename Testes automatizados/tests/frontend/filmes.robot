*** Settings ***
Documentation    Testes de CRUD de filmes pela API

Resource    ../../resources/common/Base.resource

Suite Setup     Run Keywords    Criar Sessão    AND    Abrir página
Test Teardown    Take Screenshot

*** Test Cases ***
CT015 - Listagem de filmes com filtros e paginação
    [Tags]    CT015    filme    media    allure.issue:CIN-117    allure.tms:QALITY-CIN-50
    Ir para a página de filmes em cartaz
    Validar se a página está do jeito certo
    Buscar por Interstellar e filtrar por Science Fiction
    Validar se o filme aparece

CT016 - Detalhes de filme com sessões
    [Tags]    CT016    filme    media    allure.issue:CIN-118    allure.tms:QALITY-CIN-51
    Ir para a página de filmes em cartaz
    Buscar por Interstellar e filtrar por Science Fiction
    Clicar em Ver Detalhes
    Validar página de detalhes do filme