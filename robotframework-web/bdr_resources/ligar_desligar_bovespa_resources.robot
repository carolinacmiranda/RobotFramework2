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
${ESCOLHER_ROBÔ}       xpath=//sb-button[@type='solid'][contains(.,'Escolher Robô')]
${VALE}                xpath=//sb-p[contains(.,'Vale')]
${CLICK_VALE}          xpath=(//sb-button[@data-testid='button'][contains(.,'Criar')])[2]
${MODO_COMPLETO}       xpath=//sb-title[@variant='h3'][contains(.,'Criação Completa')]
${CONFIGURAR}          xpath=//sb-button[@type='solid'][contains(.,'Configurar')]
${MODO_SIMULADO}       xpath=(//sb-button[@data-testid='button'][contains(.,'Configurar')])[1]
${NOME_ROBÔ}=          document.querySelector('sb-input-text').shadowRoot
    ...                .querySelector('input')   
${AVANÇAR}             xpath=//sb-button[@type='link'][contains(.,'Avançar')]
${SALVAR}              id=save-instance-params
${SALVAR_2}            xpath=(//span[contains(.,'Salvar')])[2]
${INICIAR}             xpath=//button[contains(@aria-label,'Iniciar')]
${SUCESSO}             xpath=//h4[@class='notification-title'][contains(.,'Sucesso!')]
${PARAR}               xpath=//button[@aria-label='Parar']
${CONFIRMAR_PARAR}     name=confirm


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
Eu clico em criar robôs
    Click Element                       ${CRIAR_ROBO}
    Wait Until Page Contains Element    ${MODO_FACIL}
    Wait Until Page Contains Element    ${MODO_COMPLETO}
    Click Element                       ${ESCOLHER_ROBÔ}
    Wait Until Element Is Visible       ${VALE}
    Click Element                       ${CLICK_VALE}
    Sleep    5s
#    Click Element                       ${MODO_SIMULADO}
#    Wait Until Element Is Visible       dom:${NOME_ROBÔ}
#    Input Text                          dom:${NOME_ROBÔ}    Vale
#    Click Element                       ${AVANÇAR}
#    Wait Until Element Is Visible       ${SALVAR}
#    Click Element                       ${SALVAR}
#    Wait Until Element Is Visible       ${SALVAR_2}
#   Click Element                       ${SALVAR_2}
#    Wait Until Element Is Enabled       ${INICIAR}
#    Click Element                       ${INICIAR}

#Eu clico no botão de parar robô
#    Wait Until Element Is Visible    ${PARAR}
#    Click Element                    ${PARAR}
#    Wait Until Element Is Visible    ${CONFIRMAR_PARAR}
#    Click Element                    ${CONFIRMAR_PARAR}


#### ENTÃO
Devo conseguir criar um robô grátis com sucesso
    Sleep    5s
    Wait Until Element Is Visible    ${SUCESSO}

#O robô deve ser parado com sucesso
#    Sleep    7s
#    Wait Until Element Is Visible    ${SUCESSO}


#### TEARDOWN
Fechar navegador
    Capture Page Screenshot
    Close All Browsers
