*** Settings ***
Documentation    Testes de reservas pela API.

Resource    ../../../resources/common/Base.resource

Suite Setup     Criar Sessão

*** Test Cases ***
CT033 - Atualizar status de uma reserva (Admin)
    [Tags]    CT033    reserva    media    allure.tms:CIN-68
    Logar usuario admin
    Criar filme, teatro e sessão

    Preparar massa de dados    reservations.json    cadastro-valido
    Adicionar id    ${_id_sessao}
    Enviar requisição POST para /reservations
    Validar resposta de Cadastro de reserva com sucesso

    Preparar massa de dados    reservations.json    edicao-valida
    Enviar requisição PUT para /reservations
    Validar resposta de Edição de reserva com sucesso

    Excluir filme, sessão e teatro
    Enviar requisição DELETE para /reservations/_id    ${_id_reserva}
    Validar resposta de Exclusão de reserva com sucesso