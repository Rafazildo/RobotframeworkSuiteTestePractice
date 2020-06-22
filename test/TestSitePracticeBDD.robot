*** Settings ***
Resource          ../resource/Resource.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Case ***
Cenário de teste 01: Pesquisar produto existente
    Dado que eu esteja na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca

Cenário de teste 02: Pesquisar produto não existente
    Dado que eu esteja na página home do site
    Quando eu pesquisar pelo produto "ItemNãoExistente"
    Então o a página deve exibir a mensagem de erro "No results were found for your search "ItemNãoExistente""

*** Keywords ***

Dado que eu esteja na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então o a página deve exibir a mensagem de erro "No results were found for your search "${PRODUTO}""
    Conferir mensagem de erro "No results were found for your search "${PRODUTO}""
