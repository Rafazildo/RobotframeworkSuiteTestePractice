*** Settings ***
Library       SeleniumLibrary
Library       FakerLibrary
Library       String

*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome
${NOME}                          Name

@{SUMMERDRESS}       Printed Summer Dress    Printed Chiffon Dress

*** Keywords ***


Abrir navegador
    Open Browser  ${URL}  ${BROWSER}

Fechar navegador
    Close Browser

Acessar a página home do site
    Title Should Be                  My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                       id=search_query_top    ${PRODUTO}

Clicar no botão pesquisar
    Click Element                    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible    css=#center_column > h1
    Page Should Contain Link         xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir mensagem de erro "No results were found for your search "${PRODUTO}""
    Wait Until Element Is Visible    //*[@id="center_column"]/p[@class="alert alert-warning"]
    Element Should Contain           //*[@id="center_column"]/p[@class="alert alert-warning"]    No results were found for your search "${PRODUTO}"
    Element Should Contain           //*[@id="center_column"]//span[@class="heading-counter"]    0 results have been found.

Passar o mouse por cima da categoria "Women" no menu principal superior de categorias.
    Mouse Over                       //*[@id="block_top_menu"]/ul/li[1]/a[@title="Women"]
    Element Should Be Visible        //*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/a[@title="Tops"]
    Element Should Be Visible        //*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[1]/a[@title="T-shirts"]
    Element Should Be Visible        //*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[2]/a[@title="Blouses"]
    Element Should Be Visible        //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/a[@title="Dresses"]
    Element Should Be Visible        //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[1]/a[@title="Casual Dresses"]
    Element Should Be Visible        //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[2]/a[@title="Evening Dresses"]
    Element Should Be Visible        //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a[@title="Summer Dresses"]

Clicar na sub categoria "${CATEGORIA}"
    Click Element                    //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a[@title="${CATEGORIA}"]

Conferir se os produtos da categoria "${CATEGORIA}" foram listados
    Wait Until Element Is Visible    css=#center_column > h1 > span.cat-name
    Element Should Contain           //*[@id="center_column"]/h1/span[1][@class="cat-name"][contains(text(),"Summer Dresses")]    SUMMER DRESSES
    Page Should Contain Element      //*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a[@title="${SUMMERDRESS[0]}"]
    Page Should Contain Element      //*[@id="center_column"]/ul/li[2]/div/div[2]/h5/a[@title="${SUMMERDRESS[0]}"]
    Page Should Contain Element      //*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a[@title="${SUMMERDRESS[1]}"]

Adicionar produto "${PRODUTO}" no carrinho
    Mouse Over                       //*[@id="center_column"]/ul/li/div/div[2]/h5/a[contains(text(),"${PRODUTO}")]
    Click Element                    //*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1][@title="Add to cart"]
    Wait Until Element Is Visible    //*[@id="layer_cart_product_title"][contains(text(),"${PRODUTO}")]
    Element Should Contain           //*[@id="layer_cart_product_title"][contains(text(),"${PRODUTO}")]                ${PRODUTO}

Vizualizar produto "${PRODUTO}" no carrinho
    Click Element                    //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a[@title="Proceed to checkout"]
    Wait Until Element Is Visible    //*[@id="columns"]/div[1]/span[2][contains(text(),"Your shopping cart")]
    Element Should Contain           //*[@id="product_1_1_0_0"]/td[2]/p/a[contains(text(),"T-shirts")]                 ${PRODUTO}

Ir para home page
    Click Element                    //*[@id="columns"]/div[1]/a[@title="Return to Home"]

Acessar carrinho
    Mouse Over                       //*[@id="header"]/div[3]/div/div/div[3]/div/a[@title="View my shopping cart"]
    Click Element                    id=button_order_cart
    Wait Until Element Is Visible    //*[@id="columns"]/div[1]/span[2][contains(text(),"Your shopping cart")]

Remover produto do Carrinho
    Click Element                    //*[@id="1_1_0_0"][@title="Delete"]
    Wait Until Element Is Visible    //*[@id="center_column"]/p[@class="alert alert-warning"]
    Element Should Contain           //*[@id="center_column"]/p[@class="alert alert-warning"]                           Your shopping cart is empty.

Clicar no botão Sing In
    Click Element                    //*[@id="header"]/div[2]/div/div/nav/div[1]/a[@title="Log in to your customer account"]
    Wait Until Element Is Visible    //*[@id="create-account_form"]/h3[contains(text(),"Create an account")]

Criar email aleatorio
    [arguments]   ${NOME}    ${SOBRENOME}   ${STRINGRANDOMICA}    ${FIMEMAILVALIDO}
    ${EMAIL}      Set Variable    ${NOME}${SOBRENOME}${STRINGRANDOMICA}${FIMEMAILVALIDO}
    [return]      ${EMAIL}

Preencher email de registro
    ${NOME}                          First Name
    ${SOBRENOME}                     Last Name
    ${STRINGRANDOMICA}               Generate Random String	    4	   [LOWER]
    ${FIMEMAILVALIDO}                Set Variable    @testerobot.com
    ${EMAIL}                         Criar email aleatorio    ${NOME}    ${SOBRENOME}    ${STRINGRANDOMICA}    ${FIMEMAILVALIDO}
    Input Text                       id=email_create                 ${EMAIL}
    Log To Console    ${EMAIL}
    Click Element                    id=SubmitCreate
    Wait Until Element Is Visible    //*[@id="noSlide"]/h1[contains(text(),"Create an account")]

Preencher formulário de registro
    ${NOME}                          First Name
    ${SOBRENOME}                     Last Name
    ${PASSWORD}                      Password
    ${DIA}                           Day Of Month
    ${MES}                           Month
    ${ANO}                           Year

    ${MESNASCIMENTO}=                Set Variable If    '${MES}' == '01'    1
                                     ...                '${MES}' == '02'    2
                                     ...                '${MES}' == '03'    3
                                     ...                '${MES}' == '04'    4
                                     ...                '${MES}' == '05'    5
                                     ...                '${MES}' == '06'    6
                                     ...                '${MES}' == '07'    7
                                     ...                '${MES}' == '08'    8
                                     ...                '${MES}' == '09'    9
                                     ...                '${MES}' == '10'    10
                                     ...                '${MES}' == '11'    11
                                     ...                '${MES}' == '12'    12

    ${DIANASCIMENTO}=                Set Variable If    '${DIA}' == '01'    1
                                     ...                '${DIA}' == '02'    2
                                     ...                '${DIA}' == '03'    3
                                     ...                '${DIA}' == '04'    4
                                     ...                '${DIA}' == '05'    5
                                     ...                '${DIA}' == '06'    6
                                     ...                '${DIA}' == '07'    7
                                     ...                '${DIA}' == '08'    8
                                     ...                '${DIA}' == '09'    9
                                     ...                '${DIA}' == '10'    10
                                     ...                '${DIA}' == '11'    11
                                     ...                '${DIA}' == '12'    12
                                     ...                '${DIA}' == '13'    13
                                     ...                '${DIA}' == '14'    14
                                     ...                '${DIA}' == '15'    15
                                     ...                '${DIA}' == '16'    16
                                     ...                '${DIA}' == '17'    17
                                     ...                '${DIA}' == '18'    18
                                     ...                '${DIA}' == '19'    19
                                     ...                '${DIA}' == '20'    20
                                     ...                '${DIA}' == '21'    21
                                     ...                '${DIA}' == '22'    22
                                     ...                '${DIA}' == '23'    23
                                     ...                '${DIA}' == '24'    24
                                     ...                '${DIA}' == '25'    25
                                     ...                '${DIA}' == '26'    26
                                     ...                '${DIA}' == '27'    27
                                     ...                '${DIA}' == '28'    28
                                     ...                '${DIA}' == '29'    29
                                     ...                '${DIA}' == '30' and '${MESNASCIMENTO}' != '2'    30
                                     ...                '${DIA}' == '30' and '${MESNASCIMENTO}' == '2'    1
                                     ...                '${DIA}' == '31' and '${MESNASCIMENTO}' != '2' and '${MESNASCIMENTO}' != '4' and '${MESNASCIMENTO}' != '6' and '${MESNASCIMENTO}' != '9' and '${MESNASCIMENTO}' != '11'    31
                                     ...                '${DIA}' == '31' and '${MESNASCIMENTO}' == '2' or '${MESNASCIMENTO}' == '4' or '${MESNASCIMENTO}' == '6' or '${MESNASCIMENTO}' == '9' or '${MESNASCIMENTO}' == '11'    1


    &{PESSOA}=                       Create Dictionary    nome=${NOME}    sobrenome=${SOBRENOME}    password=${PASSWORD}    diaNascimento=${DIANASCIMENTO}    mesNascimento=${MESNASCIMENTO}    anoNascimento=${ANO}

    ${LOGRADOURO}                    Street Address
    ${CIDADE}                        City
    ${ZIPCODE}                       Zipcode
    ${PHONENUMBER}                   Phone Number
    &{ENDERECO}=                     Create Dictionary    logradouro=${LOGRADOURO}    cidade=${CIDADE}    zipcode=${ZIPCODE}    celular=${PHONENUMBER}    estado=32    pais=21    apelido=Casa

    # Não consegui setar os dicionários da forma que eu gostaria, se alguém souber como implementar o que eu tentei nas duas linhas abaixo, por favor me avise
    # &{PESSOA}                        nome=FakerLibrary.First Name    sobrenome=FakerLibrary.Last Name    password=FakerLibrary.Password   diaNascimento=FakerLibrary.Day Of Month    mesNascimento=Month
    # &{ENDERECO}                      logrador=FakerLibrary.Street Address    cidade=FakerLibrary.City    zipcode=FakerLibrary.Zipcode    celular=FakerLibrary.Phone Number

    Click Element                    id=id_gender1
    Input Text                       id=customer_firstname                   ${PESSOA.nome}
    Input Text                       id=customer_lastname                    ${PESSOA.sobrenome}
    Input Password                   id=passwd                               ${PESSOA.password}
    Set Focus To Element             id=days
    Select From List By Value        id=days                                 ${PESSOA.diaNascimento}
    Set Focus To Element             id=months
    Select From List By Value        id=months                               ${PESSOA.mesNascimento}
    Set Focus To Element             id=years
    Select From List By Value        id=years                                ${PESSOA.anoNascimento}
    Input Text                       id=firstname                            ${PESSOA.nome}
    Input Text                       id=lastname                             ${PESSOA.sobrenome}
    Input Text                       id=address1                             ${ENDERECO.logradouro}
    Input Text                       id=city                                 ${ENDERECO.cidade}
    Set Focus To Element             id=id_state
    Select From List By Value        id=id_state                             ${ENDERECO.estado}
    Input Text                       id=postcode                             ${ENDERECO.zipcode}
    Set Focus To Element             id=id_country
    Select From List By Value        id=id_country                           ${ENDERECO.pais}
    Input Text                       id=phone_mobile                         ${ENDERECO.celular}
    Input Text                       id=alias                                ${ENDERECO.apelido}

Clicar no botão Register
    Click Element                    id=submitAccount
    Wait Until Element Is Visible    //*[@id="columns"]/div[1]/span[2][contains(text(),"My account")]
