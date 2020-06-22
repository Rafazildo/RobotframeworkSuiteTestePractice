*** Settings ***
Resource          ../resource/Resource.robot
Test Setup        Abrir navegador
# Test Teardown     Fechar navegador

*** Test Case ***
# Caso de teste 01: Pesquisar Produtos Existentes
#     Acessar a página home do site
#     Digitar o nome do produto "Blouse" no campo de pesquisa
#     Clicar no botão pesquisar
#     Conferir se o produto "Blouse" foi listado no site
#
# Caso de teste 02: Pesquisar Produtos não Existentes
#     Acessar a página home do site
#     Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
#     Clicar no botão pesquisar
#     Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""

# Caso de teste 03: Listar Produtos
#     Acessar a página home do site
#     Passar o mouse por cima da categoria "Women" no menu principal superior de categorias.
#     Clicar na sub categoria "Summer Dresses"
#     Conferir se os produtos da categoria "Summer Dresses" foram listados

# Caso de teste 04: Adicionar Produtos ao Carrinho
#     Acessar a página home do site
#     Digitar o nome do produto "T-shirts" no campo de pesquisa
#     Clicar no botão pesquisar
#     Conferir se o produto "T-shirts" foi listado no site
#     Adicionar produto "T-shirts" no carrinho
#     Vizualizar produto "T-shirts" no carrinho

# Caso de teste 05: Remover Produtos
#     Acessar a página home do site
#     Digitar o nome do produto "T-shirts" no campo de pesquisa
#     Clicar no botão pesquisar
#     Conferir se o produto "T-shirts" foi listado no site
#     Adicionar produto "T-shirts" no carrinho
#     Vizualizar produto "T-shirts" no carrinho
#     Ir para home page
#     Acessar carrinho
#     Remover produto do Carrinho

Caso de teste 06: Adicionar Cliente
    Acessar a página home do site
    Clicar no botão Sing In
    Preencher email de registro
    Preencher formulário de registro




*** Keywords ***
