*** Settings ***
Documentation    Elemento de Logout.

Resource    ../../common/Base.resource
Library    Browser

*** Keywords ***
Clicar em Sair
    Run Keyword And Ignore Error    Click    css=.btn-logout