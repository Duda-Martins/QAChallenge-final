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
    Scroll To Element    xpath=//div[h3[@class='session-date' and text()='30/06/2025']]//div[contains(@class, 'session-card') and .//div[contains(@class, 'session-time') and contains(., '12:00')]]//a[contains(@class, 'session-button') and text()='Selecionar Assentos']
    Click    xpath=//div[h3[@class='session-date' and text()='30/06/2025']]//div[contains(@class, 'session-card') and .//div[contains(@class, 'session-time') and contains(., '12:00')]]//a[contains(@class, 'session-button') and text()='Selecionar Assentos']