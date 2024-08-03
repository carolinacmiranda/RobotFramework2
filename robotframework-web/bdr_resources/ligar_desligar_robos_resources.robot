*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}             chrome
${URL}                 https://app.smarttbot.com/public/login
${LOGIN}               id=login-username
${PASSWORD}            id=login-password
${ACESSAR}             xpath=//span[@class='jss56'][contains(.,'ACESSAR')]
${PAG_PRINCIPAL}       xpath=//div[@class='jss216'][contains(.,'Análise geral')]
${CRIAR_ROBO}          xpath=//span[@class='jss321'][contains(.,'Criar Robô')]
${MODO_FACIL}          xpath=//sb-title[@variant='h3'][contains(.,'Criação Fácil')]
${MODO_COMPLETO}       xpath=//sb-title[@variant='h3'][contains(.,'Criação Completa')]
${CONFIGURAR}          xpath=//sb-button[@type='solid'][contains(.,'Configurar')]
${TANGRAM}             xpath=//sb-p[@fontsize='sm'][contains(.,'Tangram')]
${PRICE_ACTION}        xpath=//sb-p[@fontsize='sm'][contains(.,'Price Action')]
${MODO_SIMULADO}       xpath=(//sb-button[@data-testid='button'][contains(.,'Configurar')])[1]
${NOME_ROBÔ}=          document.querySelector('sb-input-text').shadowRoot
    ...                .querySelector('input')   
${AVANÇAR}             xpath=//sb-button[@type='link'][contains(.,'Avançar')]
${MODAL_PA}            xpath=//h2[contains(.,'Price Action')]
${MODAL_OK}            xpath=//span[contains(.,'Ok')]
${SALVAR}              id=save-instance-params
${SALVAR_2}            xpath=(//span[contains(.,'Salvar')])[2]
${INICIAR}             xpath=//button[contains(@aria-label,'Iniciar')]
${SUCESSO}             xpath=//h4[@class='notification-title'][contains(.,'Sucesso!')]
${PARAR}               xpath=//button[@aria-label='Parar']
${CONFIRMAR_PARAR}     name=confirm
${BOTÃO_ROBÔS}         xpath=(//span[contains(.,'.cls-sm-icon { fill: currentColor; }')])[2]


*** Keywords ***
#### SETUP
Abrir navegador
    Open Browser                 ${URL}    ${BROWSER}
    Maximize Browser Window
    

#### DADO
Que estou logado
    Input Text                          ${LOGIN}       automated01
    Input Password                      ${PASSWORD}    Testing202
    Click Element                       ${ACESSAR}
    Wait Until Page Contains Element    ${PAG_PRINCIPAL}

Que estou na aba de parâmetros do robô
    Wait Until Element Is Enabled    ${PARAR}

 
#### QUANDO
Eu clico em criar robôs Tangram
    Click Element                       ${CRIAR_ROBO}
    Wait Until Page Contains Element    ${MODO_FACIL}
    Wait Until Page Contains Element    ${MODO_COMPLETO}
    Click Element                       ${CONFIGURAR}
    Click Element                       ${TANGRAM}
    Click Element                       ${MODO_SIMULADO}
    Input Text                          dom:${NOME_ROBÔ}    Testes Automatizados - Tangram
    Click Element                       ${AVANÇAR}
    Wait Until Element Is Visible       ${SALVAR}
    Click Element                       ${SALVAR}
    Wait Until Element Is Visible       ${SALVAR_2}
    Click Element                       ${SALVAR_2}
    Wait Until Element Is Enabled       ${INICIAR}
    Click Element                       ${INICIAR}

Eu clico em criar robôs Price Action
    Click Element                       ${BOTÃO_ROBÔS}
    Click Element                       ${CRIAR_ROBO}
    Wait Until Page Contains Element    ${MODO_FACIL}
    Wait Until Page Contains Element    ${MODO_COMPLETO}
    Click Element                       ${CONFIGURAR}
    Click Element                       ${PRICE_ACTION}
    Click Element                       ${MODO_SIMULADO}
    Input Text                          dom:${NOME_ROBÔ}    Testes Automatizados - PA
    Click Element                       ${AVANÇAR}
    Wait Until Element Is Visible       ${MODAL_PA}
    Click Element                       ${MODAL_OK}
    Wait Until Element Is Visible       ${SALVAR}
    Click Element                       ${SALVAR}
    Wait Until Element Is Visible       ${SALVAR_2}
    Click Element                       ${SALVAR_2}
    Wait Until Element Is Enabled       ${INICIAR}
    Click Element                       ${INICIAR}

Eu clico no botão de parar robô
    Wait Until Element Is Visible    ${PARAR}
    Click Element                    ${PARAR}
    Wait Until Element Is Visible    ${CONFIRMAR_PARAR}
    Click Element                    ${CONFIRMAR_PARAR}


#### ENTÃO
Devo conseguir criar um robô com sucesso
    Wait Until Element Is Visible    ${SUCESSO}

O robô deve ser parado com sucesso
    Sleep    7s
    Wait Until Element Is Visible    ${SUCESSO}


#### TEARDOWN
Fechar navegador
    Capture Page Screenshot
    Close All Browsers
