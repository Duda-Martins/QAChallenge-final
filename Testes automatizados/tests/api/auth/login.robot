*** Settings ***
Documentation    Testes de login pela API

Resource    ../../../resources/common/Base.resource

Suite Setup     Criar Sessão

*** Test Cases ***
CT005 - Login com sucesso
    [Tags]    CT005    login    alta
    Logar usuario admin
    Preparar massa de dados    login.json    valido-cadastro-login
    Enviar requisição POST para /auth/register
    Validar resposta Registro de usuário com sucesso
    Preparar massa de dados    login.json    valido-login
    Enviar requisição POST para /auth/login
    Validar resposta Login de usuário com sucesso
    Enviar requisição DELETE para /users/_id    ${RESPOSTA}[data][_id]    ${TOKEN_ADMIN}

CT006 - Login com senha incorreta
    [Tags]    CT006    login    alta
    Preparar massa de dados    login.json    valido-cadastro-login
    Enviar requisição POST para /auth/register
    Validar resposta Registro de usuário com sucesso
    Logar usuario admin
    Preparar massa de dados    login.json    senha-errada-login
    Enviar requisição POST para /auth/login
    Enviar requisição DELETE para /users/_id    ${_id}    ${TOKEN_ADMIN}
    Validar resposta Login de usuário com senha errada

CT007 - Login com email não cadastrado
    [Tags]    CT007    login    media
    Preparar massa de dados    login.json    nao-existe-login
    Enviar requisição POST para /auth/login
    Validar resposta Login de usuário inexistente