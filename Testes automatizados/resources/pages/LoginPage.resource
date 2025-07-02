*** Settings ***
Documentation    Elementos e ações da página de login.

Resource    ../common/Base.resource

*** Keywords ***
Logar usuario
    Go To    ${BASE_URL}/login
    Sleep    5
    Fill Text    id=email    ludovico@example.com
    Fill Text    id=password    senhaqq1
    Click    css=.login-btn