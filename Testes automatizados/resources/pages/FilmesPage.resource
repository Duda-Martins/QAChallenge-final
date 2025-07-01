*** Settings ***
Documentation    Elementos e ações da página de filmes em cartaz.

Resource    ../common/Base.resource

*** Keywords ***
Ir para a página de filmes em cartaz
    Go To    ${BASE_URL}/movies

Validar se a página está do jeito certo
    Wait For Elements State    css=.movies-container h1    visible    5
    Get Text    css=.movies-container h1    equal    Filmes em Cartaz

Buscar por Interstellar e filtrar por Science Fiction
    Fill Text    css=.search-box input    Interstellar
    Select Options By    select    value    Science Fiction

Validar se o filme aparece
    Wait For Elements State    css=h3.movie-title >> text=Interstellar    visible    5

    Wait For Elements State    xpath=//div[contains(@class, 'movie-card')][.//h3[text()='Interstellar']]//img    visible

    Wait For Elements State    xpath=//div[contains(@class, 'movie-card')][.//h3[text()='Interstellar']]//a[text()='Ver Detalhes']    visible    5

Clicar em Ver Detalhes
    Click    xpath=//div[contains(@class, 'movie-card')][.//h3[text()='Interstellar']]//a[text()='Ver Detalhes']