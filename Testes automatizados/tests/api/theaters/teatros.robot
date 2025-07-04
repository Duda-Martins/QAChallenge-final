*** Settings ***
Documentation    Testes de CRUD de teatros pela API.

Resource    ../../../resources/common/Base.resource

Suite Setup     Criar Sessão

*** Test Cases ***

CT024 - CRUD de teatro por Admin (sucesso)
    [Tags]    CT024    teatro    alta
    Logar usuario admin
    Preparar massa de dados    theaters.json    cadastro-valido
    Enviar requisição POST para /theaters    ${TOKEN_ADMIN}
    Validar resposta de Registro de teatro com sucesso
    Preparar massa de dados    theaters.json    edicao-valida
    Enviar requisição PUT para /theaters/_id    ${_id}    ${TOKEN_ADMIN}
    Validar resposta de Edição de teatro com sucesso
    Enviar requisição DELETE para /theaters/_id    ${_id}    ${TOKEN_ADMIN}    ${False}
    Validar resposta de Exclusão de teatro com sucesso

CT025 - Validação de payload inválido ao criar teatro
    [Tags]    CT025    teatro    media
    Logar usuario admin
    Preparar massa de dados    theaters.json    cadastro-invalido
    Enviar requisição POST para /theaters    ${TOKEN_ADMIN}
    Validar resposta de Registro de teatro inválido

CT026 - Bloqueio de CRUD de teatro por usuário comum
    [Tags]    CT026    teatro    baixa
    Logar usuario comum
    Preparar massa de dados    theaters.json    cadastro-usuario-comum
    Enviar requisição POST para /theaters    ${TOKEN_COMUM}
    Validar resposta rota não autorizada para usuário comum
    Preparar massa de dados    theaters.json    edicao-usuario-comum
    Enviar requisição PUT para /theaters/_id    ${_id}    ${TOKEN_COMUM}
    Validar resposta rota não autorizada para usuário comum
    Enviar requisição DELETE para /theaters/_id    ${_id}    ${TOKEN_COMUM}    ${False}
    Validar resposta rota não autorizada para usuário comum
    Logar usuario admin
    Enviar requisição DELETE para /users/_id    ${_id_usuario}    ${TOKEN_ADMIN}

CT027 - Bloqueio ao tentar excluir teatro com sessões ativas
    [Tags]    CT027    teatro    media
    Logar usuario admin
    Criar filme, teatro e sessão
    Enviar requisição DELETE para /theaters/_id    ${_id_teatro}    ${TOKEN_ADMIN}    ${True}
    Excluir filme, sessão e teatro
    Validar resposta de Exclusão de teatro com sessões ativas