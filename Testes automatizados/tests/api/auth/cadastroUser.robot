*** Settings ***
Documentation    Testes de cadastro de usuário pela API

Resource    ../../../resources/common/Base.resource

Suite Setup     Criar Sessão

*** Test Cases ***

CT001 - Registro de usuário com sucesso
    [Tags]    CT001    cadastro    alta    allure.issue:CIN-98    allure.tms:QALITY-CIN-36
    Preparar massa de dados    cadastro.json    valido
    Enviar requisição POST para /auth/register
    Validar resposta Registro de usuário com sucesso
    Logar usuario admin
    Enviar requisição DELETE para /users/_id    ${_id}    ${TOKEN_ADMIN}

CT002 - Registro com e-mail duplicado
    [Tags]    CT002    cadastro    alta    allure.issue:CIN-99    allure.tms:QALITY-CIN-37
    Preparar massa de dados    cadastro.json    valido
    Enviar requisição POST para /auth/register
    Validar resposta Registro de usuário com sucesso
    Logar usuario admin
    Enviar requisição POST para /auth/register
    Enviar requisição DELETE para /users/_id    ${_id}    ${TOKEN_ADMIN}
    Validar resposta de Registro de usuário duplicado

CT003 - Registro com e-mail inválido
    [Tags]    CT003    cadastro    alta    allure.issue:CIN-100    allure.tms:QALITY-CIN-38
    Preparar massa de dados    cadastro.json    email-invalido
    Enviar requisição POST para /auth/register
    Validar resposta Registro de usuário com imput inválido

CT004 - Registro com senha inválida
    [Tags]    CT004    cadastro    alta    allure.issue:CIN-101    allure.tms:QALITY-CIN-39
    Preparar massa de dados    cadastro.json    senha-invalida
    Enviar requisição POST para /auth/register
    Validar resposta Registro de usuário com imput inválido