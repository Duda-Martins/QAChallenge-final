*** Settings ***
Documentation    Elementos e ações da página do filme Interestellar.

Resource    ../common/Base.resource

*** Keywords ***
Validar página de detalhes do filme
    Wait For Elements State    css=.movie-info h1 >> text=Interstellar    visible    5
    Wait For Elements State    css=.movie-meta    visible    5
    ${diretor}=    Get Text    css=.movie-director >> text="Christopher Nolan"
    Wait For Elements State    css=.movie-synopsis p >> text="A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival."    visible    5
    Wait For Elements State    css=.sessions-container    visible    5
    Sleep    2
    Wait For Elements State    css=.movie-detail-header .movie-poster img    visible    5

Clicar em Selecionar Assentos
    Scroll To Element    xpath=//*[@id="root"]/main/div/div/div/div[2]/div[5]/div/div[1]/div/div[1]/a
    Click    xpath=//*[@id="root"]/main/div/div/div/div[2]/div[5]/div/div[1]/div/div[1]/a